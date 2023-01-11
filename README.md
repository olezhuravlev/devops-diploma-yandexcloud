# Дипломная работа.


````bash
$ terraform version            
Terraform v1.3.6
on linux_amd64
````



````bash
$ terraform workspace new prod      
Created and switched to workspace "prod"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.

$ terraform workspace new stage 
Created and switched to workspace "stage"!

You're now on a new, empty workspace. Workspaces isolate their state,
so if you run "terraform plan" Terraform will not see any existing state
for this configuration.
````

Список рабочих пространств, текущее помечено звездочкой:
````bash
$ terraform workspace list  
  default
  prod
* stage
````

Или короче:
````bash
$ terraform workspace show       
prod
````

Переключение на рабочее пространство:
````bash
$ terraform workspace select prod
Switched to workspace "prod".
````




---
---

Инициализация Терраформа (без бэкенда!):
````bash
$ cd /run/media/oleg/Second/Netology/devops-diploma-yandexcloud/terraform/init
$ terraform init
$ terraform workspace new prod
$ terraform workspace new stage
$ terraform workspace select stage
$ terraform workspace list
  default
  prod
* stage
````

Создание каталога, сервисных аккаунтов и бакета:
````bash
$ terraform apply -auto-approve
````

````bash
Инициализация командной строки:
````bash
$ yc init
````

Список сервисных аккаунтов
````bash
$ yc iam service-account list                                 
+----------------------+--------------+
|          ID          |     NAME     |
+----------------------+--------------+
| ajettsd8msnher5s7bpb | terraform-sa |
+----------------------+--------------+
````

Список известных ключей доступа для сервисного аккаунта `terraform-sa`:
````bash
$ yc iam access-key list --service-account-name terraform-sa
+----------------------+----------------------+---------------------------+
|          ID          |  SERVICE ACCOUNT ID  |          KEY ID           |
+----------------------+----------------------+---------------------------+
| aje1rlofsmmckheljpcl | aje1ssgcqfn5ognms9i5 | YCAJE6hn3fq55gxSM1xw6PFA- |
+----------------------+----------------------+---------------------------+
````

Генерация ключа доступа для сервисного аккаунта:
````bash
$ yc iam access-key create --service-account-name terraform-sa
access_key:
  id: aje0sc461gufs4tq8o0f
  service_account_id: ajettsd8msnher5s7bpb
  created_at: "2023-01-11T15:30:24.365368326Z"
  key_id: YCAJE14-B7kvzfWRwD6ptWl__
secret: YCNkZQCYfyZi8NG48w46D-tykw3Np76VlJC7AL88
````

> Значение секретного ключа (поле `secret`) повторно получить невозможно, поэтому его следует сразу сохранить
> в безопасном месте!

Обновить ключи доступа в переменных окружения в файле `~/.zshrc`:

````bash
export YC_STORAGE_ACCESS_KEY=YCAJE14-B7kvzfWRwD6ptWl__
export YC_STORAGE_SECRET_KEY=YCNkZQCYfyZi8NG48w46D-tykw3Np76VlJC7AL88
````

Обязательно перезапустить консоль, чтобы новые значения переменных вступили в силу:
````bash
$ source ~/.zshrc
````

Создать/раскомментировать бэкенд (access_key и secret_key не нужны):
````bash
$ terraform init               

Initializing the backend...
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "s3" backend. No existing state was found in the newly
  configured "s3" backend. Do you want to copy this state to the new "s3"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value: yes
...
````

---

Терраформ использует сохраняемые состояния для отслеживания и управления ресурсам.
Здесь существует два варианта - интеграция с Terraform Cloud или использовать бэкенд, который определяет,
где именно Терраформу сохранять свои данные.
Такой подход позволяет нескольким пользователям иметь доступ к сохраняемым состояниям
и совместно работать с ресурсами.

Терраформ сохраняет конфигурацию в виде простого текста в двух файлах:
- `.terraform/terraform.tfstate` - содержит конфигурацию бэкенда для текущей рабочей директории;
- файлы планов, которые используют информацию из файла `.terraform/terraform.tfstate` во время создания плана чтобы
  гарантировать применение плана к правильному набору инфраструктуры;

При применении предварительного сохранённого плана Терраформ использует конфигурацию бэкенда, сохраненную в этом файле
вместо текущих настроект бэкенда.

Когда изменяется конфигурация бэкенда, то нужно снова выполнить `terraform init` для валидации и конфигурировании
бекенда до выполнения операций `plan`, `apply` или `state`.

После выполнения `terraform init` Терраформ локально создаст директорию `.terraform/`. Эта директория содержит последние
бэкенд конфигурации, включая все аутентификационные параметры, предоставленные посредством Terraform CLI.
Не следует сохранять директорию `.terraform/` в Git-репозитории, поскольку это может повлечь утечку чувствительных
данных.

Локальная конфигурация бэкенда отличается и полностью отделена от файла `terraform.tfstate`, хранящего данные состояния
о реальной инфраструктуре. Терраформ сохраняет файл `terraform.tfstate` в удалённом бэкенде.

При изменении бэкендов Терраформ предоставляет возможность мигрировать состояние в новый бэкенд. Это позволяет
переносить бэкенды без потери существующего состояния.

> ВАЖНО: Перед миграцией в новый бэкенд настоятельно рекомендуется вручную сохранить состояние путем копирования
> файла `terraform.tfstate`

---

````bash
````


````bash
````


````bash
````
