# ВОПРОСЫ

---

#### 1. Как хранить секретные данные, чтобы их указать в bucket, но при этом можно было коммитить в репозиторий? Т.е. как не хранить секретные данные в bucket?

ОТВЕТ:

````bash
export AWS_ACCESS_KEY_ID=YCAJE6CqxmdDNUheJJgRij204
export AWS_SECRET_ACCESS_KEY=YCM-yyBSz7pJA4fLgNbe6BrGmBw16oITZ5bvHX47
````

Либо через передачу переменных:

````bash
terraform init -backend-config="access_key=xzxzxzxzzxzxzx" -backend-config="secret_key=zxzxzxzzxzxzsdfsdfsdcf"
````

Об этом прямо написано вот здесь: https://developer.hashicorp.com/terraform/language/settings/backends/s3

---
