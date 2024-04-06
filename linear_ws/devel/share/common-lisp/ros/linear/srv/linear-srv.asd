
(cl:in-package :asdf)

(defsystem "linear-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MoveLinear" :depends-on ("_package_MoveLinear"))
    (:file "_package_MoveLinear" :depends-on ("_package"))
  ))