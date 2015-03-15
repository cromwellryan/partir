class CreateDeploys < ActiveRecord::Migration
  def change
    create_table :deploys do |t|
      t.datetime :occurred_at
      t.belongs_to :project, index: true
      t.string :sha
      t.string :environment

      t.timestamps null: false
    end
    add_foreign_key :deploys, :projects
  end
end
