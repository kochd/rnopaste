rnopaste
========

Simple NoPaste service inspired by [pnopaste](https://github.com/tpruvot/pnopaste)

# Example
[Here](http://paste.triple6.org)

# How to install
* apt-get install bundler
* bundle install
* thin start -p 4444
* Open [http://localhost:4444](http://localhost:4444) in your browser

By default rnopaste uses a sqlite3 database. You can use any other database you like.
Have a look at [Sequel](https://github.com/jeremyevans/sequel) for details.

# Configuration
Everything that you might want to change is located in the config.ru file

# Performance
PNoPaste rendered 1000 Lines of C code in ~ 4 seconds
RNoPaste rendered 1000 Lines of C code in ~ 0.2 seconds

# Have fun!
