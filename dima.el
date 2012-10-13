(set-language-environment 'UTF-8)
(setq default-buffer-file-coding-system 'utf-8-unix)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
;(add-to-list 'load-path "/usr/local/share/emacs/23.3/site-lisp/slime/")

;;; restas integration
(add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/restas-20120703-git/slime/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/slime-archimag/")

; (require 'slime)
(load "~/.emacs.d/site-lisp/slime-archimag/slime.el")


(setq common-lisp-hyperspec-root "/usr/local/share/doc/clisp-hyperspec/HyperSpec/")

;(require 'slime)

(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-repl
               slime-fancy
	       slime-fuzzy
               slime-fancy-inspector
               slime-indentation))

(define-key slime-mode-map (kbd "TAB")
  'slime-indent-and-complete-symbol)

(define-key slime-mode-map (kbd "C-c TAB")
  'slime-complete-symbol)

(setq lisp-indent-function 'common-lisp-indent-function)
(require 'closure-template-html-mode)

(setq slime-backend "~/.emacs.d/site-lisp/slime-archimag/swank-loader.lisp")
(require 'restas)

(autoload 'mpg123 "mpg123" "A front-end to mpg123" t)
