# Create cron job to run python (using pandas library) script inside docker container

1. create python script to run

2. create.sh file to execute python script

3. entrypoint.sh file to execute cron job inside docker

4. Dockerfile - install python, cron and requirements.txt to run python and cron
Note: You can use any base image. But pandas, numpy, scipy libraries does not support alpine

5. Build docker image
docker build -t cron:latest

7. Run container
docker run -d --name cron cron:latest

8. Check if cron is working
docker exec -it cron bash
check /var/log/chron.log or check time creation of pop.csv file
