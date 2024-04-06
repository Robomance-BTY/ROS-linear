;; Auto-generated. Do not edit!


(when (boundp 'linear::MoveLinear)
  (if (not (find-package "LINEAR"))
    (make-package "LINEAR"))
  (shadow 'MoveLinear (find-package "LINEAR")))
(unless (find-package "LINEAR::MOVELINEAR")
  (make-package "LINEAR::MOVELINEAR"))
(unless (find-package "LINEAR::MOVELINEARREQUEST")
  (make-package "LINEAR::MOVELINEARREQUEST"))
(unless (find-package "LINEAR::MOVELINEARRESPONSE")
  (make-package "LINEAR::MOVELINEARRESPONSE"))

(in-package "ROS")





(defclass linear::MoveLinearRequest
  :super ros::object
  :slots (_command ))

(defmethod linear::MoveLinearRequest
  (:init
   (&key
    ((:command __command) "")
    )
   (send-super :init)
   (setq _command (string __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass linear::MoveLinearResponse
  :super ros::object
  :slots (_success _message ))

(defmethod linear::MoveLinearResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass linear::MoveLinear
  :super ros::object
  :slots ())

(setf (get linear::MoveLinear :md5sum-) "c348f8d8cd3a80f54328aa4159009109")
(setf (get linear::MoveLinear :datatype-) "linear/MoveLinear")
(setf (get linear::MoveLinear :request) linear::MoveLinearRequest)
(setf (get linear::MoveLinear :response) linear::MoveLinearResponse)

(defmethod linear::MoveLinearRequest
  (:response () (instance linear::MoveLinearResponse :init)))

(setf (get linear::MoveLinearRequest :md5sum-) "c348f8d8cd3a80f54328aa4159009109")
(setf (get linear::MoveLinearRequest :datatype-) "linear/MoveLinearRequest")
(setf (get linear::MoveLinearRequest :definition-)
      "string command
---
bool success
string message



")

(setf (get linear::MoveLinearResponse :md5sum-) "c348f8d8cd3a80f54328aa4159009109")
(setf (get linear::MoveLinearResponse :datatype-) "linear/MoveLinearResponse")
(setf (get linear::MoveLinearResponse :definition-)
      "string command
---
bool success
string message



")



(provide :linear/MoveLinear "c348f8d8cd3a80f54328aa4159009109")


