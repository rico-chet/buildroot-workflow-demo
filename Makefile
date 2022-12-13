BUILDROOT_VERSION ?= 2022.11

.PHONY: all
all:
	docker build \
		--build-arg BUILDROOT_VERSION=$(BUILDROOT_VERSION) \
		--tag buildroot-demo \
		.
	docker run \
		--interactive \
		--rm \
		--tty \
		buildroot-demo \
		make host-my-package
