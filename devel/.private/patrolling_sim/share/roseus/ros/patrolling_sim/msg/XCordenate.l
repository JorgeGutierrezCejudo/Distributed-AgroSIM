;; Auto-generated. Do not edit!


(when (boundp 'patrolling_sim::XCordenate)
  (if (not (find-package "PATROLLING_SIM"))
    (make-package "PATROLLING_SIM"))
  (shadow 'XCordenate (find-package "PATROLLING_SIM")))
(unless (find-package "PATROLLING_SIM::XCORDENATE")
  (make-package "PATROLLING_SIM::XCORDENATE"))

(in-package "ROS")
;;//! \htmlinclude XCordenate.msg.html


(defclass patrolling_sim::XCordenate
  :super ros::object
  :slots (_id _pos_x _pos_y _pos_z ))

(defmethod patrolling_sim::XCordenate
  (:init
   (&key
    ((:id __id) 0.0)
    ((:pos_x __pos_x) 0.0)
    ((:pos_y __pos_y) 0.0)
    ((:pos_z __pos_z) 0.0)
    )
   (send-super :init)
   (setq _id (float __id))
   (setq _pos_x (float __pos_x))
   (setq _pos_y (float __pos_y))
   (setq _pos_z (float __pos_z))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pos_x
   (&optional __pos_x)
   (if __pos_x (setq _pos_x __pos_x)) _pos_x)
  (:pos_y
   (&optional __pos_y)
   (if __pos_y (setq _pos_y __pos_y)) _pos_y)
  (:pos_z
   (&optional __pos_z)
   (if __pos_z (setq _pos_z __pos_z)) _pos_z)
  (:serialization-length
   ()
   (+
    ;; float32 _id
    4
    ;; float32 _pos_x
    4
    ;; float32 _pos_y
    4
    ;; float32 _pos_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _id
       (sys::poke _id (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pos_x
       (sys::poke _pos_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pos_y
       (sys::poke _pos_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pos_z
       (sys::poke _pos_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _id
     (setq _id (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pos_x
     (setq _pos_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pos_y
     (setq _pos_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pos_z
     (setq _pos_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get patrolling_sim::XCordenate :md5sum-) "c213711658154fb72129b0e78c0cdf8a")
(setf (get patrolling_sim::XCordenate :datatype-) "patrolling_sim/XCordenate")
(setf (get patrolling_sim::XCordenate :definition-)
      "float32 id
float32 pos_x
float32 pos_y
float32 pos_z


")



(provide :patrolling_sim/XCordenate "c213711658154fb72129b0e78c0cdf8a")


