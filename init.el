;; disable unnecessaries
(setq inhibit-splash-screen t)		;begin with *scratch*
(toggle-scroll-bar -1)			    ;disable scrollbar
(menu-bar-mode -1)			        ;disable menubar
(tool-bar-mode -1)                  ;disable toolbar

;; package
(require 'package)
(setq package-archives '(
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ))
(package-initialize)

;; Go mode
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save) ;gofmt everytime
            (auto-complete-mode 1)
            ))

;; looking
(load-theme 'zenburn t)
(set-default-font "Monaco 13")

;; from package-install
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-autocomplete auto-complete zenburn-theme go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
