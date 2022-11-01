package gateways

import (
	"api/server/entities"
)

type GuestRepositry struct {
	SQLHandler
}

func (repo *GuestRepositry) FindByID(id int) (guest entities.Guest, err error) {
	if err = repo.Find(&guest, id).Error; err != nil {
		return
	}
	return
}

func (repo *GuestRepositry) FindAll() (guests entities.Guests, err error) {
	if err = repo.Find(&guests).Error; err != nil {
		return
	}
	return
}
