// Generated by gencpp from file agrosim/CostRequest.msg
// DO NOT EDIT!


#ifndef AGROSIM_MESSAGE_COSTREQUEST_H
#define AGROSIM_MESSAGE_COSTREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace agrosim
{
template <class ContainerAllocator>
struct CostRequest_
{
  typedef CostRequest_<ContainerAllocator> Type;

  CostRequest_()
    : Id(0)  {
    }
  CostRequest_(const ContainerAllocator& _alloc)
    : Id(0)  {
  (void)_alloc;
    }



   typedef int32_t _Id_type;
  _Id_type Id;





  typedef boost::shared_ptr< ::agrosim::CostRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::agrosim::CostRequest_<ContainerAllocator> const> ConstPtr;

}; // struct CostRequest_

typedef ::agrosim::CostRequest_<std::allocator<void> > CostRequest;

typedef boost::shared_ptr< ::agrosim::CostRequest > CostRequestPtr;
typedef boost::shared_ptr< ::agrosim::CostRequest const> CostRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::agrosim::CostRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::agrosim::CostRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::agrosim::CostRequest_<ContainerAllocator1> & lhs, const ::agrosim::CostRequest_<ContainerAllocator2> & rhs)
{
  return lhs.Id == rhs.Id;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::agrosim::CostRequest_<ContainerAllocator1> & lhs, const ::agrosim::CostRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace agrosim

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::agrosim::CostRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::agrosim::CostRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::agrosim::CostRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::agrosim::CostRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::agrosim::CostRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::agrosim::CostRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::agrosim::CostRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4c256f183ddb18ca1c8cac601691eb32";
  }

  static const char* value(const ::agrosim::CostRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4c256f183ddb18caULL;
  static const uint64_t static_value2 = 0x1c8cac601691eb32ULL;
};

template<class ContainerAllocator>
struct DataType< ::agrosim::CostRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "agrosim/CostRequest";
  }

  static const char* value(const ::agrosim::CostRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::agrosim::CostRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 Id\n"
;
  }

  static const char* value(const ::agrosim::CostRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::agrosim::CostRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.Id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CostRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::agrosim::CostRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::agrosim::CostRequest_<ContainerAllocator>& v)
  {
    s << indent << "Id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.Id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // AGROSIM_MESSAGE_COSTREQUEST_H
