;; UTF-8 as default encoding
(set-language-environment "UTF-8");

;; Get sane initial setup
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

;; List of packages to be checked/installed at startup
(setq package-dependencies
      '(
        ;; generic goodies
        auto-complete
        ac-slime
        paredit
        evil-paredit
        sr-speedbar
        perspective
        magit
        xclip
        htmlize
        flycheck
        ;; racket
        quack
        geiser
        ac-geiser
        ;; csharp
        csharp-mode
        omnisharp
        ;; vim nostalgia
        evil
        evil-leader
        evil-nerd-commenter
        surround
        linum-relative
        linum-off
        ;; python
        python-mode
        ;; ipython
        yaml-mode
        jedi
        ;; clojure
        clojure-mode
        cider
        ;; sql
        sql
        ;; go
        go-mode
        go-autocomplete
        ;; gore-mode
        ;; scala
        scala-mode2
        ;; erlang
        erlang
        ;; julia
        ess
        ;; php
        php-mode
        ;; markdown
        markdown-mode
        ;; navigation/searching
        helm
        helm-ls-git
        wgrep
        ;; html
        emmet-mode
        ;; miscelaneous customizations
        rainbow-delimiters
        color-theme
        ;; not working yet :(
        ;; multiple-cursors
        ;; productivity? 
        org-plus-contrib
        ox-reveal
        ;; things a text editor shouldn't do
        znc
        ;; music
        soundcloud
        ;; javascript
        ;; skewer-mode
        ))

;; Set path to .emacs.d and dependencies
(setq dotfiles-dir (file-name-directory
                     (or (buffer-file-name) load-file-name)))

;; Set path to dependencies
(setq site-lisp-dir (expand-file-name "site-lisp" dotfiles-dir))
(setq user-lisp-dir (expand-file-name "user-lisp" dotfiles-dir))

;; Set up Load path
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path user-lisp-dir)
(add-to-list 'load-path site-lisp-dir)

; Install package dependencies
(require 'setup-package)
(install-packages package-dependencies)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Load user specific configuration
(when (file-exists-p user-lisp-dir)
  (mapc 'load (directory-files user-lisp-dir nil "^[^#].*el$")))

;; Sane tabs
(setq c-basic-indent 2)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)

;; Auto-complete stuff
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(speedbar-directory-face ((t (:foreground "#729fcf"))))
 '(speedbar-tag-face ((t (:foreground "#ee4346"))))
 '(vertical-border ((t nil))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-export-backends (quote (ascii html icalendar latex md))))
