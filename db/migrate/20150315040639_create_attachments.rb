class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :deploy, index: true
      t.json :data

      t.timestamps null: false
    end
    add_foreign_key :attachments, :deploys
  end
end
