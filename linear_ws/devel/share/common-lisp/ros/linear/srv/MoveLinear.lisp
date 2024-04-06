; Auto-generated. Do not edit!


(cl:in-package linear-srv)


;//! \htmlinclude MoveLinear-request.msg.html

(cl:defclass <MoveLinear-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass MoveLinear-request (<MoveLinear-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveLinear-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveLinear-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name linear-srv:<MoveLinear-request> is deprecated: use linear-srv:MoveLinear-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <MoveLinear-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear-srv:command-val is deprecated.  Use linear-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveLinear-request>) ostream)
  "Serializes a message object of type '<MoveLinear-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveLinear-request>) istream)
  "Deserializes a message object of type '<MoveLinear-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveLinear-request>)))
  "Returns string type for a service object of type '<MoveLinear-request>"
  "linear/MoveLinearRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLinear-request)))
  "Returns string type for a service object of type 'MoveLinear-request"
  "linear/MoveLinearRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveLinear-request>)))
  "Returns md5sum for a message object of type '<MoveLinear-request>"
  "c348f8d8cd3a80f54328aa4159009109")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveLinear-request)))
  "Returns md5sum for a message object of type 'MoveLinear-request"
  "c348f8d8cd3a80f54328aa4159009109")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveLinear-request>)))
  "Returns full string definition for message of type '<MoveLinear-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveLinear-request)))
  "Returns full string definition for message of type 'MoveLinear-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveLinear-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveLinear-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveLinear-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude MoveLinear-response.msg.html

(cl:defclass <MoveLinear-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass MoveLinear-response (<MoveLinear-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveLinear-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveLinear-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name linear-srv:<MoveLinear-response> is deprecated: use linear-srv:MoveLinear-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveLinear-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear-srv:success-val is deprecated.  Use linear-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <MoveLinear-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader linear-srv:message-val is deprecated.  Use linear-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveLinear-response>) ostream)
  "Serializes a message object of type '<MoveLinear-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveLinear-response>) istream)
  "Deserializes a message object of type '<MoveLinear-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveLinear-response>)))
  "Returns string type for a service object of type '<MoveLinear-response>"
  "linear/MoveLinearResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLinear-response)))
  "Returns string type for a service object of type 'MoveLinear-response"
  "linear/MoveLinearResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveLinear-response>)))
  "Returns md5sum for a message object of type '<MoveLinear-response>"
  "c348f8d8cd3a80f54328aa4159009109")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveLinear-response)))
  "Returns md5sum for a message object of type 'MoveLinear-response"
  "c348f8d8cd3a80f54328aa4159009109")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveLinear-response>)))
  "Returns full string definition for message of type '<MoveLinear-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveLinear-response)))
  "Returns full string definition for message of type 'MoveLinear-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveLinear-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveLinear-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveLinear-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveLinear)))
  'MoveLinear-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveLinear)))
  'MoveLinear-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLinear)))
  "Returns string type for a service object of type '<MoveLinear>"
  "linear/MoveLinear")