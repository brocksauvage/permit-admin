```
$ docker-compose build
$ docker-compose up -d
$ docker-compose exec app bash
root@abcde $ rails db:create
root@abcde $ rails db:migrate
root@abcde $ rails db:seed
root@abcde $ rails s -b 0.0.0.0


Go to http://0.0.0.0:2040
```