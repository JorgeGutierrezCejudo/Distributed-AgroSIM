; Auto-generated. Do not edit!


(cl:in-package patrolling_sim-msg)


;//! \htmlinclude XCordenate.msg.html

(cl:defclass <XCordenate> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:float
    :initform 0.0)
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
   (pos_z
    :reader pos_z
    :initarg :pos_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass XCordenate (<XCordenate>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <XCordenate>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'XCordenate)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrolling_sim-msg:<XCordenate> is deprecated: use patrolling_sim-msg:XCordenate instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <XCordenate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrolling_sim-msg:id-val is deprecated.  Use patrolling_sim-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'pos_x-val :lambda-list '(m))
(cl:defmethod pos_x-val ((m <XCordenate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrolling_sim-msg:pos_x-val is deprecated.  Use patrolling_sim-msg:pos_x instead.")
  (pos_x m))

(cl:ensure-generic-function 'pos_y-val :lambda-list '(m))
(cl:defmethod pos_y-val ((m <XCordenate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrolling_sim-msg:pos_y-val is deprecated.  Use patrolling_sim-msg:pos_y instead.")
  (pos_y m))

(cl:ensure-generic-function 'pos_z-val :lambda-list '(m))
(cl:defmethod pos_z-val ((m <XCordenate>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrolling_sim-msg:pos_z-val is deprecated.  Use patrolling_sim-msg:pos_z instead.")
  (pos_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <XCordenate>) ostream)
  "Serializes a message object of type '<XCordenate>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pos_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pos_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pos_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <XCordenate>) istream)
  "Deserializes a message object of type '<XCordenate>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'id) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pos_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<XCordenate>)))
  "Returns string type for a message object of type '<XCordenate>"
  "patrolling_sim/XCordenate")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'XCordenate)))
  "Returns string type for a message object of type 'XCordenate"
  "patrolling_sim/XCordenate")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<XCordenate>)))
  "Returns md5sum for a message object of type '<XCordenate>"
  "c213711658154fb72129b0e78c0cdf8a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'XCordenate)))
  "Returns md5sum for a message object of type 'XCordenate"
  "c213711658154fb72129b0e78c0cdf8a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<XCordenate>)))
  "Returns full string definition for message of type '<XCordenate>"
  (cl:format cl:nil "float32 id~%float32 pos_x~%float32 pos_y~%float32 pos_z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'XCordenate)))
  "Returns full string definition for message of type 'XCordenate"
  (cl:format cl:nil "float32 id~%float32 pos_x~%float32 pos_y~%float32 pos_z~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <XCordenate>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <XCordenate>))
  "Converts a ROS message object to a list"
  (cl:list 'XCordenate
    (cl:cons ':id (id msg))
    (cl:cons ':pos_x (pos_x msg))
    (cl:cons ':pos_y (pos_y msg))
    (cl:cons ':pos_z (pos_z msg))
))
