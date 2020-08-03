(defconst org-roam-bibtex-packages
  '(org-roam-bibtex))

(defun org-roam-bibtex/init-org-roam-bibtex ()
  (use-package org-roam-bibtex
    :after (org-roam)
    :hook (org-roam-mode . org-roam-bibtex-mode)
    :config
    (setq org-roam-bibtex-preformat-keywords
          '("=key=" "title" "url" "file" "author-or-editor" "keywords"))
    (setq orb-templates
          '(("r" "ref" plain (function org-roam-capture--get-point)
             ""
             :file-name "${slug}"
             :head "#+TITLE: ${=key=}: ${title}\n#+ROAM_KEY: ${ref}

- tags ::
- keywords :: ${keywords}

\n* ${title}\n  :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :URL: ${url}\n  :AUTHOR: ${author-or-editor}\n  :NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n  :NOTER_PAGE: \n  :END:\n\n"

             :unnarrowed t))))
  )
