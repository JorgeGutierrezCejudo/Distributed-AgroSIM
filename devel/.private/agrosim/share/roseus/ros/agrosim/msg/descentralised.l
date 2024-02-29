;; Auto-generated. Do not edit!


(when (boundp 'agrosim::descentralised)
  (if (not (find-package "AGROSIM"))
    (make-package "AGROSIM"))
  (shadow 'descentralised (find-package "AGROSIM")))
(unless (find-package "AGROSIM::DESCENTRALISED")
  (make-package "AGROSIM::DESCENTRALISED"))

(in-package "ROS")
;;//! \htmlinclude descentralised.msg.html


(defclass agrosim::descentralised
  :super ros::object
  :slots (_Id _pos_x _pos_y _task _cost _taskdone _others ))

(defmethod agrosim::descentralised
  (:init
   (&key
    ((:Id __Id) 0)
    ((:pos_x __pos_x) 0.0)
    ((:pos_y __pos_y) 0.0)
    ((:task __task) 0)
    ((:cost __cost) 0.0)
    ((:taskdone __taskdone) (make-array 0 :initial-element 0 :element-type :integer))
    ((:others __others) (instance agrosim::neighbour :init))
    )
   (send-super :init)
   (setq _Id (round __Id))
   (setq _pos_x (float __pos_x))
   (setq _pos_y (float __pos_y))
   (setq _task (round __task))
   (setq _cost (float __cost))
   (setq _taskdone __taskdone)
   (setq _others __others)
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
  (:task
   (&optional __task)
   (if __task (setq _task __task)) _task)
  (:cost
   (&optional __cost)
   (if __cost (setq _cost __cost)) _cost)
  (:taskdone
   (&optional __taskdone)
   (if __taskdone (setq _taskdone __taskdone)) _taskdone)
  (:others
   (&rest __others)
   (if (keywordp (car __others))
       (send* _others __others)
     (progn
       (if __others (setq _others (car __others)))
       _others)))
  (:serialization-length
   ()
   (+
    ;; int32 _Id
    4
    ;; float64 _pos_x
    8
    ;; float64 _pos_y
    8
    ;; int32 _task
    4
    ;; float64 _cost
    8
    ;; int32[] _taskdone
    (* 4    (length _taskdone)) 4
    ;; agrosim/neighbour _others
    (send _others :serialization-length)
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
     ;; int32 _task
       (write-long _task s)
     ;; float64 _cost
       (sys::poke _cost (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int32[] _taskdone
     (write-long (length _taskdone) s)
     (dotimes (i (length _taskdone))
       (write-long (elt _taskdone i) s)
       )
     ;; agrosim/neighbour _others
       (send _others :serialize s)
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
   ;; int32 _task
     (setq _task (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _cost
     (setq _cost (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int32[] _taskdone
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _taskdone (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _taskdone i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; agrosim/neighbour _others
     (send _others :deserialize buf ptr-) (incf ptr- (send _others :serialization-length))
   ;;
   self)
  )

(setf (get agrosim::descentralised :md5sum-) "26872adb2b4262c73d17f57e4c48e1dc")
(setf (get agrosim::descentralised :datatype-) "agrosim/descentralised")
(setf (get agrosim::descentralised :definition-)
      "int32 Id
float64 pos_x
float64 pos_y
int32 task
float64 cost
int32[] taskdone
agrosim/neighbour others


================================================================================
MSG: agrosim/neighbour
int32[] Id
int32[] Task
int32 row
int32 column
float64[]  costs
")



(provide :agrosim/descentralised "26872adb2b4262c73d17f57e4c48e1dc")


