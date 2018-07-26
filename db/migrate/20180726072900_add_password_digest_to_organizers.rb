class AddPasswordDigestToOrganizers < ActiveRecord::Migration[5.2]
  def change
    add_column :organizers, :password_digest, :string
  end
end
