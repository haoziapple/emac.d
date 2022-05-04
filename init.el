(setq visible-bell t)
(setq inhibit-startup-message nil)

(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode 1)
(set-fringe-mode 12)

(global-display-line-numbers-mode -1)
(global-linum-mode 1)

;;C-M-i Auto complete
(hl-line-mode 1)
(blink-cursor-mode -1)

;; enable code block highlight in Org-Mode
(setq org-src-fontify-natively t)

;; Teach Emacs to Keep Folders Clean: https://www.youtube.com/watch?v=XZjyJG-sFZI
(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))
(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)

(add-to-list 'package-archives             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

(defvar my-packages
  '(
  ;; key bindings and code colorization for Clojure
  ;; https://github.com/clojure-emacs/clojure-mode
  clojure-mode

  ;; extra syntax highlighting for clojure
  clojure-mode-extra-font-locking

  ;; integration with a Clojure REPL
  ;; https://github.com/clojure-emacs/cider
  cider

  dracula-theme

  use-package
  ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(clojure-mode-extra-font-locking cider)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; M-x eval-buffer
;; M-x load-file
;; C-x C-e
(setq org-agenda-files
      '("C:/Users/wangh154/Desktop/my-org/hello.org"))


(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

;; leuven,tango-dark,deeper-blue,wheatgrass
;; (load-theme 'wheatgrass t)
(use-package dracula-theme
	     :ensure t
	     :init
	     (load-theme 'dracula t))
