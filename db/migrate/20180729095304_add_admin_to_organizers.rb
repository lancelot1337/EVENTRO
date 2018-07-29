class AddAdminToOrganizers < ActiveRecord::Migration[5.2]
  def change
    add_column :organizers, :admin, :boolean, default: false
  end
end
