class AddVerificationTokenToDataEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :data_entries, :verification_token, :string
  end
end
