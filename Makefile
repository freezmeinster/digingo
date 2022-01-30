run:
	@./digipud/manage.py runserver 0.0.0.0:9000
prepare_build:
	@test -d Python-3.10.2 && rm -rf Python-3.10.2
	@wget -c https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tar.xz
	@tar -Jxvf Python-3.10.2.tar.xz
build_runtime:
	@mkdir -p /opt/digipud/runtime
	@rm -rf /opt/digipud/runtime/*
	@cd Python-3.10.2; ./configure --enable-optimizations --prefix=/opt/digipud/runtime/ --disable-test-modules
	@cd Python-3.10.2; make -j 12 build_all
	@cd Python-3.10.2; make -j 12 altinstall
	@/opt/digipud/runtime/bin/pip3.10 install -r digipud/requirements.txt
