class CreateSlideDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :slide_decks do |t|
      t.string :name

      t.timestamps
    end
  end
end
