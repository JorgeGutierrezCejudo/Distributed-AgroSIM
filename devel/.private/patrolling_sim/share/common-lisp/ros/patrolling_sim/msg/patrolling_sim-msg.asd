
(cl:in-package :asdf)

(defsystem "patrolling_sim-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PosRot" :depends-on ("_package_PosRot"))
    (:file "_package_PosRot" :depends-on ("_package"))
    (:file "UnityColor" :depends-on ("_package_UnityColor"))
    (:file "_package_UnityColor" :depends-on ("_package"))
    (:file "XCordenate" :depends-on ("_package_XCordenate"))
    (:file "_package_XCordenate" :depends-on ("_package"))
  ))