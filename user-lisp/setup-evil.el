(require 'evil)
(require 'surround)

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

(provide 'setup-evil)
