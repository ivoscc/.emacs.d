(require 'helm-ls-git)

(setq helm-ff-transformer-show-only-basename t 
      helm-ls-git-show-abs-or-relative 'relative)

(global-set-key (kbd "M-p") 'helm-browse-project)
(global-set-key (kbd "C-x M-f") 'helm-find-files)

(provide 'setup-helm)
