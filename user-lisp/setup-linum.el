(require 'linum-relative)
(require 'linum-off)  ;; turn off line numbers where it doesn't make sense

(column-number-mode 1)
(global-linum-mode 1)
(setq linum-relative-format "%2s ")

(provide 'setup-linum)
