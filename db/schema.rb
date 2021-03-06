# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_724_083_226) do
  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'comment'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'recipe_id', null: false
    t.integer 'user_id', null: false
    t.index ['recipe_id'], name: 'index_comments_on_recipe_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'name'
    t.integer 'recipe_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['recipe_id'], name: 'index_ingredients_on_recipe_id'
  end

  create_table 'instructions', force: :cascade do |t|
    t.text 'step'
    t.integer 'recipe_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['recipe_id'], name: 'index_instructions_on_recipe_id'
  end

  create_table 'punches', force: :cascade do |t|
    t.integer 'punchable_id', null: false
    t.string 'punchable_type', limit: 20, null: false
    t.datetime 'starts_at', null: false
    t.datetime 'ends_at', null: false
    t.datetime 'average_time', null: false
    t.integer 'hits', default: 1, null: false
    t.index ['average_time'], name: 'index_punches_on_average_time'
    t.index %w[punchable_type punchable_id], name: 'punchable_index'
  end

  create_table 'recipe_categories', force: :cascade do |t|
    t.integer 'recipe_id'
    t.integer 'category_id'
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'image_file_name'
    t.string 'image_content_type'
    t.integer 'image_file_size'
    t.datetime 'image_updated_at'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'admin', default: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'comments', 'recipes'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'ingredients', 'recipes'
  add_foreign_key 'instructions', 'recipes'
end
