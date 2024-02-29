;; Auto-generated. Do not edit!


(when (boundp 'agrosim::Cost)
  (if (not (find-package "AGROSIM"))
    (make-package "AGROSIM"))
  (shadow 'Cost (find-package "AGROSIM")))
(unless (find-package "AGROSIM::COST")
  (make-package "AGROSIM::COST"))
(unless (find-package "AGROSIM::COSTREQUEST")
  (make-package "AGROSIM::COSTREQUEST"))
(unless (find-package "AGROSIM::COSTRESPONSE")
  (make-package "AGROSIM::COSTRESPONSE"))

(in-package "ROS")





(defclass agrosim::CostRequest
  :super ros::object
  :slots (_Id ))

(defmethod agrosim::CostRequest
  (:init
   (&key
    ((:Id __Id) 0)
    )
   (send-super :init)
   (setq _Id (round __Id))
   self)
  (:Id
   (&optional __Id)
   (if __Id (setq _Id __Id)) _Id)
  (:serialization-length
   ()
   (+
    ;; int32 _Id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Id
       (write-long _Id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Id
     (setq _Id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass agrosim::CostResponse
  :super ros::object
  :slots (_Id _Cost ))

(defmethod agrosim::CostResponse
  (:init
   (&key
    ((:Id __Id) 0)
    ((:Cost __Cost) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _Id (round __Id))
   (setq _Cost __Cost)
   self)
  (:Id
   (&optional __Id)
   (if __Id (setq _Id __Id)) _Id)
  (:Cost
   (&optional __Cost)
   (if __Cost (setq _Cost __Cost)) _Cost)
  (:serialization-length
   ()
   (+
    ;; int32 _Id
    4
    ;; float64[] _Cost
    (* 8    (length _Cost)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Id
       (write-long _Id s)
     ;; float64[] _Cost
     (write-long (length _Cost) s)
     (dotimes (i (length _Cost))
       (sys::poke (elt _Cost i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Id
     (setq _Id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64[] _Cost
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Cost (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _Cost i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass agrosim::Cost
  :super ros::object
  :slots ())

(setf (get agrosim::Cost :md5sum-) "c231a7c7ef297dd0990c7c10eb4d3e0e")
(setf (get agrosim::Cost :datatype-) "agrosim/Cost")
(setf (get agrosim::Cost :request) agrosim::CostRequest)
(setf (get agrosim::Cost :response) agrosim::CostResponse)

(defmethod agrosim::CostRequest
  (:response () (instance agrosim::CostResponse :init)))

(setf (get agrosim::CostRequest :md5sum-) "c231a7c7ef297dd0990c7c10eb4d3e0e")
(setf (get agrosim::CostRequest :datatype-) "agrosim/CostRequest")
(setf (get agrosim::CostRequest :definition-)
      "int32 Id
---
int32 Id
float64[] Cost

")

(setf (get agrosim::CostResponse :md5sum-) "c231a7c7ef297dd0990c7c10eb4d3e0e")
(setf (get agrosim::CostResponse :datatype-) "agrosim/CostResponse")
(setf (get agrosim::CostResponse :definition-)
      "int32 Id
---
int32 Id
float64[] Cost

")



(provide :agrosim/Cost "c231a7c7ef297dd0990c7c10eb4d3e0e")


