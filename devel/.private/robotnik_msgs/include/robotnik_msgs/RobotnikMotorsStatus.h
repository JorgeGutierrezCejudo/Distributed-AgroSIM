// Generated by gencpp from file robotnik_msgs/RobotnikMotorsStatus.msg
// DO NOT EDIT!


#ifndef ROBOTNIK_MSGS_MESSAGE_ROBOTNIKMOTORSSTATUS_H
#define ROBOTNIK_MSGS_MESSAGE_ROBOTNIKMOTORSSTATUS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <robotnik_msgs/MotorStatus.h>

namespace robotnik_msgs
{
template <class ContainerAllocator>
struct RobotnikMotorsStatus_
{
  typedef RobotnikMotorsStatus_<ContainerAllocator> Type;

  RobotnikMotorsStatus_()
    : state()
    , motor_status()  {
    }
  RobotnikMotorsStatus_(const ContainerAllocator& _alloc)
    : state(_alloc)
    , motor_status(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _state_type;
  _state_type state;

   typedef std::vector< ::robotnik_msgs::MotorStatus_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::robotnik_msgs::MotorStatus_<ContainerAllocator> >> _motor_status_type;
  _motor_status_type motor_status;





  typedef boost::shared_ptr< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> const> ConstPtr;

}; // struct RobotnikMotorsStatus_

typedef ::robotnik_msgs::RobotnikMotorsStatus_<std::allocator<void> > RobotnikMotorsStatus;

typedef boost::shared_ptr< ::robotnik_msgs::RobotnikMotorsStatus > RobotnikMotorsStatusPtr;
typedef boost::shared_ptr< ::robotnik_msgs::RobotnikMotorsStatus const> RobotnikMotorsStatusConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator1> & lhs, const ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator2> & rhs)
{
  return lhs.state == rhs.state &&
    lhs.motor_status == rhs.motor_status;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator1> & lhs, const ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace robotnik_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a6f76b778bb6c93074bf081a98ca69ac";
  }

  static const char* value(const ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa6f76b778bb6c930ULL;
  static const uint64_t static_value2 = 0x74bf081a98ca69acULL;
};

template<class ContainerAllocator>
struct DataType< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robotnik_msgs/RobotnikMotorsStatus";
  }

  static const char* value(const ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Global state of the component\n"
"string state\n"
"# Status of the motor drive\n"
"robotnik_msgs/MotorStatus[] motor_status\n"
"\n"
"\n"
"================================================================================\n"
"MSG: robotnik_msgs/MotorStatus\n"
"uint8 can_id\n"
"string joint\n"
"string state\n"
"string status\n"
"string communicationstatus\n"
"string mode_of_operation\n"
"string[] activestatusword\n"
"string[] activedriveflags\n"
"bool[] digitaloutputs\n"
"bool[] digitalinputs\n"
"float32 current\n"
"float32[] analoginputs\n"
"string statusword\n"
"string driveflags\n"
"\n"
"\n"
;
  }

  static const char* value(const ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.state);
      stream.next(m.motor_status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RobotnikMotorsStatus_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robotnik_msgs::RobotnikMotorsStatus_<ContainerAllocator>& v)
  {
    s << indent << "state: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.state);
    s << indent << "motor_status[]" << std::endl;
    for (size_t i = 0; i < v.motor_status.size(); ++i)
    {
      s << indent << "  motor_status[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::robotnik_msgs::MotorStatus_<ContainerAllocator> >::stream(s, indent + "    ", v.motor_status[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOTNIK_MSGS_MESSAGE_ROBOTNIKMOTORSSTATUS_H
