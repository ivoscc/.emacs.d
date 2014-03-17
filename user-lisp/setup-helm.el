(require 'helm-ls-git)

(setq helm-ff-transformer-show-only-basename t 
      helm-ls-git-show-abs-or-relative 'relative)

(global-set-key (kbd "M-p") 'helm-browse-project)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "<f2>") 'helm-buffers-list)

(provide 'setup-helm)
