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

update:
	git submodule update --init