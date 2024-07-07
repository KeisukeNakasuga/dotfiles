(setq use-short-answers t)
(setq make-backup-files nil)
(setq backup-inhibited nil)
(setq create-lockfiles nil)
(setq ring-bell-function 'ignore)


(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(use-package use-package
  :config
  (setq use-package-always-ensure t))

(use-package org
  :ensure t)

(use-package org-modern
  :ensure t
  :hook ((org-mode . org-modern-mode)
	 (org-agenda-finalize . org-modern-agenda)))

(use-package perfect-margin
  :ensure t)

(use-package spacious-padding
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(spacious-padding perfect-margin)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
