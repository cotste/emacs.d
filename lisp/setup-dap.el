;;; Package --- Summary
;;; Commentary:
;;;;My Debug templates

;;; Code
(dap-register-debug-template
  "Java Run Configuration - Blueprint"
  (list :name "Java Run Configuration - Blueprint"
        :type "java"
        :request "launch"
        :args "--spring.config.location=/home/chq-stephenco/repos/expd/ecp/platform-blueprint/platform-blueprint-application/blueprint-api/configs/local/application.properties"
        :cwd "~/repos/expd/ecp/platform-blueprint/platform-blueprint-application/blueprint-api"
        :stopOnEntry :json-false
        :host "localhost"
        :request "launch"
        :modulePaths []
	:VmArgs "-Djavax.net.ssl.trustStore=/home/chq-stephenco/certs/all_ca_certs.pfx -Djavax.net.ssl.trustStoreType=PKCS12 -Djavax.net.ssl.trustStorePassword=expeditors"
        :classPaths nil
        :projectName nil
        :mainClass nil
	:env '(("KEYCLOAK_CLIENT_SECRET" . "V3zBy8xwLN0jiIgFJFkSoZvGo73LblfG")
	       ("VAULT_ROLE_ID" . "dd61bf94-bed0-2ba0-1a71-c5888dde1c54")
	       ("VAULT_SECRET_ID" . "631f8b2c-c898-c9b7-4612-1c7dd5b97bc3")
	       ("GITLAB_TOKEN" . "pizdramAGxVetk_JNz91")
	       ("GIT_USERNAME" . "chq-stephenco")
	       ("GIT_PASSWORD" . "Morewater!"))))

(provide 'setup-dap)

;;; setup-dap.el ends here.
