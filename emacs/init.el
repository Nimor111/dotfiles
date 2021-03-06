(require 'package) ;; You might already have this line
  (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                      (not (gnutls-available-p))))
	 (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; exec path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; global variables
(setq
  inhibit-startup-screen 1
  create-lockfiles nil
  make-backup-files nil
  ensime-startup-notification nil)
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; enable completion in every buffer
(add-hook 'after-init-hook 'global-company-mode)

;; melpa packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; melpa packages

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-start-on-flymake-mode nil)
 '(intero-global-mode nil nil (intero))
 '(lsp-prefer-flymake nil)
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-flycheck-enable t)
 '(lsp-ui-imenu-enable t)
 '(lsp-ui-peek-enable t)
 '(package-selected-packages
   (quote
    (powerline lsp-ui lsp-mode rust-mode exec-path-from-shell yaml-mode flutter dart-mode ensime scalariform prettier-js tide intero hindent company-ghc all all-the-icons haskell-mode cider elixir-mode helm-company elpy projectile helm zenburn-theme neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; neotree
(add-to-list 'load-path "/home/gbojinov/.emacs.d/neotree")
(require 'neotree)
(global-set-key (kbd "M-k") 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; helm
(require 'helm-config)
(helm-mode 1)

;; theme
(load-theme 'zenburn t)

;; disable menu bar
(menu-bar-mode -1)

;; projectile
(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(setq projectile-completion-system 'helm)

;; elpy
(elpy-enable)

;; icons package
(add-to-list 'load-path "/home/gbojinov/.emacs.d/all-the-icons")

(require 'all-the-icons)

;; ensime
(use-package ensime
  :ensure t
  :pin melpa-stable)

;; hide menu bar
(menu-bar-mode -1)

;; hide tool bar
(tool-bar-mode -1)

;;;; typescript mode
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

;; typescript IDE mode
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; self-explanatory
(setq-default typescript-indent-level 2)

;; haskell ide
(add-hook 'haskell-mode-hook 'intero-mode)

;; formatting haskell files
(add-hook 'haskell-mode-hook #'hindent-mode)

;; autoformat haskell for local buffer - otherwise it keeps it as a global setting lol
(add-hook 'haskell-mode-hook
	  (lambda () (add-hook 'before-save-hook 'hindent-reformat-buffer nil 'local)))

;; flycheck binds
(defun flycheck-jump-errors ()
  (global-set-key (kbd "M-n") 'flycheck-next-error)
  (global-set-key (kbd "M-p") 'flycheck-previous-error))

;; match parens
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;; dart mode hooks
(add-hook 'dart-mode-hook #'lsp)
(add-hook 'dart-mode-hook 'flycheck-mode)
(add-hook 'dart-mode-hook #'flycheck-jump-errors)

;; format dart code on save
(setq dart-format-on-save t)

;; help lsp-mode find package root automatically
(with-eval-after-load "projectile"
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))
(setq lsp-auto-guess-root t)

;; flycheck binds for ts
(add-hook 'typescript-mode-hook #'flycheck-jump-errors)

;; remove flymake hook
(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

;; fancy fancy
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; delete whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; powerline
(require 'powerline)
(powerline-default-theme)
