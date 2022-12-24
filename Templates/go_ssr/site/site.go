package site

import (
	"html/template"
	"music_manager/site/page"

	"github.com/foolin/goview"
	"github.com/foolin/goview/supports/echoview"
	"github.com/labstack/echo"
	"gorm.io/gorm"
)

type Site struct {
	path        string
	pages       []page.PageInterface
	staticPages map[string]string
	db          *gorm.DB
	echo        *echo.Echo
	frameTmpl   string
	tmplFuncs   template.FuncMap
}

func NewSite(path string, db *gorm.DB, e *echo.Echo) Site {
	return Site{
		path: path,
		pages: []page.PageInterface{
			page.NewHomePage(db),
			page.NewLoginPage(db),
		},
		db:        db,
		echo:      e,
		frameTmpl: "frame",
	}
}

func (s *Site) Serve() {
	s.buildRenderer()
	s.mapPages()
}

func (s *Site) buildRenderer() {
	s.echo.Renderer = echoview.New(goview.Config{
		Root:         "site/page",
		Extension:    ".gohtml",
		Master:       s.frameTmpl,
		Funcs:        s.tmplFuncs,
		DisableCache: true,
	})
}

func (s *Site) mapPages() {
	for _, p := range s.pages {
		s.echo.GET(p.GetPagePath(), p.GetPageHandler())

		post := p.GetPostHandler()
		if post != nil {
			s.echo.POST(p.GetPagePath(), post)
		}

	}
}
