package = "itchio"
version = "dev-1"

source = {
  url = ""
}

description = {
  summary = "the itch.io",
  homepage = "https://itch.io",
  license = "proprietary"
}

dependencies = {
  "busted",

  "lua ~> 5.1",
  "moonscript",
  "bcrypt",
  "luabitop",
  "argparse", -- needed for some cmd scripts

  "lapis == 1.14.0",
  "lapis-community == 1.44.3",
  "lapis-eswidget >= 1.1.0",

  "lapis-exceptions ~> 2.3",
  "lapis-bayes ~> 1.2",
  "lapis-console ~> 1.2",
  "lapis-systemd ~> 2.0",
  "lapis-redis ~> 1.0",
  "lapis-annotate ~> 2.0",
  "cloud_storage ~> 1.3",
  "mailgun ~> 1.2",
  "web_sanitize ~> 1.5",
  "magick ~> 1.6",
  "tableshape >= 2.6",
  "sitegen ~> 0.2",
  "giflib ~> 1.0",
  "lua-twitter ~> 1.0",
  "luajit-geoip ~> 2.1",
  "payments ~> 1.4",
  "http ~> 0.4",
  "lua-openai >= 1.2.0",

  "basexx",
  "cmark",
  "lrandom",
  "lpeg_patterns",
  "redis-lua",
}

build = {
  type = "none"
}


