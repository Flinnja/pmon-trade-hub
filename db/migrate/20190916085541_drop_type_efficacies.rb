class DropTypeEfficacies < ActiveRecord::Migration[6.0]
  def change
  	drop_table :type_efficacies
  end
end
