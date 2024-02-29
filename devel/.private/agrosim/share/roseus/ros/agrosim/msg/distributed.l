;; Auto-generated. Do not edit!


(when (boundp 'agrosim::distributed)
  (if (not (find-package "AGROSIM"))
    (make-package "AGROSIM"))
  (shadow 'distributed (find-package "AGROSIM")))
(unless (find-package "AGROSIM::DISTRIBUTED")
  (make-package "AGROSIM::DISTRIBUTED"))

(in-package "ROS")
;;//! \htmlinclude distributed.msg.html


(defclass agrosim::distributed
  :super ros::object
  :slots (_Id _pos_x _pos_y _Costs _taskdone ))

(defmethod agrosim::distributed
  (:init
   (&key
    ((:Id __Id) 0)
    ((:pos_x __pos_x) 0.0)
    ((:pos_y __pos_y) 0.0)
    ((:Costs __Costs) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:taskdone __taskdone) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _Id (round __Id))
   (setq _pos_x (float __pos_x))
   (setq _pos_y (float __pos_y))
   (setq _Costs __Costs)
   (setq _taskdone __taskdone)
   self)
  (:Id
   (&optional __Id)
   (if __Id (setq _Id __Id)) _Id)
  (:pos_x
   (&optional __pos_x)
   (if __pos_x (setq _pos_x __pos_x)) _pos_x)
  (:pos_y
   (&optional __pos_y)
   (if __pos_y (setq _pos_y __pos_y)) _pos_y)
  (:Costs
   (&optional __Costs)
   (if __Costs (setq _Costs __Costs)) _Costs)
  (:taskdone
   (&optional __taskdone)
   (if __taskdone (setq _taskdone __taskdone)) _taskdone)
  (:serialization-length
   ()
   (+
    ;; int32 _Id
    4
    ;; float64 _pos_x
    8
    ;; float64 _pos_y
    8
    ;; float64[] _Costs
    (* 8    (length _Costs)) 4
    ;; int32[] _taskdone
    (* 4    (length _taskdone)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Id
       (write-long _Id s)
     ;; float64 _pos_x
       (sys::poke _pos_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pos_y
       (sys::poke _pos_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[] _Costs
     (write-long (length _Costs) s)
     (dotimes (i (length _Costs))
       (sys::poke (elt _Costs i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; int32[] _taskdone
     (write-long (length _taskdone) s)
     (dotimes (i (length _taskdone))
       (write-long (elt _taskdone i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Id
     (setq _Id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _pos_x
     (setq _pos_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pos_y
     (setq _pos_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[] _Costs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Costs (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _Costs i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; int32[] _taskdone
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _taskdone (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _taskdone i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get agrosim::distributed :md5sum-) "c9bb0f30a8a9f957e8ed5112fb6abd78")
(setf (get agrosim::distributed :datatype-) "agrosim/distributed")
(setf (get agrosim::distributed :definition-)
      "int32 Id
float64 pos_x
float64 pos_y
float64[] Costs
int32[] taskdone


")



(provide :agrosim/distributed "c9bb0f30a8a9f957e8ed5112fb6abd78")


