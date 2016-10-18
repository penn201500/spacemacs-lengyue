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
   ;; or `spacemacs'. (default 'spacemacs)
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
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t)
     better-defaults
     chinese
     emacs-lisp
     git
     github
     javascript
     bibtex
     ivy
     (latex :variables latex-enable-auto-fill t)
     c-c++
     (ess :variables ess-enable-smart-equals t)
     racket
     (python :variables
             python-test-runner 'node
             python-enable-yapf-format-on-save t)
     ipython-notebook
     markdown
     org
     (shell :variables
            shell-default-shell 'eshell)
     (syntax-checking :variables
                      syntax-checking-enable-by-default t
                      syntax-checking-enable-tooltips t)
     (spell-checking :variables
                     ;;"spell-checking-enable-auto-dictionary t"
                     spell-checking-enable-by-default t)
     version-control
     (colors :variables
             colors-enable-nyan-cat-progress-bar t)
     lengyueyang
     pandoc
     emacs-lisp
     semantic
     graphviz
     ;;zilongshanren
     (elfeed :variables
             ;;elfeed-enable-web-interface t
             rmh-elfeed-org-files (list "~/Emacs-lengyue/Wiki-lengyue/Elfeed.org"))
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(nodejs-repl
                                      youdao-dictionary)
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
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
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
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("WenQuanYi Micro Hei Mono"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
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
   dotspacemacs-maximized-at-startup t
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
   ))

(defun dotspacemacs/user-init ()

  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://elpa.zilongshanren.com/melpa/")
          ("org-cn"   . "http://elpa.zilongshanren.com/org/")
          ("gnu-cn"   . "http://elpa.zilongshanren.com/gnu/")))

  (setq python-fill-column 99)
  (add-hook 'R-mode-hook 'smartparens-mode)
  (add-hook 'R-mode-hook 'flycheck-mode)
  (add-hook 'R-mode-hook 'flyspell-mode)
  (add-hook 'org-mode-hook 'smartparens-mode)
  (add-hook 'org-mode-hook (lambda () (org-indent-mode t)) t)
  (add-hook 'inferior-ess-mode-hook 'company-mode)
  (add-hook 'inferior-ess-mode-hook 'smartparens-mode)
  (add-hook 'inferior-ess-mode-hook 'flycheck-mode)
  (add-hook 'inferior-ess-mode-hook 'flyspell-mode)

  (add-hook 'inferior-python-mode-hook 'flycheck-mode)
  (add-hook 'inferior-python-mode-hook 'flyspell-mode)

  (setq-default dotspacemacs-line-numbers t)
  (setq-default dotspacemacs-smartparens-strict-mode t)



  "Initialization function for user code.It is called immediately after `dotspacemacs/init'.  You are free to put any user code."
  )

