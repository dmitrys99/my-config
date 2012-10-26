;;;
;;; Org Mode
;;;
(add-to-list 'load-path (expand-file-name "C:/Work/Emacs/home/org-7.9.2/lisp/"))
;  (add-to-list 'load-path (expand-file-name "~/org/contrib/lisp"))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org-install)

(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "e:/Dropbox/MobileOrg")


(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cи" 'org-iswitchb)


  ; Enable habit tracking (and a bunch of other modules)
  (setq org-modules (quote (org-bbdb
                            org-bibtex
                            org-crypt
                            org-gnus
                            org-id
                            org-info
                            org-jsinfo
                            org-habit
                            org-inlinetask
                            org-irc
                            org-mew
                            org-mhe
                            org-protocol
                            org-rmail
                            org-vm
                            org-wl
                            org-w3m)))

  ; position the habit graph on the agenda to the right of the default
  (setq org-habit-graph-column 50)


;; Disable C-c [ and C-c ] in org-mode
(add-hook 'org-mode-hook
          (lambda ()
            ;; Undefine C-c [ and C-c ] since this breaks my
            ;; org-agenda files when directories are include It
            ;; expands the files in the directories individually
            (org-defkey org-mode-map "\C-c["    'undefined)
            (org-defkey org-mode-map "\C-c]"    'undefined))
          'append)
;; Enable abbrev-mode
(add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))

(setq org-agenda-files (quote ("~/org/")))

  (global-set-key (kbd "<f12>") 'org-agenda)
  (global-set-key (kbd "<f5>") 'bh/org-todo)
  (global-set-key (kbd "<S-f5>") 'bh/widen)
  (global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
  (global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
  (global-set-key (kbd "<f9> <f9>") 'bh/show-org-agenda)
  (global-set-key (kbd "<f9> c") 'calendar)
  (global-set-key (kbd "<f9> f") 'boxquote-insert-file)
  (global-set-key (kbd "<f9> h") 'bh/hide-other)
  (global-set-key (kbd "<f9> n") 'org-narrow-to-subtree)
  (global-set-key (kbd "<f9> w") 'widen)
  (global-set-key (kbd "<f9> u") 'bh/narrow-up-one-level)
  
  (global-set-key (kbd "<f9> I") 'bh/punch-in)
  (global-set-key (kbd "<f9> Ш") 'bh/punch-in)
  (global-set-key (kbd "<f9> O") 'bh/punch-out)
  (global-set-key (kbd "<f9> Щ") 'bh/punch-out)
  
;  (global-set-key (kbd "<f9> o") 'bh/make-org-scratch)
  
  (global-set-key (kbd "<f9> r") 'boxquote-region)
  (global-set-key (kbd "<f9> s") 'bh/switch-to-scratch)
  
  (global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)
  (global-set-key (kbd "<f9> T") 'tabify)
  (global-set-key (kbd "<f9> U") 'untabify)
  
  (global-set-key (kbd "<f9> v") 'visible-mode)
  (global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)
  (global-set-key (kbd "C-<f9>") 'previous-buffer)
  (global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
  (global-set-key (kbd "C-x n r") 'narrow-to-region)
  (global-set-key (kbd "C-<f10>") 'next-buffer)
  (global-set-key (kbd "<f11>") 'org-clock-goto)
  (global-set-key (kbd "C-<f11>") 'org-clock-in)
;  (global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)
  (global-set-key (kbd "C-M-r") 'org-capture)
  (global-set-key (kbd "C-c r") 'org-capture)

  (global-set-key (kbd "<f9> p") 'org-set-property)
  (global-set-key (kbd "<f9> з") 'org-set-property)
  
  (defun bh/hide-other ()
    (interactive)
    (save-excursion
      (org-back-to-heading 'invisible-ok)
      (hide-other)
      (org-cycle)
      (org-cycle)
      (org-cycle)))
  
  (defun bh/set-truncate-lines ()
    "Toggle value of truncate-lines and refresh window display."
    (interactive)
    (setq truncate-lines (not truncate-lines))
    ;; now refresh window display (an idiom from simple.el):
    (save-excursion
      (set-window-start (selected-window)
                        (window-start (selected-window)))))
  
;  (defun bh/make-org-scratch ()
;    (interactive)
;    (find-file "/tmp/publish/scratch.org")
;    (gnus-make-directory "/tmp/publish"))
  
  (defun bh/switch-to-scratch ()
    (interactive)
    (switch-to-buffer "*scratch*"))

  (setq org-todo-keywords
        (quote ((sequence "TODO(е)" "NEXT(т)" "|" "DONE(в!/!)")
                (sequence "WAITING(ц@/!)" "HOLD(р@/!)" "|" "CANCELLED(с@/!)" "PHONE"))))
  
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "magenta" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("PHONE" :foreground "forest green" :weight bold))))

  (setq org-use-fast-todo-selection t)
  (setq org-treat-S-cursor-todo-selection-as-state-change nil)

  (setq org-todo-state-tags-triggers
        (quote (("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING" . t) ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  (setq org-default-notes-file "~/org/refile.org")
  
  ;; I use C-M-r to start capture mode
  (global-set-key (kbd "C-M-r") 'org-capture)
  ;; I use C-c r to start capture mode when using SSH from my Android phone
  (global-set-key (kbd "C-c r") 'org-capture)
  
  ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, and org-protocol
  (setq org-capture-templates
        (quote (("е" "todo" entry (file "~/org/refile.org")
                 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                ("к" "respond" entry (file "~/org/refile.org")
                 "* TODO Respond to %:from on %:subject\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
                ("т" "заметка" entry (file "~/org/refile.org")
                 "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                ("о" "Journal" entry (file+datetree "~/org/diary.org")
                 "* %?\n%U\n" :clock-in t :clock-resume t)
                ("ц" "org-protocol" entry (file "~/org/refile.org")
                 "* Обзор TODO %c\n%U\n" :immediate-finish t)
                ("з" "Звонок" entry (file "~/org/refile.org")
                 "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                ("р" "Привычка" entry (file "~/org/refile.org")
                 "* NEXT %?\n%U\n%a\nSCHEDULED: %t .+1d/3d\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

  (defun bh/remove-empty-drawer-on-clock-out ()
    (interactive)
    (save-excursion
      (beginning-of-line 0)
      (org-remove-empty-drawer-at "LOGBOOK" (point))))

  (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)


  ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))
  
  ; Use full outline paths for refile targets - we file directly with IDO
  (setq org-refile-use-outline-path t)
  
  ; Targets complete directly with IDO
  (setq org-outline-path-complete-in-steps nil)
  
  ; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))
  
  ; Use IDO for both buffer and file completion and ido-everywhere to t
  (setq org-completion-use-ido t)
  (setq ido-everywhere t)
  (setq ido-max-directory-size 100000)
  (ido-mode (quote both))
  
  ;;;; Refile settings
  ; Exclude DONE state tasks from refile targets
  (defun bh/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))
  
  (setq org-refile-target-verify-function 'bh/verify-refile-target)

  ;; Do not dim blocked tasks
  (setq org-agenda-dim-blocked-tasks nil)
  
  ;; Compact the block agenda view
  (setq org-agenda-compact-blocks t)
  
  ;; Custom agenda command definitions
  (setq org-agenda-custom-commands
        (quote (("N" "Notes" tags "NOTE"
                 ((org-agenda-overriding-header "Notes")
                  (org-tags-match-list-sublevels t)))
                ("h" "Habits" tags-todo "STYLE=\"habit\""
                 ((org-agenda-overriding-header "Habits")
                  (org-agenda-sorting-strategy
                   '(todo-state-down effort-up category-keep))))
                (" " "Agenda"
                 ((agenda "" nil)
                  (tags "REFILE"
                        ((org-agenda-overriding-header "Разобрать")
                         (org-tags-match-list-sublevels nil)))
                  (tags-todo "-CANCELLED/!"
                             ((org-agenda-overriding-header "Застрявшие проекты")
                              (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
                  (tags-todo "-WAITING-CANCELLED/!NEXT"
                             ((org-agenda-overriding-header "Следующий шаг")
                              (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                              (org-agenda-todo-ignore-scheduled t)
                              (org-agenda-todo-ignore-deadlines t)
                              (org-agenda-todo-ignore-with-date t)
                              (org-tags-match-list-sublevels t)
                              (org-agenda-sorting-strategy
                               '(todo-state-down effort-up category-keep))))
                  (tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
                             ((org-agenda-overriding-header "Задачи")
                              (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
                              (org-agenda-todo-ignore-scheduled t)
                              (org-agenda-todo-ignore-deadlines t)
                              (org-agenda-todo-ignore-with-date t)
                              (org-agenda-sorting-strategy
                               '(category-keep))))
                  (tags-todo "-HOLD-CANCELLED/!"
                             ((org-agenda-overriding-header "Проекты")
                              (org-agenda-skip-function 'bh/skip-non-projects)
                              (org-agenda-sorting-strategy
                               '(category-keep))))
                  (tags-todo "-CANCELLED/!WAITING|HOLD"
                             ((org-agenda-overriding-header "В ожидании")
                              (org-tags-match-list-sublevels nil)
                              (org-agenda-todo-ignore-scheduled 'future)
                              (org-agenda-todo-ignore-deadlines 'future)))
                  (tags "-REFILE/"
                        ((org-agenda-overriding-header "В архив")
                         (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                         (org-tags-match-list-sublevels nil))))
                 nil)
                ("к" "Разобрать" tags "REFILE"
                 ((org-agenda-overriding-header "Разобрать")
                  (org-tags-match-list-sublevels nil)))
                ("№" "Застрявшие проекты" tags-todo "-CANCELLED/!"
                 ((org-agenda-overriding-header "Застрявшие проекты")
                  (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
                ("т" "Следующий шаг" tags-todo "-WAITING-CANCELLED/!NEXT"
                 ((org-agenda-overriding-header "Следующий шаг")
                  (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                  (org-agenda-todo-ignore-scheduled t)
                  (org-agenda-todo-ignore-deadlines t)
                  (org-agenda-todo-ignore-with-date t)
                  (org-tags-match-list-sublevels t)
                  (org-agenda-sorting-strategy
                   '(todo-state-down effort-up category-keep))))
                ("К" "Задачи" tags-todo "-REFILE-CANCELLED/!-HOLD-WAITING"
                 ((org-agenda-overriding-header "Задачи")
                  (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
                  (org-agenda-sorting-strategy
                   '(category-keep))))
                ("з" "Проекты" tags-todo "-HOLD-CANCELLED/!"
                 ((org-agenda-overriding-header "Проекты")
                  (org-agenda-skip-function 'bh/skip-non-projects)
                  (org-agenda-sorting-strategy
                   '(category-keep))))
                ("ц" "Ожидание" tags-todo "-CANCELLED/!WAITING|HOLD"
                 ((org-agenda-overriding-header "В ожидании"))
                 (org-tags-match-list-sublevels nil))
                ("A" "В архив" tags "-REFILE/"
                 ((org-agenda-overriding-header "Можно переместить в архив")
                  (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                  (org-tags-match-list-sublevels nil))))))


  (defun bh/org-auto-exclude-function (tag)
    "Automatic task exclusion in the agenda with / RET"
    (and (cond
          ((string= tag "hold")
           t)
          ((string= tag "farm")
           t))
         (concat "-" tag)))
  
  (setq org-agenda-auto-exclude-function 'bh/org-auto-exclude-function)

  ;;
  ;; Resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)
  ;;
  ;; Show lot sof clocking history so it's easy to pick items off the C-F11 list
  (setq org-clock-history-length 36)
  ;; Resume clocking task on clock-in if the clock is open
  (setq org-clock-in-resume t)
  ;; Change tasks to NEXT when clocking in
  (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
  ;; Separate drawers for clocking and logs
  (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
  ;; Save clock data and state changes and notes in the LOGBOOK drawer
  (setq org-clock-into-drawer t)
  ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)
  ;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)
  ;; Save the running clock and all clock history when exiting Emacs, load it on startup
  (setq org-clock-persist t)
  ;; Do not prompt to resume an active clock
  (setq org-clock-persist-query-resume nil)
  ;; Enable auto clock resolution for finding open clocks
  (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
  ;; Include current clocking task in clock reports
  (setq org-clock-report-include-clocking-task t)
  
  (setq bh/keep-clock-running nil)
  
  (defun bh/clock-in-to-next (kw)
    "Switch a task from TODO to NEXT when clocking in.
  Skips capture tasks, projects, and subprojects.
  Switch projects and subprojects from NEXT back to TODO"
    (when (not (and (boundp 'org-capture-mode) org-capture-mode))
      (cond
       ((and (member (org-get-todo-state) (list "TODO"))
             (bh/is-task-p))
        "NEXT")
       ((and (member (org-get-todo-state) (list "NEXT"))
             (bh/is-project-p))
        "TODO"))))
  
  (defun bh/find-project-task ()
    "Move point to the parent (project) task if any"
    (save-restriction
      (widen)
      (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (goto-char parent-task)
        parent-task)))
  
  (defun bh/punch-in (arg)
    "Start continuous clocking and set the default task to the
  selected task.  If no task is selected set the Organization task
  as the default task."
    (interactive "p")
    (setq bh/keep-clock-running t)
    (if (equal major-mode 'org-agenda-mode)
        ;;
        ;; We're in the agenda
        ;;
        (let* ((marker (org-get-at-bol 'org-hd-marker))
               (tags (org-with-point-at marker (org-get-tags-at))))
          (if (and (eq arg 4) tags)
              (org-agenda-clock-in '(16))
            (bh/clock-in-organization-task-as-default)))
      ;;
      ;; We are not in the agenda
      ;;
      (save-restriction
        (widen)
        ; Find the tags on the current task
        (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
            (org-clock-in '(16))
          (bh/clock-in-organization-task-as-default)))))
  
  (defun bh/punch-out ()
    (interactive)
    (setq bh/keep-clock-running nil)
    (when (org-clock-is-active)
      (org-clock-out))
    (org-agenda-remove-restriction-lock))
  
  (defun bh/clock-in-default-task ()
    (save-excursion
      (org-with-point-at org-clock-default-task
        (org-clock-in))))
  
  (defun bh/clock-in-parent-task ()
    "Move point to the parent (project) task if any and clock in"
    (let ((parent-task))
      (save-excursion
        (save-restriction
          (widen)
          (while (and (not parent-task) (org-up-heading-safe))
            (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
              (setq parent-task (point))))
          (if parent-task
              (org-with-point-at parent-task
                (org-clock-in))
            (when bh/keep-clock-running
              (bh/clock-in-default-task)))))))
  
  (defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")
  
  (defun bh/clock-in-organization-task-as-default ()
    (interactive)
    (org-with-point-at (org-id-find bh/organization-task-id 'marker)
      (org-clock-in '(16))))
  
  (defun bh/clock-out-maybe ()
    (when (and bh/keep-clock-running
               (not org-clock-clocking-in)
               (marker-buffer org-clock-default-task)
               (not org-clock-resolving-clocks-due-to-idleness))
      (bh/clock-in-parent-task)))
  
  (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)

  (setq org-clock-out-remove-zero-time-clocks t)
  (defun bh/org-todo (arg)
    (interactive "p")
    (if (equal arg 4)
        (save-restriction
          (widen)
          (org-narrow-to-subtree)
          (org-show-todo-tree nil))
      (widen)
      (org-narrow-to-subtree)
      (org-show-todo-tree nil)))
  
  (global-set-key (kbd "<S-f5>") 'bh/widen)
  
  (defun bh/widen ()
    (interactive)
    (if (equal major-mode 'org-agenda-mode)
        (org-agenda-remove-restriction-lock)
      (widen)
      (org-agenda-remove-restriction-lock)))
  
  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "W" 'bh/widen))
            'append)
  
  (defun bh/restrict-to-file-or-follow (arg)
    "Set agenda restriction to 'file or with argument invoke follow mode.
  I don't use follow mode very often but I restrict to file all the time
  so change the default 'F' binding in the agenda to allow both"
    (interactive "p")
    (if (equal arg 4)
        (org-agenda-follow-mode)
      (if (equal major-mode 'org-agenda-mode)
          (bh/set-agenda-restriction-lock 4)
        (widen))))
  
  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "F" 'bh/restrict-to-file-or-follow))
            'append)
  
  (defun bh/narrow-to-org-subtree ()
    (widen)
    (org-narrow-to-subtree)
    (save-restriction
      (org-agenda-set-restriction-lock)))
  
  (defun bh/narrow-to-subtree ()
    (interactive)
    (if (equal major-mode 'org-agenda-mode)
        (org-with-point-at (org-get-at-bol 'org-hd-marker)
          (bh/narrow-to-org-subtree))
      (bh/narrow-to-org-subtree)))
  
  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "N" 'bh/narrow-to-subtree))
            'append)
  
  (defun bh/narrow-up-one-org-level ()
    (widen)
    (save-excursion
      (outline-up-heading 1 'invisible-ok)
      (bh/narrow-to-org-subtree)))
  
  (defun bh/narrow-up-one-level ()
    (interactive)
    (if (equal major-mode 'org-agenda-mode)
        (org-with-point-at (org-get-at-bol 'org-hd-marker)
          (bh/narrow-up-one-org-level))
      (bh/narrow-up-one-org-level)))
  
  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "U" 'bh/narrow-up-one-level))
            'append)
  
  (defun bh/narrow-to-org-project ()
    (widen)
    (save-excursion
      (bh/find-project-task)
      (bh/narrow-to-org-subtree)))
  
  (defun bh/narrow-to-project ()
    (interactive)
    (if (equal major-mode 'org-agenda-mode)
        (org-with-point-at (org-get-at-bol 'org-hd-marker)
          (bh/narrow-to-org-project))
      (bh/narrow-to-org-project)))
  
  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "P" 'bh/narrow-to-project))
            'append)

  (defun bh/is-project-p ()
    "Any task with a todo keyword subtask"
    (save-restriction
      (widen)
      (let ((has-subtask)
            (subtree-end (save-excursion (org-end-of-subtree t)))
            (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-todo-keywords-1)
              (setq has-subtask t))))
        (and is-a-task has-subtask))))
  
  (defun bh/is-project-subtree-p ()
    "Any task with a todo keyword that is in a project subtree.
  Callers of this function already widen the buffer view."
    (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                                (point))))
      (save-excursion
        (bh/find-project-task)
        (if (equal (point) task)
            nil
          t))))
  
  (defun bh/is-task-p ()
    "Any task with a todo keyword and no subtask"
    (save-restriction
      (widen)
      (let ((has-subtask)
            (subtree-end (save-excursion (org-end-of-subtree t)))
            (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-todo-keywords-1)
              (setq has-subtask t))))
        (and is-a-task (not has-subtask)))))
  
  (defun bh/is-subproject-p ()
    "Any task which is a subtask of another project"
    (let ((is-subproject)
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (while (and (not is-subproject) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq is-subproject t))))
      (and is-a-task is-subproject)))
  
  (defun bh/list-sublevels-for-projects-indented ()
    "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
    This is normally used by skipping functions where this variable is already local to the agenda."
    (if (marker-buffer org-agenda-restrict-begin)
        (setq org-tags-match-list-sublevels 'indented)
      (setq org-tags-match-list-sublevels nil))
    nil)
  
  (defun bh/list-sublevels-for-projects ()
    "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
    This is normally used by skipping functions where this variable is already local to the agenda."
    (if (marker-buffer org-agenda-restrict-begin)
        (setq org-tags-match-list-sublevels t)
      (setq org-tags-match-list-sublevels nil))
    nil)
  
  (defun bh/skip-non-stuck-projects ()
    "Skip trees that are not stuck projects"
    (bh/list-sublevels-for-projects-indented)
    (save-restriction
      (widen)
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (if (bh/is-project-p)
            (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                   (has-next ))
              (save-excursion
                (forward-line 1)
                (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                  (unless (member "WAITING" (org-get-tags-at))
                      (setq has-next t))))
              (if has-next
                  next-headline
                nil)) ; a stuck project, has subtasks but no next task
          next-headline))))
  
  (defun bh/skip-non-projects ()
    "Skip trees that are not projects"
    (bh/list-sublevels-for-projects-indented)
    (if (save-excursion (bh/skip-non-stuck-projects))
        (save-restriction
          (widen)
          (let ((subtree-end (save-excursion (org-end-of-subtree t))))
            (if (bh/is-project-p)
                nil
              subtree-end)))
      (org-end-of-subtree t)))
  
  (defun bh/skip-project-trees-and-habits ()
    "Skip trees that are projects"
    (save-restriction
      (widen)
      (let ((subtree-end (save-excursion (org-end-of-subtree t))))
        (cond
         ((bh/is-project-p)
          subtree-end)
         ((org-is-habit-p)
          subtree-end)
         (t
          nil)))))
  
  (defun bh/skip-projects-and-habits-and-single-tasks ()
    "Skip trees that are projects, tasks that are habits, single non-project tasks"
    (save-restriction
      (widen)
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (cond
         ((org-is-habit-p)
          next-headline)
         ((bh/is-project-p)
          next-headline)
         ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
          next-headline)
         (t
          nil)))))
  
  (defun bh/skip-project-tasks-maybe ()
    "Show tasks related to the current restriction.
  When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
  When not restricted, skip project and sub-project tasks, habits, and project related tasks."
    (save-restriction
      (widen)
      (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
             (next-headline (save-excursion (or (outline-next-heading) (point-max))))
             (limit-to-project (marker-buffer org-agenda-restrict-begin)))
        (cond
         ((bh/is-project-p)
          next-headline)
         ((org-is-habit-p)
          subtree-end)
         ((and (not limit-to-project)
               (bh/is-project-subtree-p))
          subtree-end)
         ((and limit-to-project
               (bh/is-project-subtree-p)
               (member (org-get-todo-state) (list "NEXT")))
          subtree-end)
         (t
          nil)))))
  
  (defun bh/skip-projects-and-habits ()
    "Skip trees that are projects and tasks that are habits"
    (save-restriction
      (widen)
      (let ((subtree-end (save-excursion (org-end-of-subtree t))))
        (cond
         ((bh/is-project-p)
          subtree-end)
         ((org-is-habit-p)
          subtree-end)
         (t
          nil)))))
  
  (defun bh/skip-non-subprojects ()
    "Skip trees that are not projects"
    (let ((next-headline (save-excursion (outline-next-heading))))
      (if (bh/is-subproject-p)
          nil
        next-headline)))
