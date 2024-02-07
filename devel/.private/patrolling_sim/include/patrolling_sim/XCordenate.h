// Generated by gencpp from file patrolling_sim/XCordenate.msg
// DO NOT EDIT!


#ifndef PATROLLING_SIM_MESSAGE_XCORDENATE_H
#define PATROLLING_SIM_MESSAGE_XCORDENATE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace patrolling_sim
{
template <class ContainerAllocator>
struct XCordenate_
{
  typedef XCordenate_<ContainerAllocator> Type;

  XCordenate_()
    : id(0.0)
    , pos_x(0.0)
    , pos_y(0.0)
    , pos_z(0.0)  {
    }
  XCordenate_(const ContainerAllocator& _alloc)
    : id(0.0)
    , pos_x(0.0)
    , pos_y(0.0)
    , pos_z(0.0)  {
  (void)_alloc;
    }



   typedef float _id_type;
  _id_type id;

   typedef float _pos_x_type;
  _pos_x_type pos_x;

   typedef float _pos_y_type;
  _pos_y_type pos_y;

   typedef float _pos_z_type;
  _pos_z_type pos_z;





  typedef boost::shared_ptr< ::patrolling_sim::XCordenate_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::patrolling_sim::XCordenate_<ContainerAllocator> const> ConstPtr;

}; // struct XCordenate_

typedef ::patrolling_sim::XCordenate_<std::allocator<void> > XCordenate;

typedef boost::shared_ptr< ::patrolling_sim::XCordenate > XCordenatePtr;
typedef boost::shared_ptr< ::patrolling_sim::XCordenate const> XCordenateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::patrolling_sim::XCordenate_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::patrolling_sim::XCordenate_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::patrolling_sim::XCordenate_<ContainerAllocator1> & lhs, const ::patrolling_sim::XCordenate_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id &&
    lhs.pos_x == rhs.pos_x &&
    lhs.pos_y == rhs.pos_y &&
    lhs.pos_z == rhs.pos_z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::patrolling_sim::XCordenate_<ContainerAllocator1> & lhs, const ::patrolling_sim::XCordenate_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace patrolling_sim

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::patrolling_sim::XCordenate_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::patrolling_sim::XCordenate_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::patrolling_sim::XCordenate_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::patrolling_sim::XCordenate_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::patrolling_sim::XCordenate_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::patrolling_sim::XCordenate_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::patrolling_sim::XCordenate_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c213711658154fb72129b0e78c0cdf8a";
  }

  static const char* value(const ::patrolling_sim::XCordenate_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc213711658154fb7ULL;
  static const uint64_t static_value2 = 0x2129b0e78c0cdf8aULL;
};

template<class ContainerAllocator>
struct DataType< ::patrolling_sim::XCordenate_<ContainerAllocator> >
{
  static const char* value()
  {
    return "patrolling_sim/XCordenate";
  }

  static const char* value(const ::patrolling_sim::XCordenate_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::patrolling_sim::XCordenate_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 id\n"
"float32 pos_x\n"
"float32 pos_y\n"
"float32 pos_z\n"
"\n"
;
  }

  static const char* value(const ::patrolling_sim::XCordenate_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::patrolling_sim::XCordenate_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.pos_x);
      stream.next(m.pos_y);
      stream.next(m.pos_z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct XCordenate_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::patrolling_sim::XCordenate_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::patrolling_sim::XCordenate_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<float>::stream(s, indent + "  ", v.id);
    s << indent << "pos_x: ";
    Printer<float>::stream(s, indent + "  ", v.pos_x);
    s << indent << "pos_y: ";
    Printer<float>::stream(s, indent + "  ", v.pos_y);
    s << indent << "pos_z: ";
    Printer<float>::stream(s, indent + "  ", v.pos_z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PATROLLING_SIM_MESSAGE_XCORDENATE_H
