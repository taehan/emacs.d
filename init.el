;; global options
(setq inhibit-splash-screen t)      ;begin with *scratch*
(toggle-scroll-bar -1)              ;disable scrollbar
(menu-bar-mode -1)                  ;disable menubar
(tool-bar-mode -1)                  ;disable toolbar

;; backup strategy
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs.d/saves"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(global-auto-revert-mode 1)	    ;auto reload when file changes

;; Interactively DO things
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; change windows focus with cursor keys
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)

;; full-screen toggle
(global-set-key (kbd "C-c f") 'toggle-frame-fullscreen)
		
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
            (local-set-key (kbd "C-c c") 'compile)
            (local-set-key (kbd "C-c r") 'recompile)
            ;; (local-set-key (kbd "M-]") 'next-error)
            ;; (local-set-key (kbd "M-[") 'previous-error)
	    ;; source formatting
            (setq gofmt-command "goimports")                ;goimports for gofmt
            (add-hook 'before-save-hook 'gofmt-before-save) ;gofmt everytime
            (local-set-key (kbd "C-c m") 'gofmt)
	    ;; source browsing
            (local-set-key (kbd "M-.") 'godef-jump)         ;visit definition
            (local-set-key (kbd "M-*") 'pop-tag-mark)       ;come back
            (auto-complete-mode 1)
	    ;; tab size
	    (setq tab-width 4)
            ))

;; web-mode for html
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; theme
(load-theme 'zenburn t)
(if (memq window-system '(mac))
    (set-default-font "Monaco 13")
  (set-default-font "Inconsolata 12")
  )

;; time
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;; from package-install
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode magit go-eldoc exec-path-from-shell flymake-go go-autocomplete auto-complete zenburn-theme go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
