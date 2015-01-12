Sequel.migration do
  Sequel.connect(DATABASE)
  class Paste < Sequel::Model; end
  Paste.set_dataset :pastes
  up do
    from(:pastes).where(hashid: nil).all.each do |paste|
      newhashid = nil
      while from(:pastes).first(hashid: newhashid) || newhashid.nil?
        newhashid = SecureRandom.urlsafe_base64(HASH_LENGTH)
      end
      from(:pastes).where(id: paste[:id]).update(hashid: newhashid)
    end
    alter_table :pastes do
      set_column_not_null :hashid
    end
  end
end
