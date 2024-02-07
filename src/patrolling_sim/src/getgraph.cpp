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

#include <ros/ros.h>

#include "getgraph.h"
using namespace std;


uint WIDTH_PX;
uint HEIGHT_PX;
float RESOLUTION;
//float WIDTH_M;
//float HEIGHT_M;
float OFFSET_X;
float OFFSET_Y;
uint number_tool;
uint toolDimension[10];

uint GetGraphDimension (const char* graph_file){
  
   FILE *file;
   file = fopen (graph_file,"r");
   uint dimension;
   uint chargePoints;

   if(file == NULL){
      ROS_INFO("Can not open filename %s", graph_file);
      ROS_BREAK();	
   }

   else{
      ROS_INFO("Graph File Opened. Reading Dimensions.\n");
      int r;
      r=fscanf (file, "%u", &dimension);//dimesion son los puntos a visitar
      
      //Initialize other dimension variables:
      r=fscanf (file, "%u", &WIDTH_PX);
      r=fscanf (file, "%u", &HEIGHT_PX);
      r=fscanf (file, "%f", &RESOLUTION);
      r=fscanf (file, "%f", &OFFSET_X);
      r=fscanf (file, "%f", &OFFSET_Y);
      //WIDTH_M = (float) WIDTH_PX * RESOLUTION;
      //HEIGHT_M = (float) HEIGHT_PX * RESOLUTION;
   }
   fclose(file);
   return dimension;
}

uint GetGraphDimensionTool (const char* graph_file,uint toolId){
  
   FILE *file;
   file = fopen (graph_file,"r");

   if(file == NULL){
      ROS_INFO("Can not open filename %s", graph_file);
      ROS_BREAK();  
   }

   else{
      ROS_INFO("Graph File Opened. Reading number of tools.\n");
      int r;
      r=fscanf (file, "%u", &number_tool);//number of tools 
      for (int i=0;i<number_tool;i++){
        r=fscanf (file, "%u", &toolDimension[i]);//number of tool
    } 
      //Initialize other dimension variables:
      r=fscanf (file, "%u", &WIDTH_PX);
      r=fscanf (file, "%u", &HEIGHT_PX);
      r=fscanf (file, "%f", &RESOLUTION);
      r=fscanf (file, "%f", &OFFSET_X);
      r=fscanf (file, "%f", &OFFSET_Y);
      //WIDTH_M = (float) WIDTH_PX * RESOLUTION;
      //HEIGHT_M = (float) HEIGHT_PX * RESOLUTION;
   }
   fclose(file);
   return toolDimension[toolId];
}


tuple<uint,uint> GetGraphChargePoints (const char* graph_file){
  
   FILE *file;
   file = fopen (graph_file,"r");
   uint dimension;
   uint chargePoints;

   if(file == NULL){
      ROS_INFO("Can not open filename %s", graph_file);
      ROS_BREAK();  
   }

   else{
      ROS_INFO("Graph File Opened. Reading Charge Info -------.\n");
      int r;
      r=fscanf (file, "%u", &dimension);//dimesion son los puntos a visitar
      r=fscanf (file, "%u", &chargePoints);// puntos de carga
      
      //Initialize other dimension variables:
      r=fscanf (file, "%u", &WIDTH_PX);
      r=fscanf (file, "%u", &HEIGHT_PX);
      r=fscanf (file, "%f", &RESOLUTION);
      r=fscanf (file, "%f", &OFFSET_X);
      r=fscanf (file, "%f", &OFFSET_Y);
      //WIDTH_M = (float) WIDTH_PX * RESOLUTION;
      //HEIGHT_M = (float) HEIGHT_PX * RESOLUTION;
   }
   fclose(file);
   tuple<uint,uint> valor= make_tuple(chargePoints,dimension);
   return valor;
}


