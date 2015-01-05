rnopaste
========

Simple NoPaste service inspired by [pnopaste](https://github.com/tpruvot/pnopaste)

# How to install
* apt-get install bundler
* bundle install
* thin start -p 4444
* Open [http://localhost:4444](http://localhost:4444) in your browser

By default rnopaste uses a sqlite3 database. You can use any other database you like.
Have a look at [Sequel](https://github.com/jeremyevans/sequel) for details.

# Configuration
Everything that you might want to change is located in the config.ru file


Have fun!
