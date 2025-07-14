NAMESPACE := "calibre"
RELEASE_NAME := "calibre-web-automated"
REPOSITORY := "."

.PHONY: use-context
use-context:
	kubectl config use-context ${CONTEXT}

.PHONY: dependency_update
dependency_update:
	helm dependency update

.PHONY: template
template:
	rm -rf $(CURDIR)/_templates/
	helm -n ${NAMESPACE} template --release-name ${RELEASE_NAME} --output-dir $(CURDIR)/_templates/ -f values.yaml ${REPOSITORY} --debug

.PHONY: helm_install
helm_install:
	helm -n ${NAMESPACE} upgrade --install ${RELEASE_NAME} ${REPOSITORY} --values values.yaml --debug

.PHONY: helm_install
helm_install_dev:
	helm -n ${NAMESPACE_DEV} upgrade --install ${RELEASE_NAME} ${REPOSITORY} --values values.dev.yaml --debug

.PHONY: helm_uninstall
helm_uninstall:
	helm -n ${NAMESPACE} uninstall ${RELEASE_NAME}

.PHONY: helm_uninstall
helm_uninstall_dev:
	helm -n ${NAMESPACE_DEV} uninstall ${RELEASE_NAME}

docker-build:
	cd .. && \
	docker build -t docker-registry.parrot-hen.ts.net:5000/calibre-web-automated:latest -f Dockerfile . && \
	docker push docker-registry.parrot-hen.ts.net:5000/calibre-web-automated:latest

.PHONY: deploy
deploy: helm_install

.PHONY: undeploy
undeploy: helm_uninstall

redeploy: undeploy deploy
