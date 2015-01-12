# # -*- coding: utf-8 -*-
require 'sinatra/base'
require 'slim'
require 'rouge'
require 'securerandom'

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

  get '/:hashid' do
    @hashid = params['hashid']
    redirect to '/' unless Paste.first(hashid: @hashid)
    slim :display
  end

  get '/:hashid/raw' do
    content_type 'text/plain'
    Paste.first(hashid: params['hashid']).body
  end

  post '/' do
    #    return params.inspect
    if params['body'].nil?
      redirect to '/'
    end


    #generate the hashid
    hashid = nil
    while hashid.nil? || Paste.first(hashid: hashid)
      hashid = SecureRandom.urlsafe_base64(HASH_LENGTH)
    end

    paste = Paste.create(description: params['description'],
                         language: params['language'],
                         creator: params['creator'],
                         created: Time.now,
                         expires: Time.now + params['expires'].to_i,
                         body: params['body'].gsub("\r\n", "\n"),
                         hashid: hashid
                        )
    redirect to "/#{paste.hashid}"
  end
end
