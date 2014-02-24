class AddPicToProjects < ActiveRecord::Migration
  def self.up
    add_attachment :projects, :pic
  end

  def self.down
    remove_attachment :projects, :pic
  end
end
