#lang racket/base

(require profile)

(define (run mod-path et?)
  (define ns (make-base-namespace))
  (parameterize ([current-namespace ns])
    (dynamic-require 'errortrace #f)
    (dynamic-require mod-path (void))
    (profile (dynamic-require mod-path #f)
             #:delay 0.001
             #:use-errortrace? et?)))

(require racket/cmdline)
(define et? #f)
(command-line 
 #:once-any
 ["--errortrace" "use errortrace" (set! et? #t)]
 #:args (modpath)
 (run (string->path modpath) et?))
