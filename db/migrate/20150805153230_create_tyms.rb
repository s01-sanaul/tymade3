class CreateTyms < ActiveRecord::Migration
  def change
    create_table :tyms do |t|
      t.string :end
      t.string :hw
      t.string :free
      t.string :sleep
      t.string :start

      t.timestamps
    end
  end
end
