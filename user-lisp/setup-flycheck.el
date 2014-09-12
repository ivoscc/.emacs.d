(require 'flycheck)
(require 'php-mode)
(defun magnars/adjust-flycheck-automatic-syntax-eagerness ()
  "Adjust how often we check for errors based on if there are any.

This lets us fix any errors as quickly as possible, but in a
clean buffer we're an order of magnitude laxer about checking."
(setq flycheck-idle-change-delay
      (if flycheck-current-errors 0.5 15.0)))

(setq flycheck-highlighting-mode nil)
(setq flycheck-indication-mode 'right-fringe)

;; Each buffer gets its own idle-change-delay because of the
;; buffer-sensitive adjustment above.
(make-variable-buffer-local 'flycheck-idle-change-delay)

(add-hook 'flycheck-after-syntax-check-hook
          'magnars/adjust-flycheck-automatic-syntax-eagerness)

(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(save
                                            idle-change
                                            mode-enabled))
(setq flycheck-phpcs-standard "PSR2")
(provide 'setup-flycheck)
