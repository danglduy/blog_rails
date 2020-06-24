# frozen_string_literal: true

class AddPostTitleToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string
  end
end
