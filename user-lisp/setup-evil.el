(setq evil-want-C-i-jump nil)
(require 'evil)
(require 'surround)
(require 'evil-leader)

(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "e" 'sr-speedbar-toggle)

(evil-mode 1)
(global-surround-mode 1)

(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)

;; Make Y behave as it should.
;; Taken from http://mattbriggs.net/blog/2012/02/27/awesome-emacs-plugins-evil-mode/
(defun copy-to-end-of-line ()
  (interactive)
  (evil-yank (point) (point-at-eol)))

(define-key evil-normal-state-map "Y" 'copy-to-end-of-line)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;;; esc quits (Taken from http://stackoverflow.com/questions/8483182/emacs-evil-mode-best-practice)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(provide 'setup-evil)
