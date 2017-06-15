;; disable unnecessaries
(setq inhibit-splash-screen t)		;begin with *scratch*
(toggle-scroll-bar -1)			;disable scrollbar
(menu-bar-mode -1)			;disable menubar
(tool-bar-mode -1)			;disable toolbar

;; package
(require 'package)
(setq package-archives '(
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ))
(package-initialize)

;; theme
(load-theme 'zenburn t)
