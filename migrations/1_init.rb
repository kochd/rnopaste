Sequel.migration do
  up do
    create_table :pastes do
      primary_key :id
      String :description, null: true, text: true
      String :language, null: false
      String :body, null: false, text: true
      String :creator, default: 'Anonymous'
      DateTime :created, null: false
      DateTime :expires, null: false
    end
  end
end
