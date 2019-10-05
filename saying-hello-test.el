(require 'buttercup)
(setq load-path (cons "." load-path))
(require 'saying-hello)

(defconst a-message "some message")

(describe "Utility functions"
  (describe "sh--format-hello"
    (it "correctly formats the input value"
      (expect (sh--format-hello "Dave")
              :to-equal "Hello, Dave, nice to meet you!")))
  (describe "sh--print-hello-message"
    (it "prints the output using the messages"
      (spy-on 'message)
      (sh--print-hello-message a-message)
      (expect 'message :to-have-been-called-with a-message)))
  (describe "sh--ask-name"
    (it "uses read-string with the appropriate prompt"
      (spy-on 'read-string :and-call-fake (lambda (_) "Dave"))
      (sh--ask-name)
      (expect 'read-string
              :to-have-been-called-with "What is your name? "))))

(describe "say-hello"
  (it "read the correct input and writes the correct output"
    (spy-on 'read-string :and-call-fake (lambda (message) "Roger"))
    (spy-on 'message)
    (say-hello)
    (expect 'read-string
            :to-have-been-called-with "What is your name? ")
    (expect 'message
            :to-have-been-called-with "Hello, Roger, nice to meet you!")))
