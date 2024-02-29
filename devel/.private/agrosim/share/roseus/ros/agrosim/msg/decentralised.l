;; Auto-generated. Do not edit!


(when (boundp 'agrosim::decentralised)
  (if (not (find-package "AGROSIM"))
    (make-package "AGROSIM"))
  (shadow 'decentralised (find-package "AGROSIM")))
(unless (find-package "AGROSIM::DECENTRALISED")
  (make-package "AGROSIM::DECENTRALISED"))

(in-package "ROS")
;;//! \htmlinclude decentralised.msg.html


(defclass agrosim::decentralised
  :super ros::object
  :slots (_Id _pos_x _pos_y _task _cost ))

(defmethod agrosim::decentralised
  (:init
   (&key
    ((:Id __Id) 0)
    ((:pos_x __pos_x) 0.0)
    ((:pos_y __pos_y) 0.0)
    ((:task __task) 0.0)
    ((:cost __cost) 0.0)
    )
   (send-super :init)
   (setq _Id (round __Id))
   (setq _pos_x (float __pos_x))
   (setq _pos_y (float __pos_y))
   (setq _task (float __task))
   (setq _cost (float __cost))
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
  (:serialization-length
   ()
   (+
    ;; int32 _Id
    4
    ;; float64 _pos_x
    8
    ;; float64 _pos_y
    8
    ;; float64 _task
    8
    ;; float64 _cost
    8
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
     ;; float64 _task
       (sys::poke _task (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _cost
       (sys::poke _cost (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _task
     (setq _task (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _cost
     (setq _cost (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get agrosim::decentralised :md5sum-) "a57c22726ed875c837261edd9574097f")
(setf (get agrosim::decentralised :datatype-) "agrosim/decentralised")
(setf (get agrosim::decentralised :definition-)
      "int32 Id
float64 pos_x
float64 pos_y
float64 task
float64 cost
")



(provide :agrosim/decentralised "a57c22726ed875c837261edd9574097f")


