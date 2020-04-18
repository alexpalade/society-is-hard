(cl:in-package :sih)

(defclass label (element)
  ((text :initform "Button" :initarg :text :accessor text)
   (action :initform nil :initarg :action :accessor action)
   (origin :accessor origin)
   (height :accessor height)
   (width :accessor width)))

(defmethod render ((label label))
  (with-pushed-canvas ()
    (translate-canvas-vec (origin label))
    (let* ((text-width (nth-value 1 (calc-text-bounds (text label))))
           (text-offset-x (/ text-width 2))
           (button-offset-x (/ (width label) 2))
           (label-offset-x (- button-offset-x text-offset-x))
           (text-height (nth-value 2 (calc-text-bounds (text label))))
           (text-offset-y (/ text-height 2))
           (button-offset-y (/ *element-base-height* 2))
           (label-offset-y (- button-offset-y text-offset-y)))
      (draw-text (text label)
                 (vec2 label-offset-x label-offset-y)))))