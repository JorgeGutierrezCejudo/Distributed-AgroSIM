; Auto-generated. Do not edit!


(cl:in-package agrosim-msg)


;//! \htmlinclude descentralised.msg.html

(cl:defclass <descentralised> (roslisp-msg-protocol:ros-message)
  ((Id
    :reader Id
    :initarg :Id
    :type cl:integer
    :initform 0)
   (pos_x
    :reader pos_x
    :initarg :pos_x
    :type cl:float
    :initform 0.0)
   (pos_y
    :reader pos_y
    :initarg :pos_y
    :type cl:float
    :initform 0.0)
   (task
    :reader task
    :initarg :task
    :type cl:integer
    :initform 0)
   (cost
    :reader cost
    :initarg :cost
    :type cl:float
    :initform 0.0)
   (taskdone
    :reader taskdone
    :initarg :taskdone
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (others
    :reader others
    :initarg :others
    :type agrosim-msg:neighbour
    :initform (cl:make-instance 'agrosim-msg:neighbour)))
)

(cl:defclass descentralised (<descentralised>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <descentralised>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'descentralised)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name agrosim-msg:<descentralised> is deprecated: use agrosim-msg:descentralised instead.")))

(cl:ensure-generic-function 'Id-val :lambda-list '(m))
(cl:defmethod Id-val ((m <descentralised>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-msg:Id-val is deprecated.  Use agrosim-msg:Id instead.")
  (Id m))

(cl:ensure-generic-function 'pos_x-val :lambda-list '(m))
(cl:defmethod pos_x-val ((m <descentralised>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-msg:pos_x-val is deprecated.  Use agrosim-msg:pos_x instead.")
  (pos_x m))

(cl:ensure-generic-function 'pos_y-val :lambda-list '(m))
(cl:defmethod pos_y-val ((m <descentralised>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-msg:pos_y-val is deprecated.  Use agrosim-msg:pos_y instead.")
  (pos_y m))

(cl:ensure-generic-function 'task-val :lambda-list '(m))
(cl:defmethod task-val ((m <descentralised>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-msg:task-val is deprecated.  Use agrosim-msg:task instead.")
  (task m))

(cl:ensure-generic-function 'cost-val :lambda-list '(m))
(cl:defmethod cost-val ((m <descentralised>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-msg:cost-val is deprecated.  Use agrosim-msg:cost instead.")
  (cost m))

(cl:ensure-generic-function 'taskdone-val :lambda-list '(m))
(cl:defmethod taskdone-val ((m <descentralised>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-msg:taskdone-val is deprecated.  Use agrosim-msg:taskdone instead.")
  (taskdone m))

(cl:ensure-generic-function 'others-val :lambda-list '(m))
(cl:defmethod others-val ((m <descentralised>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader agrosim-msg:others-val is deprecated.  Use agrosim-msg:others instead.")
  (others m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <descentralised>) ostream)
  "Serializes a message object of type '<descentralised>"
  (cl:let* ((signed (cl:slot-value msg 'Id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pos_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pos_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'task)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cost))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'taskdone))))
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
   (cl:slot-value msg 'taskdone))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'others) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <descentralised>) istream)
  "Deserializes a message object of type '<descentralised>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'task) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cost) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'taskdone) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'taskdone)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'others) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<descentralised>)))
  "Returns string type for a message object of type '<descentralised>"
  "agrosim/descentralised")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'descentralised)))
  "Returns string type for a message object of type 'descentralised"
  "agrosim/descentralised")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<descentralised>)))
  "Returns md5sum for a message object of type '<descentralised>"
  "26872adb2b4262c73d17f57e4c48e1dc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'descentralised)))
  "Returns md5sum for a message object of type 'descentralised"
  "26872adb2b4262c73d17f57e4c48e1dc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<descentralised>)))
  "Returns full string definition for message of type '<descentralised>"
  (cl:format cl:nil "int32 Id~%float64 pos_x~%float64 pos_y~%int32 task~%float64 cost~%int32[] taskdone~%agrosim/neighbour others~%~%~%================================================================================~%MSG: agrosim/neighbour~%int32[] Id~%int32[] Task~%int32 row~%int32 column~%float64[]  costs~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'descentralised)))
  "Returns full string definition for message of type 'descentralised"
  (cl:format cl:nil "int32 Id~%float64 pos_x~%float64 pos_y~%int32 task~%float64 cost~%int32[] taskdone~%agrosim/neighbour others~%~%~%================================================================================~%MSG: agrosim/neighbour~%int32[] Id~%int32[] Task~%int32 row~%int32 column~%float64[]  costs~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <descentralised>))
  (cl:+ 0
     4
     8
     8
     4
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'taskdone) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'others))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <descentralised>))
  "Converts a ROS message object to a list"
  (cl:list 'descentralised
    (cl:cons ':Id (Id msg))
    (cl:cons ':pos_x (pos_x msg))
    (cl:cons ':pos_y (pos_y msg))
    (cl:cons ':task (task msg))
    (cl:cons ':cost (cost msg))
    (cl:cons ':taskdone (taskdone msg))
    (cl:cons ':others (others msg))
))
