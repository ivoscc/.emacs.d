;; UTF-8 as default encoding
(set-language-environment "UTF-8");

;; Get sane initial setup
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)

;; List of packages to be checked/installed at startup
(setq package-dependencies
      '(evil
        surround
        color-theme
        linum-relative
	linum-off
        cider))

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
