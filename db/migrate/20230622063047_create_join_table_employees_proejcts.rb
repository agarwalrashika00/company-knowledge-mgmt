class CreateJoinTableEmployeesProejcts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :employees, :projects do |t|
      t.bigint :id, primary_key: true
      t.boolean :active, default: 0
      t.index [:employee_id, :project_id]
      t.index [:project_id, :employee_id]
    end
  end
end
