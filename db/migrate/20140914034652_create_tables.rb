class CreateTables < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
    	t.belongs_to :user
    	t.string :title
    end

    create_table :chapters do |t|
	    t.text :episode
	    t.string :prompt
	    t.references :parent
    end

    create_table :adventures_chapters do |t|
	    t.integer :chapter_id
	    t.integer :adventure_id
    end
  end
end
