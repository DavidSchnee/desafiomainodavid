class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email , null:false, default:''
      t.string :foto , null:false, default:''
      t.string :nome , null:false, default:''
      t.string :password_digest , null:false, default:''
      t.integer :idade
      t.string :sexo

      t.timestamps
    end
  end
end
