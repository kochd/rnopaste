# -*- coding: utf-8 -*-
require 'sequel'
db = DATABASE
Sequel.extension :migration
DB = Sequel.connect(db)
DBNL = Sequel.connect(db)
Sequel::Migrator.run(DB, './migrations')

class Paste < Sequel::Model; end
