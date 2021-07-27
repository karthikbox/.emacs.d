(require 'package)

; List the packages you want
(setq package-list '(evil
		     ivy
		     counsel
		     swiper
		     which-key
		     magit
                     evil-leader))

; Add Melpa as the default Emacs Package repository
; only contains a very limited number of packages
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; needed if version is < 26.3
(if (version< emacs-version "26.3")
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

; Activate all the packages (in particular autoloads)
(package-initialize)
;; (package-refresh-contents)

; install all missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'evil)
(evil-mode t)

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(require 'ivy)
(require 'counsel)
(require 'swiper)
(require 'magit)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-g") 'evil-force-normal-state)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader " ")
(evil-leader/set-key
  "b" 'switch-to-buffer
  "f" 'counsel-find=file
  "w" 'save-buffer)
(require 'which-key)
(which-key-mode)
(which-key-setup-minibuffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (which-key evil-leader counsel))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
