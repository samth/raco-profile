#lang info
(define collection "raco-profile")
(define deps '("profile" "base"))

(define raco-commands
  '(("profile" raco-profile/main "profile the running of the given module" #f)))
