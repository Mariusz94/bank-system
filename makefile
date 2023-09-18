git_config:
	git config user.name "Mariusz94"
	git config user.email "lyszczarz.mariusz@gmail.com"

notes:
	git submodule add --force git@github.com:Mariusz94/bs-authentication-ms.git
	git submodule add --force git@github.com:Mariusz94/bs-withdrawl-ms.git
	git submodule add --force git@github.com:Mariusz94/bs-deposit-ms.git
	git submodule add --force git@github.com:Mariusz94/bs-transfer-ms.git
	git submodule add --force git@github.com:Mariusz94/bs-database-db.git
	git submodule add --force git@github.com:Mariusz94/bs-db_connector-ms.git
	git submodule add --force git@github.com:Mariusz94/bs-task_broker-bm.git
	git submodule add --force git@github.com:Mariusz94/bs-rest_api-ms.git
	git submodule add --force git@github.com:Mariusz94/bs-files-proto.git

update:
	git submodule update --init

run:
	docker-compose down
	docker-compose up -d --build bs-database-db bs-db_connector-ms bs-authentication-ms
	docker logs -f bs-authentication-ms

install_venv:
	python3.8 -m venv venv
	./venv/bin/pip3 install -r ./bs-rest_api-ms/app/requirements.txt
	./venv/bin/pip3 install pip install -U sphinx==7.1.2
	./venv/bin/pip3 install pip install sphinx-rtd-theme==1.3.0
	./venv/bin/pip3 install pip install pytest==7.4.2
	./venv/bin/pip3 list

test:
	./venv/bin/pytest -vv ./bs-rest_api-ms/tests/functional_tests/test.py

# make rm DIR=ec-files-proto
rm:
ifeq ($(OS), Windows_NT)
	rmdir /s /q $(DIR)
else
	rm -rf $(DIR)
endif


# Generate microservice structure
gen_ms:
	git clone --branch main https://github.com/Mariusz94/structure_project_generator.git
	cp -a ./structure_project_generator/python/microservice/. ./bs-authentication-ms/.
	make rm DIR=structure_project_generator
