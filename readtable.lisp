;;;; readtable.lisp -*- Mode: Lisp;-*- 
(cl:in-package "https://github.com/g000001/rmscl#internals")


(defvar *standard-readtable* (copy-readtable nil))


(defmacro in-syntax (readtable)
  `(eval-when (:compile-toplevel :load-toplevel :execute)
     (setq *readtable* ,readtable)))


(defvar *in-quote-p* nil)


(defun read-\' (srm chr)
  (let ((*in-quote-p* T))
    (funcall (cl:get-macro-character #\' *standard-readtable*) 
             srm
             chr)))


(defun read-\( (srm chr)
  (let ((result (funcall (cl:get-macro-character #\( *standard-readtable*) 
                         srm
                         chr)))
    (unless *in-quote-p*
      (typecase result
        ((cons (cons symbol *) *)
         (let ((lm-expander (cl:get (caar result) :lambda-macro)))
           (when lm-expander
             (push 'funcall result))))))
    result))


(eval-when (:compile-toplevel :load-toplevel :execute)
(let ((rt (copy-readtable nil)))
  (set-macro-character #\( 'read-\( nil rt)
  (set-macro-character #\' 'read-\' nil rt)
  (set-dispatch-macro-character
   #\# #\|
   (lambda (srm chr arg)
     (declare (ignore srm chr arg))
     (error "Error while reading: Subcharacter #\| not defined for dispatch char #\#."))
   rt)
  (defconstant rmscl-syntax rt)))




;;; *EOF*
