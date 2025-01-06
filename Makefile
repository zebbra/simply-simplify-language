build:
	echo "building version"
	docker build . -t quay.io/zebbra/simply-simplify-language:${TAG}

publish:
	docker push quay.io/zebbra/simply-simplify-language:${TAG}
	echo "need to update chart /cloud/manifests/simply-simplify-language/values.yaml"