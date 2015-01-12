Sequel.migration do
  class Paste < Sequel::Model; end
  up do
    Paste.all.each do |paste|
      newhashid = nil
      while self[:pastes].first(hashid: newhashid) || newhashid.nil?
        newhashid = SecureRandom.urlsafe_base64(HASH_LENGTH)
      end
      paste.update(hashid: newhashid)
    end
    alter_table :pastes do
      set_column_not_null :hashid
    end
  end
end
