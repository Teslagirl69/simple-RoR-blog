class MakeNotNullableColumns < ActiveRecord::Migration[7.0]
  def change
    change_column(:logs, :request_method, :string, null: false)
    change_column(:logs, :request_url, :string, null: false)
  end
end
