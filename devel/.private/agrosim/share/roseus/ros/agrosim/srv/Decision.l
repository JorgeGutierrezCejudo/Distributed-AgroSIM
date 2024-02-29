;; Auto-generated. Do not edit!


(when (boundp 'agrosim::Decision)
  (if (not (find-package "AGROSIM"))
    (make-package "AGROSIM"))
  (shadow 'Decision (find-package "AGROSIM")))
(unless (find-package "AGROSIM::DECISION")
  (make-package "AGROSIM::DECISION"))
(unless (find-package "AGROSIM::DECISIONREQUEST")
  (make-package "AGROSIM::DECISIONREQUEST"))
(unless (find-package "AGROSIM::DECISIONRESPONSE")
  (make-package "AGROSIM::DECISIONRESPONSE"))

(in-package "ROS")





(defclass agrosim::DecisionRequest
  :super ros::object
  :slots (_Ids _Task ))

(defmethod agrosim::DecisionRequest
  (:init
   (&key
    ((:Ids __Ids) (make-array 0 :initial-element 0 :element-type :integer))
    ((:Task __Task) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _Ids __Ids)
   (setq _Task __Task)
   self)
  (:Ids
   (&optional __Ids)
   (if __Ids (setq _Ids __Ids)) _Ids)
  (:Task
   (&optional __Task)
   (if __Task (setq _Task __Task)) _Task)
  (:serialization-length
   ()
   (+
    ;; int32[] _Ids
    (* 4    (length _Ids)) 4
    ;; int32[] _Task
    (* 4    (length _Task)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _Ids
     (write-long (length _Ids) s)
     (dotimes (i (length _Ids))
       (write-long (elt _Ids i) s)
       )
     ;; int32[] _Task
     (write-long (length _Task) s)
     (dotimes (i (length _Task))
       (write-long (elt _Task i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _Ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Ids (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _Ids i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _Task
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Task (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _Task i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass agrosim::DecisionResponse
  :super ros::object
  :slots (_Verification ))

(defmethod agrosim::DecisionResponse
  (:init
   (&key
    ((:Verification __Verification) nil)
    )
   (send-super :init)
   (setq _Verification __Verification)
   self)
  (:Verification
   (&optional (__Verification :null))
   (if (not (eq __Verification :null)) (setq _Verification __Verification)) _Verification)
  (:serialization-length
   ()
   (+
    ;; bool _Verification
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _Verification
       (if _Verification (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _Verification
     (setq _Verification (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass agrosim::Decision
  :super ros::object
  :slots ())

(setf (get agrosim::Decision :md5sum-) "654ef0f93a4707fa911e286e21ab84e9")
(setf (get agrosim::Decision :datatype-) "agrosim/Decision")
(setf (get agrosim::Decision :request) agrosim::DecisionRequest)
(setf (get agrosim::Decision :response) agrosim::DecisionResponse)

(defmethod agrosim::DecisionRequest
  (:response () (instance agrosim::DecisionResponse :init)))

(setf (get agrosim::DecisionRequest :md5sum-) "654ef0f93a4707fa911e286e21ab84e9")
(setf (get agrosim::DecisionRequest :datatype-) "agrosim/DecisionRequest")
(setf (get agrosim::DecisionRequest :definition-)
      "int32[] Ids
int32[] Task
---
bool Verification

")

(setf (get agrosim::DecisionResponse :md5sum-) "654ef0f93a4707fa911e286e21ab84e9")
(setf (get agrosim::DecisionResponse :datatype-) "agrosim/DecisionResponse")
(setf (get agrosim::DecisionResponse :definition-)
      "int32[] Ids
int32[] Task
---
bool Verification

")



(provide :agrosim/Decision "654ef0f93a4707fa911e286e21ab84e9")


