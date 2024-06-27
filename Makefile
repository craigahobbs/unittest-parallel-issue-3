.phony: help
help:
	echo "usage: make [test|test2|clean]"

.phony: test
test: build/env.build
	build/env/bin/unittest-parallel -t . -s tests --coverage --coverage-source mypkg

.phony: test2
test2: build/env.build
	build/env/bin/unittest-parallel -t . -s tests --coverage --coverage-source src/mypkg

.phony: clean
clean:
	rm -rf build .coverage src/*.egg-info `find . -name __pycache__`

build/env.build:
	mkdir -p build
	python3 -m venv build/env --upgrade-deps
	build/env/bin/pip install -e '.[tests]'
	touch $@
