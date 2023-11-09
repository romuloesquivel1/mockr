# frozen_string_literal: true

class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.belongs_to :request, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.text :description
      t.json :conditions, default: {}, null: false
      t.integer :status, null: false, default: 200
      t.json :headers, default: {}, null: false
      t.string :format, null: false, default: "json"
      t.string :path, null: false
      t.timestamps
      t.datetime :deleted_at, index: true
    end

    add_index :responses, %i[request_id name], unique: true
  end
end
