package = "itchio"
version = "dev-1"

source = {
  url = "git://git@git.itch.ovh:itchio/itchio-site.git"
}

description = {
  summary = "the itch.io",
  homepage = "https://itch.io",
  license = "proprietary"
}

dependencies = {
  "lua ~> 5.1",
  "moonscript",
  "bcrypt",
  "luabitop",
  "busted",

  -- these should install from master
  "lapis",
  -- "lapis-community",

  "lapis-exceptions ~> 2",
  "lapis-bayes ~> 1.1",
  "lapis-console ~> 1.2",
  "lapis-systemd ~> 1.0",
  "lapis-redis ~> 1.0",
  "cloud_storage ~> 1.1",
  "mailgun ~> 1.2",
  "web_sanitize ~> 1.1",
  "magick ~> 1.6",
  "tableshape ~> 2.2",
  "sitegen ~> 0.1",
  "giflib ~> 1.0",
  "lua-twitter ~> 1.0",
  "luajit-geoip ~> 2.1",
  "payments ~> 1.0",

  "basexx",
  "cmark",
  "lrandom",
  "lpeg_patterns",
  "redis-lua 2.0.4",
}

build = {
  type = "none"
}

