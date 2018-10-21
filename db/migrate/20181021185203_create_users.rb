class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.jsonb :resume, null: false, default: {}

      t.timestamps
    end
  end
end
