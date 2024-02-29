; Auto-generated. Do not edit!


(cl:in-package agrosim-srv)


;//! \htmlinclude Decision-request.msg.html

(cl:defclass <Decision-request> (roslisp-msg-protocol:ros-message)
  ((Ids
    :reader Ids
    :initarg :Ids
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (Task
    :reader Task
    :initarg :Task
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass Decision-request (<Decision-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Decision-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Decision-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agrosim-srv:<Decision-request> is deprecated: use agrosim-srv:Decision-request instead.")))

(cl:ensure-generic-function 'Ids-val :lambda-list '(m))
(cl:defmethod Ids-val ((m <Decision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-srv:Ids-val is deprecated.  Use agrosim-srv:Ids instead.")
  (Ids m))

(cl:ensure-generic-function 'Task-val :lambda-list '(m))
(cl:defmethod Task-val ((m <Decision-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-srv:Task-val is deprecated.  Use agrosim-srv:Task instead.")
  (Task m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Decision-request>) ostream)
  "Serializes a message object of type '<Decision-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'Ids))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'Task))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'Task))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Decision-request>) istream)
  "Deserializes a message object of type '<Decision-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'Task) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'Task)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Decision-request>)))
  "Returns string type for a service object of type '<Decision-request>"
  "agrosim/DecisionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Decision-request)))
  "Returns string type for a service object of type 'Decision-request"
  "agrosim/DecisionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Decision-request>)))
  "Returns md5sum for a message object of type '<Decision-request>"
  "654ef0f93a4707fa911e286e21ab84e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Decision-request)))
  "Returns md5sum for a message object of type 'Decision-request"
  "654ef0f93a4707fa911e286e21ab84e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Decision-request>)))
  "Returns full string definition for message of type '<Decision-request>"
  (cl:format cl:nil "int32[] Ids~%int32[] Task~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Decision-request)))
  "Returns full string definition for message of type 'Decision-request"
  (cl:format cl:nil "int32[] Ids~%int32[] Task~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Decision-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'Task) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Decision-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Decision-request
    (cl:cons ':Ids (Ids msg))
    (cl:cons ':Task (Task msg))
))
;//! \htmlinclude Decision-response.msg.html

(cl:defclass <Decision-response> (roslisp-msg-protocol:ros-message)
  ((Verification
    :reader Verification
    :initarg :Verification
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Decision-response (<Decision-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Decision-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Decision-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agrosim-srv:<Decision-response> is deprecated: use agrosim-srv:Decision-response instead.")))

(cl:ensure-generic-function 'Verification-val :lambda-list '(m))
(cl:defmethod Verification-val ((m <Decision-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-srv:Verification-val is deprecated.  Use agrosim-srv:Verification instead.")
  (Verification m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Decision-response>) ostream)
  "Serializes a message object of type '<Decision-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'Verification) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Decision-response>) istream)
  "Deserializes a message object of type '<Decision-response>"
    (cl:setf (cl:slot-value msg 'Verification) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Decision-response>)))
  "Returns string type for a service object of type '<Decision-response>"
  "agrosim/DecisionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Decision-response)))
  "Returns string type for a service object of type 'Decision-response"
  "agrosim/DecisionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Decision-response>)))
  "Returns md5sum for a message object of type '<Decision-response>"
  "654ef0f93a4707fa911e286e21ab84e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Decision-response)))
  "Returns md5sum for a message object of type 'Decision-response"
  "654ef0f93a4707fa911e286e21ab84e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Decision-response>)))
  "Returns full string definition for message of type '<Decision-response>"
  (cl:format cl:nil "bool Verification~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Decision-response)))
  "Returns full string definition for message of type 'Decision-response"
  (cl:format cl:nil "bool Verification~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Decision-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Decision-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Decision-response
    (cl:cons ':Verification (Verification msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Decision)))
  'Decision-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Decision)))
  'Decision-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Decision)))
  "Returns string type for a service object of type '<Decision>"
  "agrosim/Decision")