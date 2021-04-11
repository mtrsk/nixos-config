{pkgs, home, ...}:

let
  nurNoPkgs = import <nur> { pkgs = null; };
in
{
  imports = [ nurNoPkgs.repos.rycee.hmModules.emacs-init ];

  programs.emacs.init = {
    enable = true;
    recommendedGcSettings = true;

    prelude = ''
      ;; Disable startup message.
      (setq inhibit-startup-message t
            inhibit-startup-echo-area-message (user-login-name))

      (setq initial-major-mode 'fundamental-mode
            initial-scratch-message nil)

      ;; Disable some GUI distractions.
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (menu-bar-mode -1)
      (blink-cursor-mode 0)

      ;; Set up fonts early.
      (set-face-attribute 'default
                          nil
                          :height 80
                          :family "Fantasque Sans Mono")
      (set-face-attribute 'variable-pitch
                          nil
                          :family "DejaVu Sans")

      ;; Set frame title.
      (setq frame-title-format
            '("" invocation-name ": "(:eval
                                      (if (buffer-file-name)
                                          (abbreviate-file-name (buffer-file-name))
                                        "%b"))))

      ;; Accept 'y' and 'n' rather than 'yes' and 'no'.
      (defalias 'yes-or-no-p 'y-or-n-p)

      ;; Don't want to move based on visual line.
      (setq line-move-visual nil)

      ;; Stop creating backup and autosave files.
      (setq make-backup-files nil
            auto-save-default nil)

      ;; Always show line and column number in the mode line.
      (line-number-mode)
      (column-number-mode)

      ;; Enable some features that are disabled by default.
      (put 'narrow-to-region 'disabled nil)

      ;; Typically, I only want spaces when pressing the TAB key. I also
      ;; want 4 of them.
      (setq-default indent-tabs-mode nil
                    tab-width 4
                    c-basic-offset 4)

      ;; Trailing white space are banned!
      (setq-default show-trailing-whitespace t)

      ;; Make a reasonable attempt at using one space sentence separation.
      (setq sentence-end "[.?!][]\"')}]*\\($\\|[ \t]\\)[ \t\n]*"
            sentence-end-double-space nil)

      ;; I typically want to use UTF-8.
      (prefer-coding-system 'utf-8)

      ;; Nicer handling of regions.
      (transient-mark-mode 1)

      ;; Make moving cursor past bottom only scroll a single line rather
      ;; than half a page.
      (setq scroll-step 1
            scroll-conservatively 5)

      ;; Enable highlighting of current line.
      (global-hl-line-mode 1)

      ;; Improved handling of clipboard in GNU/Linux and otherwise.
      (setq select-enable-clipboard t
            select-enable-primary t
            save-interprogram-paste-before-kill t)

      ;; Pasting with middle click should insert at point, not where the
      ;; click happened.
      (setq mouse-yank-at-point t)

      ;; Enable a few useful commands that are initially disabled.
      (put 'upcase-region 'disabled nil)
      (put 'downcase-region 'disabled nil)

      (setq custom-file (locate-user-emacs-file "custom.el"))
      (load custom-file)

      ;; When finding file in non-existing directory, offer to create the
      ;; parent directory.
      (defun with-buffer-name-prompt-and-make-subdirs ()
        (let ((parent-directory (file-name-directory buffer-file-name)))
          (when (and (not (file-exists-p parent-directory))
                     (y-or-n-p (format "Directory `%s' does not exist! Create it? " parent-directory)))
            (make-directory parent-directory t))))

      (add-to-list 'find-file-not-found-functions #'with-buffer-name-prompt-and-make-subdirs)

      ;; Don't want to complete .hi files.
      (add-to-list 'completion-ignored-extensions ".hi")

      ;; Shouldn't highlight trailing spaces in terminal mode.
      (add-hook 'term-mode (lambda () (setq show-trailing-whitespace nil)))
      (add-hook 'term-mode-hook (lambda () (setq show-trailing-whitespace nil)))
    '';
  };
}
