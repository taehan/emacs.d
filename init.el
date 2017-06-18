;; disable unnecessaries
(setq inhibit-splash-screen t)      ;begin with *scratch*
(toggle-scroll-bar -1)              ;disable scrollbar
(menu-bar-mode -1)                  ;disable menubar
(tool-bar-mode -1)                  ;disable toolbar

;; package
(require 'package)
(setq package-archives '(
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ))
(package-initialize)

;; shell environment
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  )

;; Go mode
(add-hook 'go-mode-hook
          (lambda ()
	    ;; eldoc for go
	    (go-eldoc-setup)
	    ;; compile
            (setq compile-command "go build -v && go test -v && go vet")
            (local-set-key (kbd "C-c C-c") 'compile)
            (local-set-key (kbd "C-c C-r") 'recompile)
            (local-set-key (kbd "M-]") 'next-error)
            (local-set-key (kbd "M-[") 'previous-error)
	    ;; source formatting
            (setq gofmt-command "goimports")                ;goimports for gofmt
            (add-hook 'before-save-hook 'gofmt-before-save) ;gofmt everytime
            (local-set-key (kbd "C-c m") 'gofmt)
	    ;; source browsing
            (local-set-key (kbd "M-.") 'godef-jump)         ;visit definition
            (local-set-key (kbd "M-*") 'pop-tag-mark)       ;come back
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
    (magit go-eldoc exec-path-from-shell flymake-go go-autocomplete auto-complete zenburn-theme go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
