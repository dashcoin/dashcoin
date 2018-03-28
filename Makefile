all: all-release

cmake-debug:
	mkdir -p build/debug
	cd build/debug && cmake -D CMAKE_BUILD_TYPE=Debug ../..

build-debug: cmake-debug
	cd build/debug && $(MAKE)

test-debug: build-debug
	cd build/debug && $(MAKE) test

all-debug: build-debug

cmake-release:
	mkdir -p build/release
	cd build/release && cmake -D CMAKE_BUILD_TYPE=Release ../..

release-static-64:
	mkdir -p build/release
	cd build/release && cmake -D STATIC=ON -D ARCH="x86-64" -D BUILD_64=ON -D CMAKE_BUILD_TYPE=release ../.. && $(MAKE)

release-static-32:
	mkdir -p build/release
	cd build/release && cmake -D STATIC=ON -D ARCH="i686" -D BUILD_64=OFF -D CMAKE_BUILD_TYPE=release ../.. && $(MAKE)

build-release: cmake-release
	cd build/release && $(MAKE)

test-release: build-release
	cd build/release && $(MAKE) test

all-release: build-release

clean:
	rm -rf build

tags:
	ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ src contrib tests/gtest

.PHONY: all cmake-debug build-debug test-debug all-debug cmake-release build-release test-release all-release clean tags
