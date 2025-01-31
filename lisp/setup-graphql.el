

(defun sjc-load-keycloak-secret ()
  (interactive)
  (load "~/.keycloaksecret.gpg"))
  
(defun sjc-get-keycloak-token (&optional scope)
  (interactive "sEnter Scope: ")
  (let ((keycloak-endpoint "https://auth.preprod.ecp.expeditors.com/auth/realms/preprod/protocol/openid-connect/token")
        (url-request-method "POST")
        (url-request-extra-headers '(("Content-Type" . "application/x-www-form-urlencoded")))
        
        (url-request-data (concat "client_id=chq-stephenco&grant_type=client_credentials&scope=" scope "&client_secret=" keycloak-secret)))

    (with-current-buffer (url-retrieve-synchronously keycloak-endpoint)
      (goto-char (point-min))
      (goto-char url-http-end-of-headers)
      (prog1
          (setq keycloak-token (cdar (json-read)))
        (kill-buffer)))
    (message (concat "client_id=chq-stephenco&grant_type=client_credentials&scope=" scope "&client_secret=" keycloak-secret))))

(defun sjc-set-graphql-extra-headers ()
  (interactive)
  ;;(setq graphql-extra-headers (concat "{\"Authorization\": Bearer " keycloak-token "\"}"))
  (setq graphql-extra-headers
         `((user-agent . "emacs")
           (Authorization . ,(concat "Bearer " keycloak-token)))))

(defun sjc-set-graphql-scope (scope)
  (interactive "sEnter scope(s):")
  (message "Scopes: %s" scope))

(message keycloak-token)
;; (let ((scope "unacceptablecommoditydescription"))
;;   (message (concat "client_id=chq-stephenco&grant_type=client_credentials&client_secret=" keycloak-secret "&scope=" scope)))


(provide 'setup-graphql)
