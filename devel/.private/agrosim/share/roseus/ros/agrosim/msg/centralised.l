;; Auto-generated. Do not edit!


(when (boundp 'agrosim::centralised)
  (if (not (find-package "AGROSIM"))
    (make-package "AGROSIM"))
  (shadow 'centralised (find-package "AGROSIM")))
(unless (find-package "AGROSIM::CENTRALISED")
  (make-package "AGROSIM::CENTRALISED"))

(in-package "ROS")
;;//! \htmlinclude centralised.msg.html


(defclass agrosim::centralised
  :super ros::object
  :slots (_Id _pos_x _pos_y ))

(defmethod agrosim::centralised
  (:init
   (&key
    ((:Id __Id) 0)
    ((:pos_x __pos_x) 0.0)
    ((:pos_y __pos_y) 0.0)
    )
   (send-super :init)
   (setq _Id (round __Id))
   (setq _pos_x (float __pos_x))
   (setq _pos_y (float __pos_y))
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
  (:serialization-length
   ()
   (+
    ;; int32 _Id
    4
    ;; float64 _pos_x
    8
    ;; float64 _pos_y
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
   ;;
   self)
  )

(setf (get agrosim::centralised :md5sum-) "75665f1d63018aac0cb32965c9ec19d2")
(setf (get agrosim::centralised :datatype-) "agrosim/centralised")
(setf (get agrosim::centralised :definition-)
      "int32 Id
float64 pos_x
float64 pos_y

")



(provide :agrosim/centralised "75665f1d63018aac0cb32965c9ec19d2")


