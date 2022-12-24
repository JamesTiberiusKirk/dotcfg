package page

import (
	"github.com/labstack/echo"
)

type PageInterface interface {
	GetPageData(c echo.Context) any
	GetPagePath() string
	GetPageHandler() func(c echo.Context) error
	GetPostHandler() func(c echo.Context) error
}

type FramePage struct {
	MenuId  string
	Content PageInterface
}

type FramePageData struct {
	MenuGroupId string
	MenuId      string
	Template    string
	PageData    any
}
