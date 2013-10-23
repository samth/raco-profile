#lang racket/base

(require profile)

(define (run mod-path)
  (profile (dynamic-require mod-path #f)
           #:delay 0.01))

(require racket/cmdline)
(command-line #:args (modpath)
              (run (string->path modpath)))
