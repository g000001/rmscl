;;;; rmscl.lisp -*- Mode: Lisp;-*- 
(cl:in-package "https://github.com/g000001/rmscl#internals")

(defmacro let ((&rest bindlist) &body body)
  (cl:let* ((bindlist (mapcar (lambda (bl)
                                (etypecase bl
                                  (symbol (list bl nil))
                                  ((cons symbol cons)
                                   (list (car bl) (cons 'values (cdr bl))))
                                  (cons bl)))
                              bindlist))
            (vars (mapcan (lambda (v)
                            (etypecase (car v)
                              (symbol (list (car v)))
                              ((cons (eql values) list)
                               (cdr (car v)))))
                          bindlist))
            (vals (mapcar #'second bindlist)))
    `(multiple-value-call (lambda (,@vars) ,@body) ,@vals)))


(defmacro deflambda-macro (name (&rest args) &body body)
  `(progn
     (defmacro ,name (,@args) ,@body)
     (setf (get ',name :lambda-macro)
           (macro-function ',name))
     ',name))


(defun compose (f g)
  (lambda (&rest args)
    (declare (dynamic-extent args))
    (funcall f (apply g args))))


(setf (get 'compose :lambda-macro) T)


(defmacro w/test (notp name (&rest required-args) &rest keys)
  (let ((test-keys (mapcan (lambda (k)
                             (list (intern (string k) :keyword) k)) 
                           (cl:remove 'test-not keys)))
        (test-not-keys (mapcan (lambda (k)
                                 (list (intern (string k) :keyword) k)) 
                               (cl:remove 'test keys))))
    `(if ,notp
         (,(intern (string name) :cl) ,@required-args ,@test-not-keys)
         (,(intern (string name) :cl) ,@required-args ,@test-keys))))


(defun member (item list &key key (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp member (item list) key test test-not))


(defun delete (item sequence &key from-end (test 'equal) test-not (start 0) end count key)
  (w/test test-not delete (item sequence) from-end test test-not start end count key))


(defun set-exclusive-or (list1 list2 &key (key 'identity) (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp set-exclusive-or (list1 list2) key test test-not))


(defun intersection (list1 list2 &key (key 'identity) (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp intersection (list1 list2) key test test-not))


(defun sublis (alist tree &key key (test 'equal) (test-not nil notp))
  (w/test notp sublis (alist tree) key test test-not))


(defun union (list1 list2 &key key (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp union (list1 list2) key test test-not))


(defun search (sequence1 sequence2 &key from-end (test 'equal) test-not (start1 0) end1 (start2 0) end2 key)
  (w/test test-not search (sequence1 sequence2) from-end test test-not start1 end1 start2 end2 key))


(defun subst (new old tree &key key (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp subst (new old tree) key test test-not))


(defun remove (item sequence &key from-end (test 'equal) test-not (start 0) end count key)
  (w/test test-not remove (item sequence) from-end test test-not start end count key))


(defun nsubstitute (new old sequence &key from-end (test 'equal) test-not end count key (start 0))
  (w/test test-not nsubstitute (new old sequence) from-end test test-not end count key start))


(defun nset-difference (list1 list2 &key (key 'identity) (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp nset-difference (list1 list2) key test test-not))


(defun nsublis (alist tree &key key (test 'equal) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp nsublis (alist tree) key test test-not))


(defun adjoin (item list &key key (test 'equal) (test-not nil notp))
  (w/test notp adjoin (item list) key test test-not))


(defun delete-duplicates (sequence &key (test 'equal) test-not (start 0) from-end end key)
  (w/test test-not delete-duplicates (sequence) test test-not start from-end end key))


(defun nset-exclusive-or (list1 list2 &key (test #'equal testp) (test-not nil notp) key)
  (declare (ignore testp))
  (w/test notp nset-exclusive-or (list1 list2) test test-not key))


(defun count (item sequence &key from-end (test 'equal) test-not (start 0) end key)
  (w/test test-not count (item sequence) from-end test test-not start end key))


(defun nunion (list1 list2 &key (key 'identity) (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp nunion (list1 list2) key test test-not))


(defun tree-equal (x y &key (test 'equal) test-not) 
  (w/test test-not tree-equal (x y) test test-not))


(defun remove-duplicates (sequence &key (test 'equal) test-not (start 0) from-end end key)
  (w/test test-not remove-duplicates (sequence) test test-not start from-end end key))


(defun set-difference (list1 list2 &key (key 'identity) (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp set-difference (list1 list2) key test test-not))


(defun mismatch (sequence1 sequence2 &key from-end (test 'equal) test-not (start1 0) end1 (start2 0) end2 key)
  (w/test test-not mismatch (sequence1 sequence2) from-end test test-not start1 end1 start2 end2 key))


(defun position (item sequence &key from-end (test 'equal) test-not (start 0) end key)
  (w/test test-not position (item sequence) from-end test test-not start end key))


(defun nintersection (list1 list2 &key (key 'identity) (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp nintersection (list1 list2) key test test-not))


(defun nsubst (new old tree &key key (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp nsubst (new old tree) key test test-not))


(defun find (item sequence &key from-end (test 'equal) test-not (start 0) end key)
  (w/test test-not find (item sequence) from-end test test-not start end key))


(defun subsetp (list1 list2 &key key (test 'equal testp) (test-not nil notp))
  (declare (ignore testp))
  (w/test notp subsetp (list1 list2) key test test-not))


(defun make-hash-table (&key (test 'equal)
                             size
                             rehash-size
                             rehash-threshold
                             hash-function
                             weak-kind
                             single-thread
                             free-function)
  (cl:make-hash-table :test test
                      :size size
                      :rehash-size rehash-size
                      :rehash-threshold rehash-threshold
                      :hash-function hash-function
                      :weak-kind weak-kind
                      :single-thread single-thread
                      :free-function free-function))


;;; *EOF*
