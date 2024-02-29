; Auto-generated. Do not edit!


(cl:in-package agrosim-srv)


;//! \htmlinclude Cost-request.msg.html

(cl:defclass <Cost-request> (roslisp-msg-protocol:ros-message)
  ((Id
    :reader Id
    :initarg :Id
    :type cl:integer
    :initform 0))
)

(cl:defclass Cost-request (<Cost-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Cost-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Cost-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agrosim-srv:<Cost-request> is deprecated: use agrosim-srv:Cost-request instead.")))

(cl:ensure-generic-function 'Id-val :lambda-list '(m))
(cl:defmethod Id-val ((m <Cost-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-srv:Id-val is deprecated.  Use agrosim-srv:Id instead.")
  (Id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Cost-request>) ostream)
  "Serializes a message object of type '<Cost-request>"
  (cl:let* ((signed (cl:slot-value msg 'Id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Cost-request>) istream)
  "Deserializes a message object of type '<Cost-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Cost-request>)))
  "Returns string type for a service object of type '<Cost-request>"
  "agrosim/CostRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cost-request)))
  "Returns string type for a service object of type 'Cost-request"
  "agrosim/CostRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Cost-request>)))
  "Returns md5sum for a message object of type '<Cost-request>"
  "c231a7c7ef297dd0990c7c10eb4d3e0e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Cost-request)))
  "Returns md5sum for a message object of type 'Cost-request"
  "c231a7c7ef297dd0990c7c10eb4d3e0e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Cost-request>)))
  "Returns full string definition for message of type '<Cost-request>"
  (cl:format cl:nil "int32 Id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Cost-request)))
  "Returns full string definition for message of type 'Cost-request"
  (cl:format cl:nil "int32 Id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Cost-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Cost-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Cost-request
    (cl:cons ':Id (Id msg))
))
;//! \htmlinclude Cost-response.msg.html

(cl:defclass <Cost-response> (roslisp-msg-protocol:ros-message)
  ((Id
    :reader Id
    :initarg :Id
    :type cl:integer
    :initform 0)
   (Cost
    :reader Cost
    :initarg :Cost
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Cost-response (<Cost-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Cost-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Cost-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agrosim-srv:<Cost-response> is deprecated: use agrosim-srv:Cost-response instead.")))

(cl:ensure-generic-function 'Id-val :lambda-list '(m))
(cl:defmethod Id-val ((m <Cost-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-srv:Id-val is deprecated.  Use agrosim-srv:Id instead.")
  (Id m))

(cl:ensure-generic-function 'Cost-val :lambda-list '(m))
(cl:defmethod Cost-val ((m <Cost-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-srv:Cost-val is deprecated.  Use agrosim-srv:Cost instead.")
  (Cost m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Cost-response>) ostream)
  "Serializes a message object of type '<Cost-response>"
  (cl:let* ((signed (cl:slot-value msg 'Id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Cost))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'Cost))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Cost-response>) istream)
  "Deserializes a message object of type '<Cost-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Cost) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Cost)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Cost-response>)))
  "Returns string type for a service object of type '<Cost-response>"
  "agrosim/CostResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cost-response)))
  "Returns string type for a service object of type 'Cost-response"
  "agrosim/CostResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Cost-response>)))
  "Returns md5sum for a message object of type '<Cost-response>"
  "c231a7c7ef297dd0990c7c10eb4d3e0e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Cost-response)))
  "Returns md5sum for a message object of type 'Cost-response"
  "c231a7c7ef297dd0990c7c10eb4d3e0e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Cost-response>)))
  "Returns full string definition for message of type '<Cost-response>"
  (cl:format cl:nil "int32 Id~%float64[] Cost~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Cost-response)))
  "Returns full string definition for message of type 'Cost-response"
  (cl:format cl:nil "int32 Id~%float64[] Cost~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Cost-response>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Cost) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Cost-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Cost-response
    (cl:cons ':Id (Id msg))
    (cl:cons ':Cost (Cost msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Cost)))
  'Cost-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Cost)))
  'Cost-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cost)))
  "Returns string type for a service object of type '<Cost>"
  "agrosim/Cost")