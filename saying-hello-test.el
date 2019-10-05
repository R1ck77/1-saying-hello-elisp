(require 'buttercup)
(setq load-path (cons "." load-path))
(require 'saying-hello)

(describe "saying-hello"
  (describe "sh--format-hello"
    (it "correctly formats the input value"
      (expect (sh--format-hello "Dave")
              :to-equal "Hello, Dave, nice to meet you!"))))