(defun dotspacemacs/user-config ()

  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil))) 
  (add-hook 'R-mode-hook (lambda () (setq truncate-lines nil))) 
  (add-hook 'python-mode-hook (lambda () (setq truncate-lines nil))) 

  (spacemacs//set-monospaced-font   "WenQuanYi Micro Hei Mono" "WenQuanYi Micro Hei Mono" 16 20)

  (setq org-columns-default-format "%50ITEM(Task) %CATEGORY %SCHEDULED %5Effort %5CLOCKSUM %PRIORITY")

  (setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                      ("STYLE_ALL" . "habit"))))


  (add-to-list 'org-export-latex-classes
               '("cn-article"
                 "\\documentclass[10pt,a4paper]{article}
\\usepackage{graphicx}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{lmodern}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{tikz}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{listings}
\\usepackage{geometry}
\\usepackage{algorithm}
\\usepackage{algorithmic}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{natbib}
\\usepackage{fancyhdr}
\\usepackage[xetex,colorlinks=true,CJKbookmarks=true,
linkcolor=blue,
urlcolor=blue,
menucolor=blue]{hyperref}
\\usepackage{fontspec,xunicode,xltxtra}
\\setmainfont[BoldFont=Adobe Heiti Std]{Adobe Song Std}  
\\setsansfont[BoldFont=Adobe Heiti Std]{AR PL UKai CN}  
\\setmonofont{Bitstream Vera Sans Mono}  
\\newcommand\\fontnamemono{AR PL UKai CN}%等宽字体
\\newfontinstance\\MONO{\\fontnamemono}
\\newcommand{\\mono}[1]{{\\MONO #1}}
\\setCJKmainfont[Scale=0.9]{Adobe Heiti Std}%中文字体
\\setCJKmonofont[Scale=0.9]{Adobe Heiti Std}
\\hypersetup{unicode=true}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,
marginparsep=7pt, marginparwidth=.6in}
\\definecolor{foreground}{RGB}{220,220,204}%浅灰
\\definecolor{background}{RGB}{62,62,62}%浅黑
\\definecolor{preprocess}{RGB}{250,187,249}%浅紫
\\definecolor{var}{RGB}{239,224,174}%浅肉色
\\definecolor{string}{RGB}{154,150,230}%浅紫色
\\definecolor{type}{RGB}{225,225,116}%浅黄
\\definecolor{function}{RGB}{140,206,211}%浅天蓝
\\definecolor{keyword}{RGB}{239,224,174}%浅肉色
\\definecolor{comment}{RGB}{180,98,4}%深褐色
\\definecolor{doc}{RGB}{175,215,175}%浅铅绿
\\definecolor{comdil}{RGB}{111,128,111}%深灰
\\definecolor{constant}{RGB}{220,162,170}%粉红
\\definecolor{buildin}{RGB}{127,159,127}%深铅绿
\\punctstyle{kaiming}
\\title{}
\\fancyfoot[C]{\\bfseries\\thepage}
\\chead{\\MakeUppercase\\sectionmark}
\\pagestyle{fancy}
\\tolerance=1000
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
(setq org-export-latex-listings t)
;; Options for \lset command（reference to listing Manual)
(setq org-export-latex-listings-options
      '(
        ("basicstyle" "\\color{foreground}\\small\\mono")           ; 源代码字体样式
        ("keywordstyle" "\\color{function}\\bfseries\\small\\mono") ; 关键词字体样式
        ("identifierstyle" "\\color{doc}\\small\\mono")
        ("commentstyle" "\\color{comment}\\small\\itshape")         ; 批注样式
        ("stringstyle" "\\color{string}\\small")                    ; 字符串样式
        ("showstringspaces" "false")                                ; 字符串空格显示
        ("numbers" "left")                                          ; 行号显示
        ("numberstyle" "\\color{preprocess}")                       ; 行号样式
        ("stepnumber" "1")                                          ; 行号递增
        ("backgroundcolor" "\\color{background}")                   ; 代码框背景色
        ("tabsize" "4")                                             ; TAB等效空格数
        ("captionpos" "t")                                          ; 标题位置 top or buttom(t|b)
        ("breaklines" "true")                                       ; 自动断行
        ("breakatwhitespace" "true")                                ; 只在空格分行
        ("showspaces" "false")                                      ; 显示空格
        ("columns" "flexible")                                      ; 列样式
        ("frame" "single")                                          ; 代码框：阴影盒
        ("frameround" "tttt")                                       ; 代码框： 圆角
        ("framesep" "0pt")
        ("framerule" "8pt")
        ("rulecolor" "\\color{background}")
        ("fillcolor" "\\color{white}")
        ("rulesepcolor" "\\color{comdil}")
        ("framexleftmargin" "10mm")
        ))

                                        ; org-mode export to latex
  (require 'ox-latex)
  (setq org-export-latex-listings t)
                                        ; org-mode source code setup in exporting to latex
  (add-to-list 'org-latex-listings '("" "listings"))
  (add-to-list 'org-latex-listings '("" "color"))

  (add-to-list 'org-latex-packages-alist
               '("" "hyperref" t))
  (add-to-list 'org-latex-packages-alist
               '("" "xcolor" t))
  (add-to-list 'org-latex-packages-alist
               '("" "listings" t))
  (add-to-list 'org-latex-packages-alist
               '("" "fontspec" t))
  (add-to-list 'org-latex-packages-alist
               '("" "indentfirst" t))
  (add-to-list 'org-latex-packages-alist
               '("" "xunicode" t))
  (add-to-list 'org-latex-packages-alist
               '("" "amsmath"))
  (add-to-list 'org-latex-packages-alist
               '("" "graphicx" t))

  (add-to-list 'org-latex-classes
               '("my-org-book-zh"
                 "\\documentclass{book}
  \\usepackage[slantfont, boldfont]{xeCJK}
  % chapter set
  \\usepackage[Lenny]{fncychap}
  [NO-DEFAULT-PACKAGES]
  [PACKAGES]
  \\setCJKmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
  \\setCJKsansfont{WenQuanYi Micro Hei}
  \\setCJKmonofont{WenQuanYi Micro Hei Mono}
  \\parindent 2em

  \\setmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
  \\setsansfont{WenQuanYi Micro Hei}
  \\setmonofont{WenQuanYi Micro Hei Mono}

  %\\setmainfont{DejaVu Sans} % 英文衬线字体
  %\\setsansfont{DejaVu Serif} % 英文无衬线字体
  %\\setmonofont{DejaVu Sans Mono} % 英文等宽字体
  %\\punctstyle{DejaVu Sans} % 开明式标点格式
  \\defaultfontfeatures{Mapping=tex-text} %如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。

  % 中文断行
  \\XeTeXlinebreaklocale \"zh\"
  \\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

  % 代码设置
  \\lstset{numbers=left,
  numberstyle= \\tiny,
  keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
  frame=shadowbox,
  breaklines=true,
  rulesepcolor= \\color{ red!20!green!20!blue!20}
  }

  [EXTRA]
  "
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("my-org-article-zh"
                 "\\documentclass{article}
  \\usepackage[slantfont, boldfont]{xeCJK}
  [NO-DEFAULT-PACKAGES]
  [PACKAGES]
  \\setCJKmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
  \\setCJKsansfont{WenQuanYi Micro Hei}
  \\setCJKmonofont{WenQuanYi Micro Hei Mono} 

  \\parindent 2em

  \\setmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
  \\setsansfont{WenQuanYi Micro Hei}
  \\setmonofont{WenQuanYi Micro Hei Mono} 

  %\\setmainfont{DejaVu Sans} % 英文衬线字体
  %\\setsansfont{DejaVu Serif} % 英文无衬线字体
  %\\setmonofont{DejaVu Sans Mono} % 英文等宽字体
  %\\punctstyle{DejaVu Sans} % 开明式标点格式
 
 
  \\defaultfontfeatures{Mapping=tex-text} %如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
 
  % 中文断行
  \\XeTeXlinebreaklocale \"zh\"
  \\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

  % 代码设置
  \\lstset{numbers=left, 
  numberstyle= \\tiny, 
  keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50}, 
  frame=shadowbox, 
  breaklines=true,
  rulesepcolor= \\color{ red!20!green!20!blue!20} 
  } 

  [EXTRA]
  "
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))



  (setq org-latex-pdf-process
        '("xelatex -interaction nonstopmode -output-directory %o %f"
          ;;"biber %b" "xelatex -interaction nonstopmode -output-directory %o %f"
          "bibtex %b"
          "xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"))

  (setq org-agenda-files (list "~/Emacs-lengyue/GTD-lengyue"))

  (add-to-load-path "~/.spacemacs.d/package/org-subtask-reset")
  (require 'org-subtask-reset)

  (add-to-load-path "~/.spacemacs.d/package/org-checklist")
  (require 'org-checklist)

  ;; It's wrong to load org-archive-subtree-hierarchical, so add here
  (load "~/.spacemacs.d/package/org-archive-subtree-hierarchical/org-archive-subtree-hierarchical.el")

  (add-to-load-path "~/.spacemacs.d/package/blog-admin")
  (require 'blog-admin)

  ;;  (setq blog-admin-backend-type 'org-page)
  ;;  (setq blog-admin-backend-path "~/Emacs-lengyue/Blog-lengyue/source")
  ;;  (setq blog-admin-backend-new-post-in-drafts t)
  ;;  (setq blog-admin-backend-new-post-with-same-name-dir t)
  ;;  (setq blog-admin-backend-org-page-drafts "_drafts")

  ;;  (setq op/repository-directory "~/Emacs-lengyue/Blog-lengyue/source")
  ;;  (setq op/site-domain "http://lengyueyang.github.io") 
  ;;  (setq op/personal-disqus-shortname "lengyueyang")

  (setq blog-admin-backend-type 'hexo)
  (setq blog-admin-backend-path "~/Emacs-lengyue/Blog-lengyue/")
  (setq blog-admin-backend-new-post-in-drafts t)
  (setq blog-admin-backend-new-post-with-same-name-dir t)

  ;;  (with-eval-after-load 'org-agenda
  ;;    (define-key org-agenda-mode-map (kbd "RET") 'org-agenda-goto))

  ;;  (global-linum-mode t)
  ;;  (add-to-load-path "~/.spacemacs.d/package/ox-pandoc")
  ;;  (require 'ox-pandoc)




  (require 'org-notify)
  (org-notify-start)
  (org-notify-add 'appt
                  '(:time "-1s" :period "20s" :duration 10
                          :actions (-message -ding))
                  '(:time "15m" :period "2m" :duration 100
                          :actions -notify)
                  '(:time "2h" :period "10m" :actions -message)
                  '(:time "3d" :period "12h" :actions -message)
                  '(:time "7d" :period "24h" :actions -message)
                  '(:time "30d" :actions -email))

  (defun notify-osx (title message)
    (call-process "gol"
                  nil 0 nil
                  "-group" "Emacs"
                  "-title" title
                  "-sender" "org.gnu.Emacs"
                  "-message" message
                  "-activate" "oeg.gnu.Emacs"))
  (add-hook 'org-pomodoro-finished-hook
            (lambda ()
              (notify-osx "Pomodoro completed!" "Time for a break.")))
  (add-hook 'org-pomodoro-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))
  (add-hook 'org-pomodoro-long-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))
  (add-hook 'org-pomodoro-killed-hook
            (lambda ()
              (notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))
  ;;  (add-hook 'org-pomodoro-finished-hook
  ;;  (lambda ()
  ;;  (lengyueyang//org-notify "Pomodoro completed!" "Time for a break.")))
  ;;(add-hook 'org-pomodoro-break-finished-hook
  ;;  (lambda ()
  ;;  (lengyueyang//org-notify "Pomodoro Short Break Finished" "Ready for Another?")))
  ;;(add-hook 'org-pomodoro-long-break-finished-hook
  ;;  (lambda ()
  ;;  (lengyueyang//org-notify "Pomodoro Long Break Finished" "Ready for Another?")))
  ;;(add-hook 'org-pomodoro-killed-hook
  ;;  (lambda ()
  ;;  (lengyueyang//org-notify "Pomodoro Killed" "One does not simply kill a pomodoro!")))

  (global-set-key (kbd "C-SPC") 'nil)

  (defun org-mode-my-init ()
    (define-key org-mode-map (kbd "×") (kbd "*"))
    (define-key org-mode-map (kbd "－") (kbd "-"))
    (define-key org-mode-map (kbd "（") (kbd "("))
    (define-key org-mode-map (kbd "）") (kbd ")"))
    )

  (add-hook 'org-mode-hook 'org-mode-my-init)
  ;;  (setq fcitx-active-evil-states '(insert emacs hybrid))
  ;;(fcitx-evil-turn-on)
  ;;(fcitx-prefix-keys-add "M-m")
  ;;(setq fcitx-use-dbus t)
  ;;(fcitx-M-x-turn-on)
  ;;  (fcitx-shell-command-turn-on)
  ;;(fcitx-eval-expression-turn-on)

  (setq org-ref-default-bibliography '("~/Emacs-lengyue/Papers/references.bib")
        org-ref-pdf-directory "~/Emacs-lengyue/Papers/"
        org-ref-bibliography-notes "~/Emacs-lengyue/Papers/notes.org")

  (setq org-plantuml-jar-path
        (expand-file-name "/opt/plantuml/plantuml.jar"))
  ;; (setq org-ditta-jar-path
  ;;  (expand-file-name "/usr/share/java/ditaa/ditaa-0_9.jar"))
  (setq org-confirm-babel-evaluate nil)

  (require 'org-latex)
  (setq org-export-latex-listings t)
  (add-to-list 'org-export-latex-packages-alist
               '(("AUTO" "inputenc" t)))
  (add-to-list 'org-export-latex-classes
               '("org-article"
                 "\\documentclass{org-article}
             [NO-DEFAULT-PACKAGES]
             [PACKAGES]
             [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(magit-log-section-arguments (quote ("--decorate" "-n256")))
 '(org-agenda-files
   (quote
    ("/media/My Data/DCH/CPG/肺癌临床路径/肺癌临床路径.org" "/home/lengyue/Emacs-lengyue/GTD-lengyue/GTD-lengyue.org")))
 '(org-pomodoro-length 1)
 '(org-pomodoro-short-break-length 1)
 '(package-selected-packages
   (quote
    (anaconda-mode yasnippet magit-popup git-commit async f s with-editor skewer-mode fringe-helper git-gutter+ git-gutter julia-mode noflet powerline elfeed websocket chinese-pyim-basedict biblio-core counsel ess smartparens flycheck projectile magit js2-mode ivy graphviz-dot-mode xterm-color ws-butler window-numbering which-key volatile-highlights use-package toc-org spaceline shell-pop restart-emacs rainbow-delimiters racket-mode pyvenv py-isort pip-requirements persp-mode paradox pandoc-mode ox-pandoc orgit org-ref org-pomodoro alert org-plus-contrib open-junk-file neotree multi-term move-text markdown-toc markdown-mode magit-gitflow macrostep js2-refactor info+ indent-guide ido-vertical-mode hl-todo highlight-numbers help-fns+ helm-make helm-bibtex helm helm-core google-translate github-clone gitconfig-mode git-timemachine git-messenger git-link expand-region exec-path-from-shell evil-unimpaired evil-surround evil-search-highlight-persist evil-nerd-commenter evil-mc evil-matchit evil-magit evil-iedit-state iedit evil-exchange evil-escape eshell-prompt-extras elfeed-web elfeed-org org yapfify wgrep web-beautify vi-tilde-fringe uuidgen uimage stickyfunc-enhance srefactor spinner spacemacs-theme smex smeargle rainbow-mode rainbow-identifiers quelpa pytest pyenv-mode pcre2el parsebib parent-mode pangu-spacing org-projectile org-present org-download org-caldav org-bullets nodejs-repl mwim multiple-cursors mmm-mode magit-gh-pulls lorem-ipsum log4e livid-mode live-py-mode linum-relative link-hint key-chord json-mode js-doc ivy-hydra hy-mode hungry-delete htmlize hl-sexp highlight-parentheses highlight-indentation golden-ratio gnuplot gntp gitignore-mode github-search github-browse-file gitattributes-mode git-gutter-fringe git-gutter-fringe+ gist gh-md flyspell-correct-ivy flycheck-pos-tip flx-ido find-by-pinyin-dired fill-column-indicator fancy-battery faceup eyebrowse evil-visualstar evil-visual-mark-mode evil-tutor evil-numbers evil-lisp-state evil-indent-plus evil-ediff evil-args evil-anzu eval-sexp-fu ess-smart-equals ess-R-object-popup ess-R-data-view eshell-z esh-help elisp-slime-nav elfeed-goodies ein dumb-jump disaster diminish diff-hl define-word cython-mode counsel-projectile company-tern company-statistics company-quickhelp company-c-headers company-auctex company-anaconda column-enforce-mode color-identifiers-mode coffee-mode cmake-mode clean-aindent-mode clang-format chinese-pyim bind-key biblio auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-pinyin ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

