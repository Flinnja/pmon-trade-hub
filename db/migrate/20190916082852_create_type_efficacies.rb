class CreateTypeEfficacies < ActiveRecord::Migration[6.0]
  def change
    create_table :type_efficacies do |t|
      t.integer :attacker_id
      t.integer :defender_id

      t.timestamps
    end
  end
end
