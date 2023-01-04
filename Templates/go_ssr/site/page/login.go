package page

import (
	"log"
	"net/http"

	"github.com/labstack/echo"
	"gorm.io/gorm"
)

type LoginPage struct {
	path     string
	template string
	db       *gorm.DB
}

type LoginPageData struct {
	Title    string
	UrlError string
}

func NewLoginPage(db *gorm.DB) *LoginPage {
	return &LoginPage{
		path:     "/login",
		template: "login",
		db:       db,
	}
}

func (p *LoginPage) GetPageData(c echo.Context) any {
	log.Print("Login page")
	return LoginPageData{
		Title:    "Login page",
		UrlError: c.QueryParam("error"),
	}
}

func (p *LoginPage) GetPagePath() string {
	return p.path
}

func (p *LoginPage) GetPostHandler() func(c echo.Context) error {
	return func(c echo.Context) error {
		log.Print(c.FormValue("username"))
		log.Print(c.FormValue("password"))

		return c.Redirect(http.StatusSeeOther, "/login?error=test")
	}
}

func (p *LoginPage) GetPageHandler() func(c echo.Context) error {
	return func(c echo.Context) error {
		return c.Render(http.StatusOK, p.template, echo.Map{
			"data": p.GetPageData(c),
		})
	}
}
