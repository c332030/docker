
program_home=/home/program

NAME=redis

PORT=6379

docker stop $NAME

docker rm $NAME

mkdir $program_home/$NAME/data
chmod 777 $program_home/$NAME/data


program_home=/home/program
CONFIG=/usr/local/etc/redis/redis.conf

docker run -d \
  --privileged=true \
  --restart on-failure:3 \
  \
  --log-opt max-size=10m \
  --log-opt max-file=3 \
  \
  -v /etc/localtime:/etc/localtime \
  -v $program_home/$NAME/redis.conf:$CONFIG \
  \
  -p $PORT:6379 \
  \
  --name $NAME \
  \
  redis:alpine \
  \
  redis-server $CONFIG

docker logs $NAME

docker exec -it $NAME bash
