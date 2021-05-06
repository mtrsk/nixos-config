(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(eval-when-compile
  (require 'use-package))

(load-file "~/.emacs.d/ui.el")

(use-package yaml-mode
  :mode ("\\.ya?ml$" . yaml-mode))

(use-package direnv
  :config (direnv-mode))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package dockerfile-mode
  :config (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

;; Allows to see which commands are being called:
;; - command-log-mode
;; - clm/open-command-log-buffer
(use-package command-log-mode)

(use-package es-mode
  :init (add-to-list 'auto-mode-alist '("\\.es$" . es-mode))
  :hook ((es-result-mode . hs-minor-mode)))

(use-package elpy
  :commands elpy-enable
  ;; Only call `elpy-enable` when needed.
  ;; See: https://emacs.stackexchange.com/q/10065/22105
  :init (with-eval-after-load 'python (elpy-enable))
  :config
  (setq elpy-rpc-virtualenv-path 'current)
  ;; by default, elpy uses flymake. This forces it to use flycheck instead
  ;; See:
  ;;     - https://github.com/jorgenschaefer/elpy/wiki/Customizations#use-flycheck-instead-of-flymake
  ;;     - https://github.com/jorgenschaefer/elpy/issues/137
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode)))

(use-package rg
  :config (rg-enable-default-bindings))

(use-package sql
  :config
  ;; with mariadb, the default regexp used to match the prompt is a bit off. This fixes it.
  (sql-set-product-feature 'mysql :prompt-regexp "^\\(MariaDB\\|MySQL\\) \\[[_a-zA-Z]*\\]> "))

(use-package sqlformat
  :config
  (setq sqlformat-command 'pgformatter))

(use-package vimrc-mode
  :init (add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode)))

(use-package undo-tree
  :init (global-undo-tree-mode))

;; Set default font
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 150
                    :weight 'normal
                    :width 'normal)
