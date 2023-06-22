class CreateJoinTableProjectsTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_join_table :technologies, :projects do |t|
      t.index [:technology_id, :project_id]
      t.index [:project_id, :technology_id]
    end
  end
end
