(defun camel-case-to-hyphens (string)
  (let ((case-fold-search nil))
    (replace-regexp-in-string
     "^-" "" (downcase (replace-regexp-in-string
                        "\\([A-Z]\\)" "-\\1" string)))))
