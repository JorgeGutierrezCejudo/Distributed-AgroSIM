
(cl:in-package :asdf)

(defsystem "agrosim-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Cost" :depends-on ("_package_Cost"))
    (:file "_package_Cost" :depends-on ("_package"))
    (:file "Decision" :depends-on ("_package_Decision"))
    (:file "_package_Decision" :depends-on ("_package"))
  ))