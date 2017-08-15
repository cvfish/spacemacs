;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs';

   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;;spell-checking
     syntax-checking
     version-control
     c-c++
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)
     python
     latex
     gtags
     ipython-notebook
     chinese
     yaml
     shell-script
     lua
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(cuda-mode)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert modeThe contents of the dotfile should be then copied in the , but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(;;monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;;dotspacemacs-default-font '("Consolas"
   ;;                            :size 13
   ;;                            :weight normal
   ;;                            :width normal
   ;;                            :powerline-offset 2)

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; for GDB/debugging in general
  (global-set-key (kbd "<f12>") 'gud-break);; set break point
  (global-set-key (kbd "<S-f12>") 'gud-remove);; remove break point
  (global-set-key (kbd "<f10>") 'gud-next) ;; next line
  (global-set-key (kbd "<f11>") 'gud-step) ;; step in
  (global-set-key (kbd "<f5>") 'gud-cont)  ;; continue until breakpoint or terminate
  (global-set-key (kbd "<S-f11>") 'gud-finish) ;; step out
  (global-set-key (kbd "<f6>") 'gud-print);; evaluate the expression at point
  (global-set-key (kbd "<f9>") 'gdb) ;; debug

  ;; Hideshow mode shortcuts
  (global-set-key (kbd "<f1>") 'hs-hide-level);; set break point
  (global-set-key (kbd "<f2>") 'hs-toggle-hiding);; set break point
  (global-set-key (kbd "<f3>") 'hs-show-all);; set break point
  (global-set-key (kbd "<f4>") 'hs-hide-all);; set break point

  (defun toggle-fullscreen ()
    (interactive)
    (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                             nil
                                           'fullboth)))

  (global-set-key [(meta return)] 'toggle-fullscreen)

  (add-hook 'LaTeX-mode-hook
            (lambda()
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-default "XeLaTeX")
              (setq TeX-save-query nil)
              (setq TeX-show-compilation t)))

  (add-hook 'shell-mode-hook 'auto-complete-mode t)
  (add-hook 'makefile-mode-hook 'auto-complete-mode t)

  (add-hook 'cuda-mode-hook 'helm-gtags-mode t)

  (setq auto-mode-alist
        (append
         ;; File name (within directory) starts with a dot.
         '(;; ("/\\.[^/]*\\'" . fundamental-mode)
           ;; ;; File name has no dot.
           ;; ("/[^\\./]*\\'" . fundamental-mode)
           ;; ;; File name ends in ???.C???.
           ("\\.proto\\'" . protobuf-mode))
         auto-mode-alist))

  (add-hook 'protobuf-mode-hook 'helm-gtags-mode t)

  (global-set-key (kbd "<C-f1>") 'shrink-window)
  (global-set-key (kbd "<C-f2>") 'enlarge-window)
  (global-set-key (kbd "<C-f3>") 'shrink-window-horizontally)
  (global-set-key (kbd "<C-f4>") 'enlarge-window-horizontally)

  (spacemacs/toggle-fullscreen)

  ;;  (recentf-open-files)
  (spacemacs/switch-to-scratch-buffer)

  (setq projectile-require-project-root nil)

  ;; (add-hook 'c-mode-hook 'fci-mode)
  ;; (add-hook 'c++-mode-hook 'fci-mode)
  ;; (setq-default fci-rule-column 80)

  ; Set up tags built from third party libraries ===begin
  ; define tags alias like "wx-tags" here
  (setq ceres-tags (expand-file-name "/usr/local/include/ceres/TAGS"))
  (setq wx-tags (expand-file-name "/usr/local/include/wx-3.1/TAGS"))
  (setq opencv-tags (expand-file-name "/usr/local/include/opencv2/TAGS"))

  (setq c++-tags (expand-file-name "/usr/include/c++/4.8/TAGS"))
  (setq boost-tags (expand-file-name "/usr/include/boost/TAGS"))
  (setq eigen3-tags (expand-file-name "/usr/include/eigen3/TAGS"))
  (setq protobuf-tags (expand-file-name "/usr/include/google/TAGS"))

  ; @see <Selecting a Tags Table> in Emacs manual for details.
  ; We only change the list "tags-table-list". It is documented officialy.
  (defun insert-into-tags-table-list(e)
    (add-to-list 'tags-table-list e t)
    )

  (defun delete-from-tags-table-list (e)
    (setq tags-table-list (delete e tags-table-list))
    )

  ; This is a sample command, all you need is copy/paste this template
  ; for other new commands
  (defun add-ceres-tags (&optional del)
    "Add or delete(C-u) ceres tags into tags-table-list"
    (interactive "P")
    (let (mytags)
  ; here add your third party tags files
  ; Usually you need load/unload tags files combination in one command
  ; change below line to add them
      (setq mytags (list ceres-tags))
      (if del (mapc 'delete-from-tags-table-list mytags)
        (mapc 'insert-into-tags-table-list mytags)
        )
      )
    )
  (defun add-wx-tags (&optional del)
    "Add or delete(C-u) wxWidgets tags into tags-table-list"
    (interactive "P")
    (let (mytags)
                                        ; here add your third party tags files
                                        ; Usually you need load/unload tags files combination in one command
                                        ; change below line to add them
      (setq mytags (list wx-tags))
      (if del (mapc 'delete-from-tags-table-list mytags)
        (mapc 'insert-into-tags-table-list mytags)
        )
      )
    )
  (defun add-opencv-tags (&optional del)
    "Add or delete(C-u) opencv into tags-table-list"
    (interactive "P")
    (let (mytags)
                                        ; here add your third party tags files
                                        ; Usually you need load/unload tags files combination in one command
                                        ; change below line to add them
      (setq mytags (list opencv-tags))
      (if del (mapc 'delete-from-tags-table-list mytags)
        (mapc 'insert-into-tags-table-list mytags)
        )
      )
    )
  (defun add-c++-tags (&optional del)
    "Add or delete(C-u) c++ tags into tags-table-list"
    (interactive "P")
    (let (mytags)
                                        ; here add your third party tags files
                                        ; Usually you need load/unload tags files combination in one command
                                        ; change below line to add them
      (setq mytags (list c++-tags))
      (if del (mapc 'delete-from-tags-table-list mytags)
        (mapc 'insert-into-tags-table-list mytags)
        )
      )
    )
  (defun add-boost-tags (&optional del)
    "Add or delete(C-u) boost tags into tags-table-list"
    (interactive "P")
    (let (mytags)
                                        ; here add your third party tags files
                                        ; Usually you need load/unload tags files combination in one command
                                        ; change below line to add them
      (setq mytags (list boost-tags))
      (if del (mapc 'delete-from-tags-table-list mytags)
        (mapc 'insert-into-tags-table-list mytags)
        )
      )
    )
  (defun add-eigen3-tags (&optional del)
    "Add or delete(C-u) eigen3 tags into tags-table-list"
    (interactive "P")
    (let (mytags)
                                        ; here add your third party tags files
                                        ; Usually you need load/unload tags files combination in one command
                                        ; change below line to add them
      (setq mytags (list eigen3-tags))
      (if del (mapc 'delete-from-tags-table-list mytags)
        (mapc 'insert-into-tags-table-list mytags)
        )
      )
    )
  (defun add-protobuf-tags (&optional del)
    "Add or delete(C-u) protobuf tags into tags-table-list"
    (interactive "P")
    (let (mytags)
                                        ; here add your third party tags files
                                        ; Usually you need load/unload tags files combination in one command
                                        ; change below line to add them
      (setq mytags (list protobuf-tags))
      (if del (mapc 'delete-from-tags-table-list mytags)
        (mapc 'insert-into-tags-table-list mytags)
        )
      )
    )

  (add-ceres-tags)
  (add-wx-tags)
  (add-eigen3-tags)
  (add-c++-tags)
  ;;(add-boost-tags)
  (add-opencv-tags)
  (add-protobuf-tags)

  (global-set-key (kbd "C-c C-g") 'helm-projectile-find-other-file)

  (setq ffap-c++-path
  '("/usr/local/include"
   "/usr/include/c++/4.8"
   "/usr/include"
   "/usr/include/x86_64-linux-gnu"
   "/home/cvfish/Work/code/caffe/include"
   "/home/cvfish/Work/code/github/PangaeaTracking/include"
   )
  )

  (setq ffap-c-path
  '("/usr/local/include"
   "/usr/include"
   "/usr/include/x86_64-linux-gnu"
   "/home/cvfish/Work/code/caffe/include"
   "/home/cvfish/Work/code/github/PangaeaTracking/include")
  )

  (ffap-bindings)
  ;; (global-set-key (kbd "C-c C-v") 'find-file-at-point)
  ;; use "C-x C-f C-f" to find file literally in the exact directory, otherwise create a new one
  (global-set-key (kbd "C-x C-f") 'ido-find-file)
  (setq ido-use-filename-at-point 'guess)
  ;; (setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))


  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting")))

  (require 'init-recentf)

  ;; get rid of `find-file-read-only' and replace it with something
  ;; more useful.
  (global-set-key (kbd "C-x C-r") 'ido-recentf-open)
  (global-set-key (kbd "C-c d") 'xref-find-definitions)
  (global-set-key (kbd "C-c r") 'xref-find-references)

  (delete-selection-mode 1)
  (global-linum-mode 1)
  (global-hl-line-mode 1) ; current line highlight, set to -1 to disable
  (global-undo-tree-mode -1)

  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  (defun new-shell ()
    (interactive)
    (let (
          (currentbuf (get-buffer-window (current-buffer)))
          (newbuf     (generate-new-buffer-name "*shell*"))
          )

      (generate-new-buffer newbuf)
      (set-window-dedicated-p currentbuf nil)
      (set-window-buffer currentbuf newbuf)
      (shell newbuf)
      )
    )

  (global-set-key (kbd "C-c s") 'new-shell)

  (use-package cuda-mode
    :defer t)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(fci-rule-color "#073642" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(image-dired-append-when-browsing nil)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (lua-mode evil helm-gtags ggtags cuda-mode yaml-mode company-auctex auctex-latexmk auctex pyvenv pytest pyenv-mode pip-requirements hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode zenburn-theme company package-build bind-key bind-map pangu-spacing find-by-pinyin-dired chinese-pyim ace-pinyin markdown-mode gitignore-mode git-gutter flycheck yasnippet pos-tip ein disaster company-c-headers cmake-mode clang-format monokai-theme solarized-theme paradox orgit magit-gitflow helm-flx git-gutter-fringe+ git-gutter+ evil-magit company-quickhelp xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package toc-org spacemacs-theme spaceline smooth-scrolling smeargle shell-pop restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el page-break-lines org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flyspell helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-jumper evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu eshell-prompt-extras esh-help elisp-slime-nav diff-hl define-word company-statistics clean-aindent-mode buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
