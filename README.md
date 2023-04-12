# Momo Store aka Пельменная №2

Дипломная работа Яндекс.Практикум

<img width="900" alt="image" src="https://user-images.githubusercontent.com/9394918/167876466-2c530828-d658-4efe-9064-825626cc6db5.png">

# Ссылки на ресурсы
- Сайт пельменной: https://momostore.fun
- Репозиторий приложения: https://gitlab.praktikum-services.ru/std-011-065/momo-store
- GitLab Container Registry: https://gitlab.praktikum-services.ru/std-011-065/momo-store/container_registry


# Устройство репозитория

```
├── backend             -  Backend часть приложения на Golang
├── frontend            -  Frontend часть приложения на HTML + JavaScript
├── infrastructure      -  Скрипты terraform и ansible для равертывания инфраструктуры
└── monitoring-tools    -  Docker Compose Stack with Grafana Loki Promtail Prometheus с уже готовым шаблоном для мониторинга приложения momostore.fun
```



# Развертывание инфраструктуры
## Terraform

```
terraform apply
terraform destroy
```

## Ansible
```
ansible-playbook playbook.yaml
```


## Уничтоже
```
terraform destroy
```

Об устройстве репозитория
По развёртыванию инфраструктуры
О правилах внесения изменения в инфраструктуру
О релизном цикле приложения и правилах версионирования
Подготовить небольшую презентацию, на которой рассказать о реализации инфраструктуры. Можно слайды, можно просто пошарить экран. Суть в том, что у вас должен быть план рассказа.

# Развертывание приложения
## В ручную
### Frontend

```bash
npm install
NODE_ENV=production VUE_APP_API_URL=http://localhost:8081 npm run serve
```

### Backend

```bash
go run ./cmd/api
go test -v ./... 
```

## Docker
```
docker network create -d bridge momo_network
docker run -d --name momo-backend -p 8081:8081 --network=momo_network --restart always --pull always gitlab.praktikum-services.ru:5050/std-011-065/momo-store/momo-backend:latest
docker run -d --name momo-frontend -p 80:80 --network=momo_network --restart always --pull always gitlab.praktikum-services.ru:5050/std-011-065/momo-store/momo-frontend:latest
```

## Docker compose
```
docker compose -f ./docker-compose.yml up -d
```
# Мониторинг
## Развертывание стека мониторинга
<img width="900" alt="image" src="https://raw.githubusercontent.com/pernatik/grafana-loki-prometheus/main/pic/grafana.jpg">


```
git clone https://gitlab.praktikum-services.ru/std-011-065/momo-store.git
cd momo-store/monitoring-tools
docker-compose up -d
```
## Удаление стека мониторинга
```
docker-compose down
```

