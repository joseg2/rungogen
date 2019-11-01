IMAGE?=ubuntu:19.10
TAG?=$(USER)/gogen:2.0
INSTANCE?=gogener

buildimage::
	docker build -t ${TAG} .

container::
	docker run -d --rm -h ${INSTANCE} --name ${INSTANCE} -v $(HOME)/Softwawre:/code ${TAG}

interactive::
	docker exec -ti ${INSTANCE} bash -l

generate::
	docker exec ${INSTANCE} $(GOGEN_CMD)

stop::
	docker stop ${INSTANCE}

cleanimage::
	docker rmi ${TAG}

clean:: stop cleanimage
