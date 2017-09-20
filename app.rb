require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/book")
require("pg")

DB = PG.connect({:dbname => "library"})
