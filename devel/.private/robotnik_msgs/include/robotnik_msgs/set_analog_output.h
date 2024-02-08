// Generated by gencpp from file robotnik_msgs/set_analog_output.msg
// DO NOT EDIT!


#ifndef ROBOTNIK_MSGS_MESSAGE_SET_ANALOG_OUTPUT_H
#define ROBOTNIK_MSGS_MESSAGE_SET_ANALOG_OUTPUT_H

#include <ros/service_traits.h>


#include <robotnik_msgs/set_analog_outputRequest.h>
#include <robotnik_msgs/set_analog_outputResponse.h>


namespace robotnik_msgs
{

struct set_analog_output
{

typedef set_analog_outputRequest Request;
typedef set_analog_outputResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct set_analog_output
} // namespace robotnik_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::robotnik_msgs::set_analog_output > {
  static const char* value()
  {
    return "1f857604e9e8f27790b5ef70d33fca08";
  }

  static const char* value(const ::robotnik_msgs::set_analog_output&) { return value(); }
};

template<>
struct DataType< ::robotnik_msgs::set_analog_output > {
  static const char* value()
  {
    return "robotnik_msgs/set_analog_output";
  }

  static const char* value(const ::robotnik_msgs::set_analog_output&) { return value(); }
};


// service_traits::MD5Sum< ::robotnik_msgs::set_analog_outputRequest> should match
// service_traits::MD5Sum< ::robotnik_msgs::set_analog_output >
template<>
struct MD5Sum< ::robotnik_msgs::set_analog_outputRequest>
{
  static const char* value()
  {
    return MD5Sum< ::robotnik_msgs::set_analog_output >::value();
  }
  static const char* value(const ::robotnik_msgs::set_analog_outputRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotnik_msgs::set_analog_outputRequest> should match
// service_traits::DataType< ::robotnik_msgs::set_analog_output >
template<>
struct DataType< ::robotnik_msgs::set_analog_outputRequest>
{
  static const char* value()
  {
    return DataType< ::robotnik_msgs::set_analog_output >::value();
  }
  static const char* value(const ::robotnik_msgs::set_analog_outputRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::robotnik_msgs::set_analog_outputResponse> should match
// service_traits::MD5Sum< ::robotnik_msgs::set_analog_output >
template<>
struct MD5Sum< ::robotnik_msgs::set_analog_outputResponse>
{
  static const char* value()
  {
    return MD5Sum< ::robotnik_msgs::set_analog_output >::value();
  }
  static const char* value(const ::robotnik_msgs::set_analog_outputResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::robotnik_msgs::set_analog_outputResponse> should match
// service_traits::DataType< ::robotnik_msgs::set_analog_output >
template<>
struct DataType< ::robotnik_msgs::set_analog_outputResponse>
{
  static const char* value()
  {
    return DataType< ::robotnik_msgs::set_analog_output >::value();
  }
  static const char* value(const ::robotnik_msgs::set_analog_outputResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ROBOTNIK_MSGS_MESSAGE_SET_ANALOG_OUTPUT_H