build:
	echo "building version"
	docker build . -t quay.io/zebbra/simply-simplify-language:${TAG}

publish:
	docker push quay.io/zebbra/simply-simplify-language:${TAG}