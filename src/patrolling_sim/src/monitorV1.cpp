/*********************************************************************
*
* Software License Agreement (BSD License)
*
*  Copyright (c) 2014, ISR University of Coimbra.
*  All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions
*  are met:
*
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above
*     copyright notice, this list of conditions and the following
*     disclaimer in the documentation and/or other materials provided
*     with the distribution.
*   * Neither the name of the ISR University of Coimbra nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
*  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
*  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
*  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
*  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
*  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
*  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
*  POSSIBILITY OF SUCH DAMAGE.
*
* Author: David Portugal (2011-2014), and Luca Iocchi (2014-2016)
*********************************************************************/

#include <sys/stat.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <float.h>
#include <fstream>
#include <iostream>
#include <string>

#include <ros/ros.h>
#include <ros/package.h> //to get pkg path
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <std_msgs/Int16MultiArray.h>
#include <std_msgs/Bool.h>
#include <std_msgs/String.h>
#include<std_msgs/Float64MultiArray.h>

using namespace std;

#define NUM_MAX_ROBOTS 32
#define DEAD_ROBOT_TIME 300.0 // (seconds) time from last goal reached after which a robot is considered dead
#define TIMEOUT_WRITE_RESULTS 180.0 // (seconds) timeout for writing results to file 
// For hystograms
#define RESOLUTION 1.0 // seconds
#define MAXIDLENESS 500.0 // seconds
   // timeout for writing results to file when simulating forever

using std::string;
using std::cout;
using std::endl;

typedef unsigned int uint;

ros::Subscriber CostRoute;
ros::Subscriber Finish;

//Initialization:
bool initialize = true; // Initialization flag
uint teamsize;
int extraalg;
int robot_less,robot_more;
int goal;
double time_zero, last_report_time;
time_t real_time_zero;
double goal_reached_wait,comm_delay,lost_message_rate;
string algorithm, algparams, nav_mod, initial_positions;

const std::string PS_path = ros::package::getPath("patrolling_sim");	//D.Portugal => get pkg path

std::vector<float> vresults;
#define MAX_DIMENSION 200



size_t dimension; // graph size
uint chargePoints;
uint toolId;

float Distancia[MAX_DIMENSION];
int ID_ROBOT;
double more_distance;
double less_distance;
float totalcost;
float medianCost;
bool finish;



// Idleness file
FILE *idlfile;

// log file
FILE *logfile = NULL;

void CostRouteCB (std_msgs::Float64MultiArray msg){

    ID_ROBOT=msg.data[0];
    Distancia[ID_ROBOT]=Distancia[ID_ROBOT]+msg.data[1];
}

void FinishCB (std_msgs::Bool msg){

  finish=msg.data;
}




//write_results to file
void write_results (const char* teamsize_str,double duration, double real_duration, double comm_delay,
		            string filename) {

    FILE *file;
    
    printf("writing to file %s\n",filename.c_str());
    // printf("graph file %s\n",graph_file);
        
    file = fopen (filename.c_str(),"a");
    fprintf(file,"----------------------------------------------------------------------------------------------------------------------------------------------------------------\n\n\n");   
    fprintf(file,"*********************************************************************************************************************************************************\n\n\n");     
    fprintf(file, "\n                                                   REPORT INFORMATION                                  \n\n");
    fprintf(file,"*********************************************************************************************************************************************************\n\n\n");  
    fprintf(file,"\nCost info:\n");
    for (int i=0; i<teamsize; i++){
    fprintf(file,"   Robot %d travel :%f\n",i,Distancia[i]);
    }
    fprintf(file,"   Robot %d travel the most:%f\n",robot_more,more_distance);
    fprintf(file,"   Robot %d travel the lest:%f\n",robot_less,less_distance);
    fprintf(file,"   Total distance travel of all robots: %f\n",totalcost);
    fprintf(file,"   Median: %f\n",medianCost);

    
    fprintf(file,"----------------------------------------------------------------------------------------------------------------------------------------------------------------\n\n\n");    
    
    
    fclose(file); /*done!*/  


}

