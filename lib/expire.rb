Thread.new do
  Thread.current.priority = -3
  loop do
    sleep EXPIRES_CHECK_EVERY
    Paste.all.each do |paste|
      Paste.delete if paste.expires < Time.now
    end
  end
end
