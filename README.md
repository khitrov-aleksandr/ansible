# Настройка клиента

## С помощью скрипта

```
curl -sk https://git.domain.ru/unix/ansible/raw/master/scripts/set_client.sh|bash
```

## Вручную

1. Добавляем пользователя ansible:
    ```
    useradd -m ansible
    ```
1. Добавляем пользователя в группу wheel для возможности работы с sudo:
    ```
    usermod -aG wheel ansible
    ```
1. Изменяем пароль пользователя ansible:
    ```
    passwd ansible
    ```
    пароль пользователя находится в KeePass.

1. Добавляем ssh-ключ:
    ```
    su - ansible
    ```
    ```
    mkdir ~/.ssh
    ```
    ```
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQsdfsdfsdfsdfsdfsdfsdfsdfsdfsdfoSK5UxrFetmz3giYPSUYw33g7Oj13j+334U76Qkc04veyafUWjcYbqeM5H8WuxFQKKRKSesZsoFXZqOa6N6I7FkskgiuYQk6R2oqaJyGiQAyzTwxBv5LcxrT0cKp9wpZXaaTrrWngZuGFEsoOUEIBxrhR+7GJrjCApcLYsVUDAUgJLO9ojbfZr2xjzu4OUtCP+N7DP7Ux6aotKJWKhqk7VEO6SOl5VLjUTUDrxU6rQR8ZlJIMrsuPPtU1w/Hbvfq1AnXJYvp2Y6qRAxybDlH4yOUr2dcyaG1ZlJSNaygGc+jBHykG36Df ansible@domain.ru" > ~/.ssh/authorized_keys
    ```
    ```
    chmod 700 ~/.ssh
    ```
    ```
    chmod 400 ~/.ssh/authorized_keys
    ```
1. Добавляем новый сервер в инвентори-файл hosts:
    ```
    [svn]
    svnserver01
    ```
1. Проверяем работу с ansible-сервера:
    ```
    ansible svn --extra-vars='@sudopw' -m ping
    ```
    ```
    svnserver01 | SUCCESS => {
        "changed": false, 
        "ping": "pong"
    }
    ```
 
