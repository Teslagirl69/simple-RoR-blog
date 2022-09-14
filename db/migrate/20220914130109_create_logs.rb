class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :remote_ip
      t.string :request_method
      t.string :request_url
      t.integer :response_status
      t.string :response_content_type
      t.timestamps
    end
  end
end
