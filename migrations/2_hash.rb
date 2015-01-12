Sequel.migration do
  up do
    alter_table :pastes do
      add_column :hashid, String, unique: true
    end
  end
end
