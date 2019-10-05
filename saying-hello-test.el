(require 'buttercup)
(setq load-path (cons "." load-path))
(require 'saying-hello)

(defconst a-message "some message")

(describe "say-hello"
  (it "read the correct input and writes the correct output"
    (spy-on 'read-string :and-call-fake (lambda (message) "Roger"))
    (spy-on 'message)
    (say-hello)
    (expect 'read-string
            :to-have-been-called-with "What is your name? ")
    (expect 'message
            :to-have-been-called-with "Hello, Roger, nice to meet you!"))
  (it "greets Elvis differently"
    (spy-on 'read-string :and-call-fake (lambda (message) "Elvis"))
    (spy-on 'message)
    (say-hello)
    (expect 'read-string
            :to-have-been-called-with "What is your name? ")
    (expect 'message
            :to-have-been-called-with "Hello, Elvis… aren't you supposed to be dead?")))
