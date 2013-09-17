class CreateCategoryPostships < ActiveRecord::Migration
  def change
    create_table :category_postships do |t|
      t.integer :post_id
      t.integer :category_id
    end
  end
end
