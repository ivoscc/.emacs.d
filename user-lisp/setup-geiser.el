(require 'geiser)
(require 'ac-geiser)

(setq geiser-guile-binary "/Applications/Racket v6.1/bin/racket")
(setq geiser-active-implementations '(racket))
(add-hook 'geiser-mode-hook 'ac-geiser-setup)
(add-hook 'geiser-repl-mode-hook 'ac-geiser-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'geiser-repl-mode))

(provide 'setup-geiser)
