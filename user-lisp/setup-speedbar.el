(require 'sr-speedbar)
(require 'setup-evil)

(setq sr-speedbar-auto-refresh t)
(setq speedbar-use-images nil)
(setq sr-speedbar-max-width 30)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-skip-other-window-p t)
(setq speedbar-verbosity-level 0)

(evil-leader/set-key "e" 'sr-speedbar-toggle)
