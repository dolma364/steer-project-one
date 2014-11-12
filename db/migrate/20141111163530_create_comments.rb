class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :story_id

      t.timestamps
    end

    def create
    	@comment = Comment.new
    end

  end
end