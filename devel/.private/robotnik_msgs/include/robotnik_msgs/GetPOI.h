// Generated by gencpp from file robotnik_msgs/GetPOI.msg
// DO NOT EDIT!


#ifndef ROBOTNIK_MSGS_MESSAGE_GETPOI_H
#define ROBOTNIK_MSGS_MESSAGE_GETPOI_H

#include <ros/service_traits.h>


#include <robotnik_msgs/GetPOIRequest.h>
#include <robotnik_msgs/GetPOIResponse.h>


namespace robotnik_msgs
{

struct GetPOI
{

typedef GetPOIRequest Request;
typedef GetPOIResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetPOI
} // namespace robotnik_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robotnik_msgs::GetPOI > {
  static const char* value()
  {
    return "c5032edb76b04b9d8b131adfe4028b48";
  }

  static const char* value(const ::robotnik_msgs::GetPOI&) { return value(); }
};

template<>
struct DataType< ::robotnik_msgs::GetPOI > {
  static const char* value()
  {
    return "robotnik_msgs/GetPOI";
  }

  static const char* value(const ::robotnik_msgs::GetPOI&) { return value(); }
};


// service_traits::MD5Sum< ::robotnik_msgs::GetPOIRequest> should match
// service_traits::MD5Sum< ::robotnik_msgs::GetPOI >
template<>
struct MD5Sum< ::robotnik_msgs::GetPOIRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robotnik_msgs::GetPOI >::value();
  }
  static const char* value(const ::robotnik_msgs::GetPOIRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotnik_msgs::GetPOIRequest> should match
// service_traits::DataType< ::robotnik_msgs::GetPOI >
template<>
struct DataType< ::robotnik_msgs::GetPOIRequest>
{
  static const char* value()
  {
    return DataType< ::robotnik_msgs::GetPOI >::value();
  }
  static const char* value(const ::robotnik_msgs::GetPOIRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robotnik_msgs::GetPOIResponse> should match
// service_traits::MD5Sum< ::robotnik_msgs::GetPOI >
template<>
struct MD5Sum< ::robotnik_msgs::GetPOIResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robotnik_msgs::GetPOI >::value();
  }
  static const char* value(const ::robotnik_msgs::GetPOIResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotnik_msgs::GetPOIResponse> should match
// service_traits::DataType< ::robotnik_msgs::GetPOI >
template<>
struct DataType< ::robotnik_msgs::GetPOIResponse>
{
  static const char* value()
  {
    return DataType< ::robotnik_msgs::GetPOI >::value();
  }
  static const char* value(const ::robotnik_msgs::GetPOIResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOTNIK_MSGS_MESSAGE_GETPOI_H