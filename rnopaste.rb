# # -*- coding: utf-8 -*-
require 'sinatra/base'
require 'slim'
require 'rouge'

LANGUAGES = Rouge::Lexers.constants

require_relative './lib/db.rb'
require_relative './lib/expire.rb'

class RNoPaste < Sinatra::Base
  before do
    @render_start = Time.now
  end

  get '/' do
    slim :index
  end

  get '/:pasteid' do
    @pasteid = params['pasteid']
    slim :display
  end

  get '/:pasteid/raw' do
    content_type 'text/plain'
    Paste[params['pasteid']].body
  end

  post '/' do
    #    return params.inspect
    if params['body'].nil?
      redirect to '/'
    end

    paste = Paste.create(description: params['description'],
                         language: params['language'],
                         creator: params['creator'],
                         created: Time.now,
                         expires: Time.now + params['expires'].to_i,
                         body: params['body'].gsub("\r\n", "\n")
                        )
    redirect to "/#{paste.id}"
  end
end
