# manylinux-rust-clang

Docker image to build SCALib for linux on CI.

We start from manylinux image and install the rust compiler and a decent clang.

To upgrade versions, edit `.github/workflows/ci.yml` and push to main.
