# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.integer  :identification
      t.date     :birthday
      t.string   :phone_number
      t.boolean  :active
      t.decimal  :status
      t.datetime :created_at
      t.datetime :updated_at
      t.decimal  :user_type,          null: false, default: 99

      ## Database authenticatable
      t.string   :login
      t.string   :email,              null: false, default: ""
      t.string   :password_digest,    null: false, default: ""

      ## Trackable
      t.integer  :sign_in_count,      null: false, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # Lockable
      t.integer  :failed_attempts,    null: false, default: 0 # Only if lock strategy is :failed_attempts
      t.boolean  :locked # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.timestamps null: false
    end

    add_index :users, :login,                unique: true
    add_index :users, :email,                unique: true
    add_index :users, :identification,       unique: true
  end
end
