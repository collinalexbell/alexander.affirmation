(load "timer.lisp")
(defpackage :affirmations
  (:use :cl :timer))

(in-package :affirmations)

(defparameter affirmations '())

(defclass affirmation ()
   ((name :accessor .content
           :initarg :content)))

(defun add-affirmation (content)
  (push (make-instance 'affirmation :content content) affirmations))

(defun print-affirmation (instance)
  (format t "~%Ponder this affirmation:~%~a~%~%" (.content instance)))

(defun schedule-affirmation (index sec min hour)
  (labels ((play-sound ()
             (inferior-shell:run/nil '(afplay "/Users/taggart/Downloads/light.mp3")))
           (reminder ()
             (format t "~%REMEMBER ~a~%" (.content (nth index affirmations)))
             (sb-thread:make-thread #'play-sound)))
        (schedule-today #'reminder sec min hour)))


;;;;TODO Implement function that adds & prints nested todos?
(defun add-dependency ())
