;; (require 'paredit)
(require 'evil-paredit)

;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;;     (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;;     (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;;     (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;;     (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;;     (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;;     (add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  ;; TODO: the others!!
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)

(provide 'setup-paredit)
