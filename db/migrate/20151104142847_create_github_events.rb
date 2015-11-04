class CreateGithubEvents < ActiveRecord::Migration
  def change
    create_table :github_events do |t|
      t.string :event_name
      t.string :delivery_uuid
      t.text   :result
      t.timestamps null: false
    end
  end
end
