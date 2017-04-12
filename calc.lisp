(defvar A ) 
(defvar B ) 
(defvar C ) 
(defvar D)


(defun :bits (value &optional (size 64)) 
(format t "~v,'~B" size value)) 

(write-line "Welcome To Calculator") 


(write-line "Enter A: ") 
(setq A (read)) ;to read or set value
(:bits A)


(terpri)
(write-line "Enter B: ") 
(setq B (read)) 
(:bits B)

(terpri) ; for braking line


(write-line "1.Addition") 
(write-line "2.Substraction") 
(write-line "3.Multiplication") 
(write-line "4.Division") 


(sb-thread:make-thread (lambda () (progn (sleep 0) 
(setq C (+ A B)) ;a+b=c
(write-line "Addition Of Two Numbers: ") 
(:bits C))))



(sb-thread:make-thread (lambda () (progn (sleep 2) 
(setq c (- A B)) 
(write-line "Substraction Of Two Numbers: ") 
(:bits C))))



(sb-thread:make-thread (lambda () (progn (sleep 4)
(setq c (* A B)) 
(terpri)
(write-line "Multiplication Of Two Numbers: ") 
(:bits C))))



(sb-thread:make-thread (lambda () (progn (sleep 6)
(setq c (/ A B)) 
(terpri)
(write-line "Division Of Two Numbers: ") 
(:bits C))))




(sb-thread:make-thread (lambda () (progn (sleep 8)
(terpri)
(write-line "Do you want to continue?Y-2/N-1")

(setq D (read))
(if (= D 1)
(exit)))))


