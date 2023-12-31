package usecase

import (
	"github.com/andersonigorf/goexpert-clean-architecture/internal/entity"
)

type ListOrdersOutputDTO struct {
	Orders []OrderOutputDTO
}

type ListOrdersUseCase struct {
	OrderRepository entity.OrderRepositoryInterface
}

func NewListOrdersUseCase(
	OrderRepository entity.OrderRepositoryInterface,
) *ListOrdersUseCase {
	return &ListOrdersUseCase{
		OrderRepository: OrderRepository,
	}
}

func (l *ListOrdersUseCase) Execute() (ListOrdersOutputDTO, error) {
	orders, err := l.OrderRepository.FindAll()

	if err != nil {
		return ListOrdersOutputDTO{}, err
	}

	var ordersOutput []OrderOutputDTO

	for _, order := range orders {
		ordersOutput = append(ordersOutput, OrderOutputDTO{
			ID:         order.ID,
			Price:      order.Price,
			Tax:        order.Tax,
			FinalPrice: order.FinalPrice,
		})
	}

	return ListOrdersOutputDTO{Orders: ordersOutput}, nil
}
