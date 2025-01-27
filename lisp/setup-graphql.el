

(defun sjc-load-keycloak-secret ()
  (interactive)
  (load "~/.keycloaksecret.gpg"))
  
(defun sjc-get-keycloak-token ()
  (interactive)
  (let ((keycloak-endpoint "https://auth.preprod.ecp.expeditors.com/auth/realms/preprod/protocol/openid-connect/token")
        (url-request-method "POST")
        (url-request-extra-headers '(("Content-Type" . "application/x-www-form-urlencoded")))
        (url-request-data (concat "client_id=chq-stephenco&grant_type=client_credentials&client_secret=" keycloak-secret)))

    (with-current-buffer (url-retrieve-synchronously keycloak-endpoint)
      (goto-char (point-min))
      (goto-char url-http-end-of-headers)
      (prog1
          (setq keycloak-token (cdar (json-read)))
        (kill-buffer)))))

(defun sjc-set-graphql-extra-headers ()
  (interactive)
  ;;(setq graphql-extra-headers (concat "{\"Authorization\": Bearer " keycloak-token "\"}"))
  (setq graphql-extra-headers
         `((user-agent . "emacs")
           (Authorization . ,(concat "Bearer " keycloak-token)))))

(message keycloak-token)
