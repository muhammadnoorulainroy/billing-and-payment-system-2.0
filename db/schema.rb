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

ActiveRecord::Schema.define(version: 2022_07_22_013845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "feature_plans", force: :cascade do |t|
    t.bigint "plan_id"
    t.bigint "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_feature_plans_on_feature_id"
    t.index ["plan_id"], name: "index_feature_plans_on_plan_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.integer "max_unit_limit", null: false
    t.decimal "unit_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_features_on_code", unique: true
    t.index ["name"], name: "index_features_on_name", unique: true
  end

  create_table "plans", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "monthly_fee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_plans_on_name", unique: true
  end

  create_table "stripe_plans", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "interval"
    t.integer "price_cents", null: false
    t.string "stripe_price_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_stripe_plans_on_name", unique: true
    t.index ["stripe_price_id"], name: "index_stripe_plans_on_stripe_price_id", unique: true
  end

  create_table "stripe_subscriptions", force: :cascade do |t|
    t.bigint "stripe_plan_id"
    t.bigint "user_id"
    t.boolean "active", default: true
    t.string "stripe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stripe_id"], name: "index_stripe_subscriptions_on_stripe_id", unique: true
    t.index ["stripe_plan_id"], name: "index_stripe_subscriptions_on_stripe_plan_id"
    t.index ["user_id"], name: "index_stripe_subscriptions_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "plan_id"
    t.date "billing_day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_subscriptions_on_buyer_id"
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "plan_name", null: false
    t.decimal "amount", null: false
    t.string "buyer_name", null: false
    t.string "buyer_email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_email"], name: "index_transactions_on_buyer_email"
  end

  create_table "usages", force: :cascade do |t|
    t.bigint "subscription_id"
    t.bigint "feature_id"
    t.integer "usage", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_usages_on_feature_id"
    t.index ["subscription_id"], name: "index_usages_on_subscription_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "type"
    t.string "stripe_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["stripe_id"], name: "index_users_on_stripe_id", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "feature_plans", "features"
  add_foreign_key "feature_plans", "plans"
  add_foreign_key "stripe_subscriptions", "stripe_plans"
  add_foreign_key "stripe_subscriptions", "users"
  add_foreign_key "subscriptions", "plans"
  add_foreign_key "subscriptions", "users", column: "buyer_id"
  add_foreign_key "usages", "features"
  add_foreign_key "usages", "subscriptions"
end
