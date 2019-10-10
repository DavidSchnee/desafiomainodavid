# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_10_114256) do

  create_table "equipes", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "pokemon_id"
    t.index ["pokemon_id"], name: "index_equipes_on_pokemon_id"
    t.index ["user_id"], name: "index_equipes_on_user_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "nome", default: "", null: false
    t.string "tipo", default: "", null: false
    t.string "sprite", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "equipe_id"
    t.index ["equipe_id"], name: "index_pokemons_on_equipe_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "foto", default: "", null: false
    t.string "nome", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.integer "idade"
    t.string "sexo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
