class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.integer :pod_id
      t.string :title
      t.text :dataset
      t.integer :deleted

      t.timestamps
    end
  end
end
