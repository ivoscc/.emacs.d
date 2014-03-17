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
        ;; vim nostalgia
        evil
        evil-nerd-commenter
        surround
        linum-relative
        linum-off
        ;; python
        python-mode
        ipython
        yaml-mode
        jedi
        ;; clojure
        clojure-mode
        cider
        ;; navigation/searching
        fasd
        helm
        helm-ls-git
        wgrep
        ;; miscelaneous customizations
        rainbow-delimiters
        color-theme
        ;; not working yet :(
        ;; multiple-cursors
        ;; productivity? 
        org
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

;; Integrating the clipboard with OS X
;; Taken from http://www.emacswiki.org/emacs/CopyAndPaste#toc9
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; Auto-complete stuff
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(ac-config-default)
