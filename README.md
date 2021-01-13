# PHP SEND EMAIL
## BUILD WITH
- PHP
- POSTGRESQL
- RABBITMQ FOR MESSAGE DISTRIBUTION

### Installation

```sh
$ git clone https://github.com/IbnAnjung/42b1e3905f73f94b15e309160f496a3a.git
$ cd 42b1e3905f73f94b15e309160f496a3a
$ cp .env-example .env
$ composer install
```

### Configure your .env file


## HOW TO USE ?
1. dump schema.sql => pg_dump -U <username> <dbname> > schema.sql
2. run php brokerReceiver.php  => this will listen your job queue
3. [POST] /register.php
    * username & password are required
4. [POST] /login.php
    * body => username & password are required
    * eg. response => json [
        {
            "status": true,
            "message": "LOGIN berhasil.",
            "jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJvZGVvX21haWwiLCJhdWQiOiJzYXB1dHJhIiwiaWF0IjoxNjEwNDY1MTE2LCJuYmYiOjE2MTA0NjUxMjYsImV4cCI6MTYxMDQ2ODcxNiwiZGF0YSI6eyJ1c2VybmFtZSI6InNhcHV0cmEiLCJpZCI6MTB9fQ.684-_w42jZCbnbOpPbB9DIIiV1FWWwmcACnRcrYDrFU",
            "username": "saputra",
            "expireAt": 1610468716
        }
    ]
5. [POST] /sendMaiil.php
    * header => Authorization => Bearer <your token> 
    * body =>
        - title
        - email
        - subject
        - body
    * response => json [
  'email berhasil di kirim'
]
