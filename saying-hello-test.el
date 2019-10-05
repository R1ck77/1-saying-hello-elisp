(require 'buttercup)
(setq load-path (cons "." load-path))
(require 'saying-hello)

(defconst a-message "some message")

(describe "saying-hello"
  (describe "sh--format-hello"
    (it "correctly formats the input value"
      (expect (sh--format-hello "Dave")
              :to-equal "Hello, Dave, nice to meet you!")))
  (describe "sh--print-hello-message"
    (it "prints the output using the messages"
      (spy-on 'message)
      (sh--print-hello-message a-message)
      (expect 'message :to-have-been-called-with a-message))))



