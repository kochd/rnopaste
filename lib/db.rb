# -*- coding: utf-8 -*-
require 'sequel'
Sequel.extension :migration
DB = Sequel.connect(DATABASE)
Sequel::Migrator.run(DB, './migrations')

class Paste < Sequel::Model; end
