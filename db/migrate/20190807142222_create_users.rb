class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :users, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string  :name,    null: false
      t.decimal :balance, null: false, default: '0.0'

      t.timestamps
    end
  end
end
