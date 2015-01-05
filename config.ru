# Add your database here
# Postgres is prefered. Others should work the same
#          'databse://user:password@server/database-name'
DATABASE = 'sqlite://pastes.db'

# Defines expire presets. Key is the text displayed, value is the time in seconds
EXPIRES = {
  '1 Day' => 60 * 60 * 24,
  '6 Hours' => 60 * 60 *6,
  '1 Hour' => 60 * 60
}

# Check every X seconds for expired pastes and delete them
EXPIRES_CHECK_EVERY = 600

# How dates should be displayed
DATE_FORMAT = "%Y/%m/%d %H:%M:%S"

# Should line numbers be displayed ?
LINE_NUMBERS = true

# One of [ThankfulEyes, Colorful, Base16, Github, Monokai, MonokaiSublime]
THEME = "Monokai"

# Do not change this :)
require './rnopaste.rb'
run RNoPaste
