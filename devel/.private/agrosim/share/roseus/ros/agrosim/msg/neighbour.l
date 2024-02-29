;; Auto-generated. Do not edit!


(when (boundp 'agrosim::neighbour)
  (if (not (find-package "AGROSIM"))
    (make-package "AGROSIM"))
  (shadow 'neighbour (find-package "AGROSIM")))
(unless (find-package "AGROSIM::NEIGHBOUR")
  (make-package "AGROSIM::NEIGHBOUR"))

(in-package "ROS")
;;//! \htmlinclude neighbour.msg.html


(defclass agrosim::neighbour
  :super ros::object
  :slots (_Id _Task _row _column _costs ))

(defmethod agrosim::neighbour
  (:init
   (&key
    ((:Id __Id) (make-array 0 :initial-element 0 :element-type :integer))
    ((:Task __Task) (make-array 0 :initial-element 0 :element-type :integer))
    ((:row __row) 0)
    ((:column __column) 0)
    ((:costs __costs) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _Id __Id)
   (setq _Task __Task)
   (setq _row (round __row))
   (setq _column (round __column))
   (setq _costs __costs)
   self)
  (:Id
   (&optional __Id)
   (if __Id (setq _Id __Id)) _Id)
  (:Task
   (&optional __Task)
   (if __Task (setq _Task __Task)) _Task)
  (:row
   (&optional __row)
   (if __row (setq _row __row)) _row)
  (:column
   (&optional __column)
   (if __column (setq _column __column)) _column)
  (:costs
   (&optional __costs)
   (if __costs (setq _costs __costs)) _costs)
  (:serialization-length
   ()
   (+
    ;; int32[] _Id
    (* 4    (length _Id)) 4
    ;; int32[] _Task
    (* 4    (length _Task)) 4
    ;; int32 _row
    4
    ;; int32 _column
    4
    ;; float64[] _costs
    (* 8    (length _costs)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _Id
     (write-long (length _Id) s)
     (dotimes (i (length _Id))
       (write-long (elt _Id i) s)
       )
     ;; int32[] _Task
     (write-long (length _Task) s)
     (dotimes (i (length _Task))
       (write-long (elt _Task i) s)
       )
     ;; int32 _row
       (write-long _row s)
     ;; int32 _column
       (write-long _column s)
     ;; float64[] _costs
     (write-long (length _costs) s)
     (dotimes (i (length _costs))
       (sys::poke (elt _costs i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _Id
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Id (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _Id i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _Task
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _Task (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _Task i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32 _row
     (setq _row (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _column
     (setq _column (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64[] _costs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _costs (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _costs i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get agrosim::neighbour :md5sum-) "056719dbb8917202f0bca8112a07cd79")
(setf (get agrosim::neighbour :datatype-) "agrosim/neighbour")
(setf (get agrosim::neighbour :definition-)
      "int32[] Id
int32[] Task
int32 row
int32 column
float64[]  costs
")



(provide :agrosim/neighbour "056719dbb8917202f0bca8112a07cd79")


