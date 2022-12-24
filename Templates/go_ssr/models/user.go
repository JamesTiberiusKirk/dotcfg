package models

import (
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

const (
	hashCost = 4
)

type User struct {
	gorm.Model
	Email    string `gorm:"UNIQUE;NOT NULL"`
	Password string
}

// SetPassword will accept a string password and attempt to hash and salt it. Providing the
// hash is successful, the Password field of the User will be updated.
func (u *User) SetPassword(password string) error {

	pass, err := bcrypt.GenerateFromPassword([]byte(password), hashCost)
	if err != nil {
		return err
	}

	u.Password = string(pass)
	return nil
}

// ComparePassword will evaluate the provided password witht the one stored against the
// user by hashing it first. If the passwords match, true will be returned (with a nil,
// error) otherswise, false will be returned.
//
// If an error is returned, it means that the passwords weren't able to be compared, and so
// the result cannot be trusted.
func (u *User) ComparePassword(password string) (bool, error) {

	err := bcrypt.CompareHashAndPassword([]byte(u.Password), []byte(password))
	if err == bcrypt.ErrMismatchedHashAndPassword {
		return false, nil
	}

	if err != nil {
		return false, err
	}

	return true, err
}
