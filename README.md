# Awsome Kafka Producer
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/09acde1e82d246679e3d89622e5c0c68)](https://www.codacy.com/manual/mail_62/triggerise-shop?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=ricardomiranda/triggerise-shop&amp;utm_campaign=Badge_Grade)
[![Codacy Badge](https://api.codacy.com/project/badge/Coverage/09acde1e82d246679e3d89622e5c0c68)](https://www.codacy.com/manual/mail_62/triggerise-shop?utm_source=github.com&utm_medium=referral&utm_content=ricardomiranda/triggerise-shop&utm_campaign=Badge_Coverage)
## About
This is a command line program to generate Kafka messages with a header and payload. It is possible to control the topic and partition.
## Run program
Clone the project to your machine.
Go to project folder.
Run instructions:
```bash
sbt assembly
docker build -f ./Dockerfile . -t awsome-kafka-producer
docker run -it awsome-Kafka-producer
```
## User interaction
When you start Awsome Kafka Producer this pront shows on the CLI.
```bash
Please write message to send to Nuntius.
```
Enter the message you want in a single line, there are several options, being the unique mandatory option is topic, *-t*.

The usage of Awsome Kafka Producer is:
```bash
Usage:  [options]

  -c, --correlationId  - Header with a correlation ID, optional
  -k, --key - Kafka topic partition key, defults to null
  -m, --messageId - Header with message ID, automatically generated if missing
  -p, --payload - Message payload (value), defaults to {}
  -r, --requester - Header with requester description, optional
  -d, --requesterDetails - Header with requester details, optional
  -n, --returnAddressNotOk - Header with return address not OK, optional
  -o, --returnAddressOk - Header with return address if OK, optional
  -t, --topic - Kafka topic, mandatory
```
So the minimal input is:
```bash
-t my-topic
```
## Test program
To test the program do:
```bash
sbt test
```
## Logs
To examine logs, after starting the container as described above, go to the command line and do:
```bash
docker ps
```
From the screen output, copy the container name. Do this command now:
```bash
docker exec -ti <container_name> tail -f /tmp/awsome-kafka-producer.log
```
Now logs will appear in the console in real time.
## Requisites
You must have docker in your machine.

You must also have an accessible Kafka cluster. If you do not have one, I suggest
you install Kafka in docker compose as described by [Confluent](https://docs.confluent.io/current/quickstart/ce-docker-quickstart.html).
## Authors
*   [Ricardo Miranda](https://github.com/ricardomiranda)
## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details