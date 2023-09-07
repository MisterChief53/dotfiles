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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company auto-package-update)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Org-mode configuration
(setq org-agenda-files '("~/Documents/notes")) ;; Add notes to agenda files

;; Chezmoi package for chezmoi integration
(use-package chezmoi)
