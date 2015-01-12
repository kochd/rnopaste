# Paste.where(hashid: nil).all.each do |paste|
#   hashid = nil
#   while hash.nil? || Paste.first(hashid: hashid)
#     hashid = SecureRandom.urlsafe_base64(HASH_LENGTH)
#   end
#   paste.update(hashid: hashid)
# end
