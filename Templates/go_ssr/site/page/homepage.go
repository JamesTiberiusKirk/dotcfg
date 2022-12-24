package page

import (
	"log"
	"net/http"

	"github.com/labstack/echo"
	"gorm.io/gorm"
)

type HomePage struct {
	path     string
	template string
	db       *gorm.DB
}

type HomePageData struct {
	Title string
}

func NewHomePage(db *gorm.DB) *HomePage {
	return &HomePage{
		path:     "/home",
		template: "homepage",
		db:       db,
	}
}

func (p *HomePage) GetPageData(c echo.Context) any {
	log.Print("Home page")
	return HomePageData{
		Title: "Hello world",
	}
}

func (p *HomePage) GetPagePath() string {
	return p.path
}

func (p *HomePage) GetPostHandler() func(c echo.Context) error {
	return nil
}

func (p *HomePage) GetPageHandler() func(c echo.Context) error {
	return func(c echo.Context) error {
		return c.Render(http.StatusOK, p.template, echo.Map{
			"data": p.GetPageData(c),
		})
	}
}
