(use-package company
  :commands company-tng-configure-default
  :custom
  ;; delay to start completion
  (company-idle-delay 0)
  ;; nb of chars before triggering completion
  (company-minimum-prefix-length 1)

  :config
  ;; enable company-mode in all buffers
  (global-company-mode)

  :bind
  ;; use <C> instead of <M> to navigate completions
  (:map company-active-map
	      ("M-n" . nil)
	      ("M-p" . nil)
	      ("C-n" . #'company-select-next)
	      ("C-p" . #'company-select-previous)))

;;; Aggressive Indent hooks
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'css-mode-hook #'aggressive-indent-mode)

;;; Language Server Protocol -- config
(require 'lsp-mode)
(use-package lsp-mode :ensure t)
(defun lsp-wrapper ()
 (let* ((programming-modes '(fsharp-mode haskell-mode nix-mode)))
 (cond ((member major-mode programming-modes) (lsp-mode))
       (t nil))))

(use-package lsp-mode
:ensure t
:config
(add-hook 'lsp-mode-hook
    (lambda ()
    (add-hook 'before-save-hook
            (lambda () (lsp-format-buffer buffer-file-name))
            nil 'local))))

(use-package prog-mode
 :init
 (add-hook 'prog-mode-hook #'lsp-wrapper))

(use-package projectile
  :commands projectile-mode
  :init
  (projectile-mode +1)
  ;; :config
  ;; (counsel-projectile-mode)
  :bind
  (:map projectile-mode-map
        ;; Not sure I want to use Super in emacs, since I use it a lot in gnome
        ;; ("s-p" . projectile-command-map)
        ("C-c p" . projectile-command-map)))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package flycheck
  :commands global-flycheck-mode
  :init
  ;; (setq flycheck-mode-globals '(not rust-mode))
  (global-flycheck-mode))

;; Language suppport

;;; Dockerfile
(use-package dockerfile-mode
  :config (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;;; Nix
(add-to-list 'lsp-language-id-configuration '(nix-mode . "nix"))
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("rnix-lsp"))
		       :major-modes '(nix-mode)
		       :server-id 'nix))

;;; Terraform/HCL
(require 'terraform-mode)
(add-to-list 'auto-mode-alist '("\\.tf\\'" . terraform-mode))
(add-to-list 'auto-mode-alist '("\\.pkr.hcl\\'" . terraform-mode))
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)

;;; Shell
(use-package eshell-syntax-highlighting
  :ensure t
  :config
  (eshell-syntax-highlighting-global-mode +1))

;;; SQL
(use-package sql
  :config
  ;; with mariadb, the default regexp used to match the prompt is a bit off. This fixes it.
  (sql-set-product-feature 'mysql :prompt-regexp "^\\(MariaDB\\|MySQL\\) \\[[_a-zA-Z]*\\]> "))

(use-package sqlformat
  :config
  (setq sqlformat-command 'pgformatter))

;;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode))
