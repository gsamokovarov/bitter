class AddTrendingAtToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :trending_at, :datetime
  end
end