int main(int argc, char** argv){  //pass TEAMSIZE GRAPH ALGORITHM
  /*
  argc=3
  argv[0]=/.../patrolling_sim/bin/monitor
  argv[1]=grid
  argv[2]=ALGORITHM = {MSP,Cyc,CC,CR,HCR}
  argv[3]=TEAMSIZE
  */
  
  //ex: "rosrun patrolling_sim monitor maps/example/example.graph MSP 2"
  
//   uint teamsize;
  char teamsize_str[3];
  teamsize = atoi(argv[3]);
  extraalg=atoi(argv[5]);
  
  if ( teamsize >= NUM_MAX_ROBOTS || teamsize <1 ){
    ROS_INFO("The Teamsize must be an integer number between 1 and %d", NUM_MAX_ROBOTS);
    return 0;
  }else{
    strcpy (teamsize_str, argv[3]); 
//     printf("teamsize: %s\n", teamsize_str);
//     printf("teamsize: %u\n", teamsize);
  }
  
  
  algorithm = string(argv[2]);
  printf("Algorithm: %s\n",algorithm.c_str());
  
  string mapname = string(argv[1]);
  string graph_file = "maps/"+mapname+"/"+mapname+".graph";

  int GrafoNumber=atoi(argv[4]);

  printf("Graph number: %d\n",GrafoNumber);

  
     
  /** D.Portugal: needed in case you "rosrun" from another folder **/     
  chdir(PS_path.c_str());
  


  if (dimension>MAX_DIMENSION) {
    cout << "ERROR!!! dimension > MAX_DIMENSION (static value) !!!" << endl;
    abort();
  }
  printf("Dimension: %u\n",(uint)dimension);
   
  char hostname[80];
    
  int r = gethostname(hostname,80);
  if (r<0)
    strcpy(hostname,"default");
    
  printf("Host name: %s\n",hostname);
       
  
    // Scenario name (to be used in file and directory names)
    char sname[80];

    

    // Create directory results if does not exist
    string path1 = "results";
    
    string path2,path3,path4;
    
    path2 = path1 + "/" + mapname;
    path3 = path2 + "/" + algorithm;
    path4 = path3 + "/" + hostname;

    
    struct stat st;
    
    if (stat(path1.c_str(), &st) != 0)
      mkdir(path1.c_str(), 0777);
    if (stat(path2.c_str(), &st) != 0)
      mkdir(path2.c_str(), 0777);
    if (stat(path3.c_str(), &st) != 0)
      mkdir(path3.c_str(), 0777);
    if (stat(path4.c_str(), &st) != 0)
      mkdir(path4.c_str(), 0777);

    printf("Path experimental results: %s\n",path4.c_str());
    
    // Local time (real clock time)
    time_t rawtime;
    struct tm * timeinfo;
    char strnow[80];
    
    time (&rawtime);
    timeinfo = localtime(&rawtime);
    sprintf(strnow,"%d%02d%02d_%02d%02d%02d",  timeinfo->tm_year+1900,timeinfo->tm_mon+1,timeinfo->tm_mday,timeinfo->tm_hour,timeinfo->tm_min,timeinfo->tm_sec);
    printf("Date-time of the experiment: %s\n",strnow);
    
    // File to log all the idlenesses of an experimental scenario

    string idlfilename,resultsfilename,resultstimecsvfilename,expname; 
    expname = path4 + "/" + string(strnow);
    idlfilename = expname + "_idleness.csv";
    resultsfilename = expname + "_results.txt";
    resultstimecsvfilename = expname + "_timeresults.csv";

    FILE *fexplist;
    fexplist = fopen("experiments.txt", "a");
    fprintf(fexplist,"%s\n",expname.c_str());
    fclose(fexplist);

    idlfile = fopen (idlfilename.c_str(),"a");
    fprintf(idlfile,"Time;Robot;Node;Idleness;Interferences\n"); // header

    FILE *resultstimecsvfile;
    resultstimecsvfile = fopen(resultstimecsvfilename.c_str(), "w");

    fprintf(resultstimecsvfile,"Time;Idleness min;Idleness avg;Idleness stddev;Idleness max;Interferences\n"); // header


  //Wait for all robots to connect! (Exchange msgs)
  ros::init(argc, argv, "monitor");
  ros::NodeHandle nh;

  CostRoute=nh.subscribe("CostRoute",100,CostRouteCB);
   Finish=nh.subscribe("Finish",100,FinishCB);
  
  double duration = 0.0, real_duration = 0.0;
  
  ros::Rate loop_rate(30); //0.033 seconds or 30Hz
  
   
  double current_time = ros::Time::now().toSec();
  

  while( ros::ok() ){
    


            
      // check time
      double report_time = ros::Time::now().toSec();

      if (finish){ 

        printf("******************************************\n");
        float valor;
        more_distance=0;
        less_distance=100000;
      

        for (int i=0;i<teamsize;i++){

                valor=Distancia[i];

        if (valor>more_distance){
                more_distance=valor;
                robot_more=i;}
        if (valor<less_distance){
                less_distance=valor;
                robot_less=i;}

        totalcost=totalcost+valor;
        medianCost=totalcost/teamsize;}

        printf("Cost info\n");
        printf("   Robot %d travel the most:%f\n",robot_more,more_distance);
        printf("   Robot %d travel the lest:%f\n",robot_less,less_distance);
        printf("   Total distance travel of all robots: %f\n",totalcost);
        printf("   Median: %f\n",medianCost);

    

        write_results (teamsize_str, duration, real_duration, comm_delay,
                   resultsfilename);
                   finish=false;

		}



    current_time = ros::Time::now().toSec();
    ros::spinOnce();
    loop_rate.sleep();


        
  } // while ros ok

  ros::shutdown();

    duration = current_time-time_zero;
    time_t real_now; time (&real_now); 
    real_duration = (double)real_now - (double)real_time_zero;

  printf("Monitor closed.\n");

}

