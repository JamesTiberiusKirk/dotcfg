package main

import (
	"encoding/json"
	"fmt"
	"go_ssr/site"
)

func main() {
	initLogger()

	config := buildConfig()

	db := initDb(config)
	e := initServer(config)

	s := site.NewSite(config.Http.RootPath, db, e)

	s.Serve()

	data, _ := json.MarshalIndent(e.Routes(), "", "  ")
	fmt.Print(string(data))

	e.Logger.Fatal(e.Start(config.Http.Port))
}
