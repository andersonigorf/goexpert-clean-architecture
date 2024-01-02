# [Pós GoExpert - FullCycle](https://fullcycle.com.br)

## Desafio 03 - Clean Architecture

Desafio aplicando conceitos de Clean Architecture em Go.

Criar o usecase de listagem das orders com:
- Endpoint REST (GET /order)
- Service ListOrders com GRPC
- Query ListOrders GraphQL

### Pré-requisitos
- [Golang](https://golang.org/)
- [Docker](https://www.docker.com/)
- [Migrate](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate)

### Como executar a aplicação

```bash

  # 1 - Clonar o repositório do projeto
  git clone https://github.com/andersonigorf/goexpert-clean-architecture.git
  
  # 2 - Acessar o diretório do projeto
  cd goexpert-clean-architecture

  # 3 - Executar o projeto com o Docker
  docker-compose up -d

  # 4 - Executar as migrações
  make migrate
  
  # 5 - Executar a aplicação
  cd ./cmd/ordersystem
  
  go run main.go wire_gen.go
  
  # 6 - Requests para criar e listar as orders (dentro da pasta ./api).
  
  create_order.http
  
  list_orders.http


```