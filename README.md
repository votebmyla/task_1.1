## 1.1 Работа с Docker

### 1. Создайте папку для проекта и перейдите в нее.

> `mkdir ~/task_1_1` \
> `cd task_1_1`

### 2. Установите докер на машину.

> `sudo dnf install docker-ce docker-ce-cli containerd.io`

### 3. Запустите контейнер с nginx скачанным из docker hub. Контейнер должен быть запущен из командной строки с параметром -expose или -p для того чтобы после запуска стартовая страница nginx была доступна из браузера вашего компьютера.

> `docker pull nginx` \
> `docker run -d -p 80:80 nginx`

### 4. Запустите контейнер с MySQL скачанным из докер хаба, используйте --volume , -v при запуске контейнера для того чтобы сохранить базу данных жестком диске хоста.

> `docker pull mysql` \
> `docker run \`\
> `-d \`\
> `-p 3306:3306 \`\
> `-e MYSQL_ROOT_PASSWORD=12345 \`\
> `-v /home/ralymbetov/Desktop/task_1_1/mysql_data:/var/lib/mysql \`\
> `mysql:latest`

### 5. После запуска контейнера подключитесь к базе, создайте нового пользователя и новую базу.

> `docker exec -it {mysql_container_id_or_name} mysql -uroot -p12345` \

- _#после этого запускается командная строка mysql_

> `CREATE USER 'myuser' IDENTIFIED BY 'mypass';` \
> `CREATE DATABASE mydb;`

## 1.2 Работа с Dockerfile

### 1. Создайте файл Dockerfile в корневой папке проекта. В качестве базового образа используйте Ubuntu 20.04.

- _#создаем файл с названием Dockerfile (регистр имеет значение)_
- _#записываем в Dockerfile следующие строки:_

> `FROM ubuntu:20.04`

### 2. Дополните Dockerfile инструкциями из которого при выполнении команды docker build соберется docker образ с установленным Ruby 2.7.2

> `FROM ubuntu:20.04` \
> `LABEL "base os-release"=ubuntu:20.04 ` \
> `LABEL "ruby version"=2.7.2` \
> `RUN apt-get update && \` \
> `apt-get install -y \`\
> `git \`\
> `curl \`\
> `autoconf \`\
> `bison \`\
> `build-essential \`\
> `libssl-dev \`\
> `libyaml-dev \`\
> `libreadline6-dev \`\
> `zlib1g-dev \`\
> `libncurses5-dev \`\
> `libffi-dev \`\
> `libgdbm6 \`\
> `libgdbm-dev \`\
> `libdb-dev && \`\
> `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash` \
> `RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \` \
> `echo 'eval "$(rbenv init -)"' >> ~/.bashrc ` \
> `RUN ~/.rbenv/bin/rbenv install 2.7.2 && \` \
> `~/.rbenv/bin/rbenv global 2.7.2 ` \
> `CMD ~/.rbenv/shims/ruby -v`

### 3. После успешной сборки образа, запустите контейнер для выполнения команды ruby -v, для проверки работоспособности ruby.

> `docker run -t ruby-2.7.2:1.0 .`

## 1.3 Работа с Docker Compose

### 1. Установите docker-compose на хост

> `sudo apt install docker-compose -y`

### 2. С помощью docker-compose установите и запустите сайт на Wordpress. Помимо docker-compose.yml файла у вас могут быть другие файлы необходимые для работы Wordpress, например nginx.conf и другие.

> `cd 1.3/` \
> `docker-compose -f docker-compose.yml up`
