;;;; rmscl.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)


(defsystem :rmscl
  :serial t
  :depends-on (:lambda.output)
  :components ((:file "package")
               (:file "rmscl")
               (:file "readtable")))


(defmethod perform ((o test-op) (c (eql (find-system :rmscl))))
  (let ((*package*
         (find-package
          "https://github.com/g000001/rmscl#internals")))
    (eval
     (read-from-string
      "
      (or (let ((result (run 'rmscl)))
            (explain! result)
            (results-status result))
          (error \"test-op failed\") )"))))


;;; *EOF*
