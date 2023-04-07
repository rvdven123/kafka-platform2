kubectl get node docker-desktop -o=jsonpath='{range .status.addresses[*]}{.type}{"\t"}{.address}{"\n"}'

docker-desktop
192.168.65.4


bootstrap port: 32319
node 0:  30079

kubectl config set-context --current --namespace=cdc

$HOME/.config/kafkacat.conf

kafkacat -C -b localhost:9092 -t topic1 -o beginning

kafkacat -L -b localhost:32319

kafkacat -L -b localhost:30079

kubectl exec my-cdc-cluster-kafka-0 -c kafka -it -- cat /tmp/strimzi.properties | grep advertised
kubectl get kafka my-cdc-cluster -o=jsonpath='{.status.listeners[?(@.name=="<listener_name>")].bootstrapServers}{"\n"}'

docker build . -t localhost:5000/kafka-connect-art-systeem:1.0
docker push localhost:5000/kafka-connect-art-systeem:1.0
docker run -ti custom-kafka-connect:1.1 bash

#install mysql
helm install mysql bitnami/mysql -f override-values.yaml
kubectl port-forward svc/mysql 3306 &
MYSQL_ROOT_PASSWORD=$(kubectl get secret mysql-connect-source -o jsonpath="{.data.mysql-root-password}" | base64 --decode; echo)
#BrKW6Sy9Gw
mysql -h ${MYSQL_HOST} -P${MYSQL_PORT} -u root -p${MYSQL_ROOT_PASSWORD}

#install the mysql kafka connector
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.48.zip


#Postgres Install
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install postgresql --set postgresqlPassword=test,postgresqlDatabase=test bitnami/postgresql
kubectl port-forward --namespace cdc svc/postgresql 5432:5432 &
export POSTGRES_PASSWORD=$(kubectl get secret --namespace cdc postgresql -o jsonpath="{.data.postgres-password}" | base64 --decode)
# pw: NfmZ1tMz16


./bin/kafka-configs --bootstrap-server localhost:9093 --entity-type brokers --entity-name 0 --alter \
--add-config "listener.name.internal.ssl.endpoint.identification.algorithm="

keytool -keystore kafka.client.truststore.jks -alias CARoot -importcert -file ca-cert
/etc/ssl/ca-bundle.crt  ca-bundle.trust.crt

kubectl get secret my-cdc-cluster-cluster-ca-cert -o jsonpath='{.data.ca\.crt}' | base64 -d > ca.crt

kafkacat -L

kafkacat -t ron.test.students \
         -C \
         -o-1 \
         -c1 \
         -f 'Topic %t / Partition %p / Offset: %o / Timestamp: %T\nHeaders: %h\nKey (%K bytes): %k\nPayload (%S bytes): %s\n--\n'

kubectl scale deploy my-connect-cluster-connect --replicas=0

kubectl expose deployment my-connect-cluster-connect --type=NodePort --name=connect-rest-api

curl -X GET http://localhost:30431/connectors
ron
curl -X POST http://localhost:30431/connectors/postgres-sink/restart

#helm
helm upgrade schema-registry . --set kafka.bootstrapServers=my-cdc-cluster-kafka-bootstrap:9092

helm uninstall ksql-server
helm install ksql-server \
        --set cp-schema-registry.url=http://schema-registry-cp-schema-registry:8081 \
        --set kafka.bootstrapServers=my-cdc-cluster-kafka-bootstrap:9092 \
        --set ksql.headless=false .


GET /schemas/ids/1?fetchMaxId=false&subject=ron.test.students-key