void GetGraphInfo (vertex *vertex_web, uint dimension, const char* graph_file){
   
   FILE *file;
   file = fopen (graph_file,"r");
   
   if(file == NULL){
      ROS_INFO("Can not open filename %s", graph_file);
      ROS_BREAK();	
   }else{
      ROS_INFO("Graph File Opened. Getting Graph Info.\n");
      
      uint i,j;
      float temp;
      int r;
      
      //Start Reading the File from FIRST_VID On:
      for (i=0; i<FIRST_VID-1; i++){
        r=fscanf (file, "%f", &temp);
      }      
    for (i=0;i<dimension;i++){
       
    
    r=fscanf (file, "%u", &vertex_web[i].id);

    r=fscanf (file, "%f", &vertex_web[i].x);
    vertex_web[i].x *= RESOLUTION; //convert to m
    vertex_web[i].x += OFFSET_X;
    r=fscanf (file, "%f", &vertex_web[i].y);
    vertex_web[i].y *= RESOLUTION; //convert to m
    vertex_web[i].y += OFFSET_Y;
    

    r=fscanf (file, "%u", &vertex_web[i].num_neigh);


    
    for (j=0;j<vertex_web[i].num_neigh; j++){
      r=fscanf (file, "%u", &vertex_web[i].id_neigh[j]);
      r=fscanf (file, "%s", &vertex_web[i].dir[j]);
      r=fscanf (file, "%u", &vertex_web[i].cost[j]); 
        //can eventually be converted to meters also...
    }
    
      }     
      
   }

	
    //printf ("[v=10], x = %f (meters)\n",vertex_web[10].x); 

   fclose(file);   
   	  
  }


void GetGraph1Info (vertex *vertex_web,charge *charge_web, uint dimension, const char* graph_file,uint chargePoints){
   
   FILE *file;
   file = fopen (graph_file,"r");
   
   if(file == NULL){
      ROS_INFO("Can not open filename %s", graph_file);
      ROS_BREAK();  
   }else{
      ROS_INFO("Graph File Opened. Getting Graph Info of Charging Points.\n");
      
      uint i,j;
      float temp;
      int r;
      
      //Start Reading the File from FIRST_VID On:
      for (i=0; i<(FIRST_VID_1-1); i++){
        r=fscanf (file, "%f", &temp);

      }      

    for (i=0;i<chargePoints;i++){
    r=fscanf (file, "%u", &charge_web[i].id);


    r=fscanf (file, "%f", &charge_web[i].x);
    charge_web[i].x *= RESOLUTION; //convert to m
    charge_web[i].x += OFFSET_X;
    r=fscanf (file, "%f", &charge_web[i].y);
    charge_web[i].y *= RESOLUTION; //convert to m
    charge_web[i].y += OFFSET_Y;



    }

    for (i=0;i<dimension;i++){
    
   
    r=fscanf (file, "%u", &vertex_web[i].id);

    r=fscanf (file, "%f", &vertex_web[i].x);
    vertex_web[i].x *= RESOLUTION; //convert to m
    vertex_web[i].x += OFFSET_X;
    r=fscanf (file, "%f", &vertex_web[i].y);
    vertex_web[i].y *= RESOLUTION; //convert to m
    vertex_web[i].y += OFFSET_Y;
    

    r=fscanf (file, "%u", &vertex_web[i].num_neigh);


    
    for (j=0;j<vertex_web[i].num_neigh; j++){

      r=fscanf (file, "%u", &vertex_web[i].id_neigh[j]);
      r=fscanf (file, "%s", &vertex_web[i].dir[j]);
      r=fscanf (file, "%u", &vertex_web[i].cost[j]); 
        //can eventually be converted to meters also...
    }
    
      }     
      
   }

    
    //printf ("[v=10], x = %f (meters)\n",vertex_web[10].x); 

   fclose(file);   
      
  } 

