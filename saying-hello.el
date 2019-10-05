

(defun sh--print-hello-message (text)
  (message text))

(defun sh--format-hello (name)
  (cond
    ((equal name "Elvis") "Hello, Elvis… aren't you supposed to be dead?")
    (:otherwise (concat "Hello, " name ", nice to meet you!"))))

(defun sh--ask-name ()
  (read-string "What is your name? "))

(defun say-hello ()
  "Say hello to %var%"
  (interactive)
  (sh--print-hello-message
   (sh--format-hello
    (sh--ask-name))))







(provide 'saying-hello)
