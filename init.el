;; early init load optimizations
;; (shamelessly ripped from
;; [[https://github.com/hlissner/doom-emacs/blob/develop/docs/faq.org#how-does-doom-start-up-so-quickly][doom-emacs]])
(setq gc-cons-threshold most-positive-fixnum gc-cons-percentage 0.6)

(defvar tdm--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; load readme.org
(require 'org)
(org-babel-load-file (expand-file-name (concat user-emacs-directory "readme.org")))
;;(org-babel-load-file (expand-file-name "~/.emacs.d/readme.org"))

;; reset load optimazations
(add-hook 'emacs-startup-hook
    (lambda () (setq gc-cons-threshold 16777216 gc-cons-percentage 0.1)))

(add-hook 'emacs-startup-hook
    (lambda () (setq file-name-handler-alist tdm--file-name-handler-alist)))
