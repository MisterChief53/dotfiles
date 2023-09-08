;; Tell customize to never write to this file
(setq custom-file "~/.config/emacs/custom.el")
(unless (file-exists-p custom-file)
  (with-temp-buffer
    (write-file custom-file)))
(when (file-exists-p custom-file)
  (load custom-file))

(message "loading init.el")
;; Add the sources
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; To automatically update all packages
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Company mode for completion
(use-package company)
;; Enable company-mode on all buffers
(add-hook 'after-init-hook 'global-company-mode)

;; Enable line numbers for all buffers
(global-display-line-numbers-mode t)


;; Eglot auto start on mode
(add-hook 'c++-mode-hook 'eglot-ensure)

;; Org-mode configuration
(setq org-agenda-files '("~/Documents/notes")) ;; Add notes to agenda files
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; Chezmoi package for chezmoi integration
(use-package chezmoi)

;; Enable line wrap
(global-visual-line-mode t)
