package main

import (
	env "github.com/Netflix/go-env"
	"github.com/sirupsen/logrus"
)

type Config struct {
	Debug bool `env:"DEBUG"`
	Db    struct {
		Name string `env:"DB_NAME"`
		Host string `env:"DB_HOST"`
		Port int    `env:"DB_PORT"`
		User string `env:"DB_USER"`
		Pass string `env:"DB_PASS"`
	}
	Http struct {
		Port     string `env:"HTTP_PORT"`
		RootPath string `env:"HTTP_ROOT_PATH"`
	}
	Extras env.EnvSet
}

func buildConfig() Config {
	var c Config
	es, err := env.UnmarshalFromEnviron(&c)
	if err != nil {
		logrus.
			WithError(err).
			Fatal("unable to get env variables")
	}

	c.Extras = es

	return c
}