void GetGraph2Info (vertex *vertex_web, uint dimension, const char* graph_file,uint toolId){
   
   FILE *file;
   file = fopen (graph_file,"r");
   
   if(file == NULL){
      ROS_INFO("Can not open filename %s", graph_file);
      ROS_BREAK();  
   }else{
      ROS_INFO("Graph File Opened. Getting Graph Info Of Tools Nodes.\n");
      
      uint i,j,h;
      float temp;
      int r;
      uint Dimensionsalto;
      
      //Start Reading the File from FIRST_VID On:
      for (i=0; i<FIRST_VID+number_tool-1; i++){
        r=fscanf (file, "%f", &temp);
      }      

    
    for (i=0;i<toolId;i++){
    Dimensionsalto=toolDimension[i];   
    //ROS_INFO("Dimensionsalto %d",Dimensionsalto); 
    r=fscanf (file, "%f", &temp);  // Con esto saltamos el id del tool
    //ROS_INFO("Dentro %f",temp);
        for(h=0;h<Dimensionsalto;h++){
            //ROS_INFO("Dentro1 %f",temp);
            for(j=0;j<3;j++){
               r=fscanf (file, "%f", &temp);  
                //ROS_INFO("Dentro2 %f",temp);
               //Saltamos las cordenadas del punto
            }
                r=fscanf (file, "%u", &vertex_web[0].num_neigh);
                //ROS_INFO("Vecinos:%u",neighbors);

                //ROS_INFO("neighbors: %d",neighbors);
                
            for(j=0;j<vertex_web[0].num_neigh;j++){
                r=fscanf (file, "%f", &temp);
                //ROS_INFO("Dentro3 %f",temp);
                r=fscanf (file, "%s", &vertex_web[0].dir[0]);
                //ROS_INFO("Dentro3 %s",tempstr);
                r=fscanf (file, "%f", &temp);
                //ROS_INFO("Dentro3 %f",temp);
                 //Saltamos la información del vecion
            }
            } 
    }
    r=fscanf (file, "%f", &temp);
    for (i=0;i<dimension;i++){
    //ROS_INFO("Dentro 4")  ;
       
    r=fscanf (file, "%u", &vertex_web[i].id);
    //ROS_INFO("Id:%u",vertex_web[i].id);

    r=fscanf (file, "%f", &vertex_web[i].x);
    //ROS_INFO("X:%f",vertex_web[i].x);
    vertex_web[i].x *= RESOLUTION; //convert to m
    vertex_web[i].x += OFFSET_X;
    
    r=fscanf (file, "%f", &vertex_web[i].y);
    //ROS_INFO("Y:%f",vertex_web[i].y);
    vertex_web[i].y *= RESOLUTION; //convert to m
    vertex_web[i].y += OFFSET_Y;
    
    

    r=fscanf (file, "%u", &vertex_web[i].num_neigh);
    //ROS_INFO("Vecinos:%u",vertex_web[i].num_neigh);

    
    for (j=0;j<vertex_web[i].num_neigh; j++){
      r=fscanf (file, "%u", &vertex_web[i].id_neigh[j]);
      r=fscanf (file, "%s", &vertex_web[i].dir[j]);
      r=fscanf (file, "%u", &vertex_web[i].cost[j]); 
        //can eventually be converted to meters also...
    }
    
      }     
   }

    
    //printf ("[v=10], x = %f (meters)\n",vertex_web[10].x); 

   fclose(file);   

   

  } 
  
uint IdentifyVertex (vertex *vertex_web, uint size, double x, double y){
  
  uint i, v=0;
  double dif_x, dif_y, result=INFINITY;
  
  for (i=0; i<size; i++){
    dif_x = vertex_web[i].x - x;
    dif_y = vertex_web[i].y - y;
    
//     printf("[%u] result = %f, (dif_x+dif_y) = %f\n",i,result, fabs(dif_x) + fabs(dif_y));
    if( result > fabs (dif_x) + fabs (dif_y) ){ //Identify the Vertex closer to the initial coordinates x & y
      result = fabs (dif_x) + fabs (dif_y);
      v = i;
    }
  }
  return v;  
}

uint GetNumberEdges (vertex *vertex_web, uint dimension){
  
  uint result = 0;
  
  for (uint i=0; i<dimension; i++){
    for (uint j=0; j<vertex_web[i].num_neigh; j++){   

      if (vertex_web[i].id < vertex_web[i].id_neigh[j]){
	result++;
      }      
    }    
  }
  
  return result;
  
}

//integer to array (itoa for linux c)
char* itoa(int value, char* str, int radix) {
    static char dig[] =
        "0123456789"
        "abcdefghijklmnopqrstuvwxyz";
    int n = 0, neg = 0;
    unsigned int v;
    char* p, *q;
    char c;

    if (radix == 10 && value < 0) {
        value = -value;
        neg = 1;
    }
    v = value;
    do {
        str[n++] = dig[v%radix];
        v /= radix;
    } while (v);
    if (neg)
        str[n++] = '-';
    str[n] = '\0';

    for (p = str, q = p + (n-1); p < q; ++p, --q)
        c = *p, *p = *q, *q = c;
    return str;
}


