class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.uuid :user_id, null: false
      t.decimal :price, default: '0.0', null: false

      t.timestamps

      t.index :user_id
    end
  end
end
