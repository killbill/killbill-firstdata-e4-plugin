require 'active_record'

ActiveRecord::Schema.define(:version => 20140410153635) do
  create_table "firstdata_e4_payment_methods", :force => true do |t|
    t.string   "kb_payment_method_id"      # NULL before Kill Bill knows about it
    t.string   "token"                     # firstdata_e4 id
    t.string   "cc_first_name"
    t.string   "cc_last_name"
    t.string   "cc_type"
    t.string   "cc_exp_month"
    t.string   "cc_exp_year"
    t.string   "cc_number"
    t.string   "cc_last_4"
    t.string   "cc_start_month"
    t.string   "cc_start_year"
    t.string   "cc_issue_number"
    t.string   "cc_verification_value"
    t.string   "cc_track_data"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.boolean  "is_deleted",               :null => false, :default => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "kb_account_id"
    t.string   "kb_tenant_id"
  end

  add_index(:firstdata_e4_payment_methods, :kb_account_id)
  add_index(:firstdata_e4_payment_methods, :kb_payment_method_id)

  create_table "firstdata_e4_transactions", :force => true do |t|
    t.integer  "firstdata_e4_response_id",  :null => false
    t.string   "api_call",                       :null => false
    t.string   "kb_payment_id",                  :null => false
    t.string   "kb_payment_transaction_id",      :null => false
    t.string   "transaction_type",               :null => false
    t.string   "payment_processor_account_id"
    t.string   "txn_id"                          # firstdata_e4 transaction id
    # Both null for void
    t.integer  "amount_in_cents"
    t.string   "currency"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "kb_account_id",                  :null => false
    t.string   "kb_tenant_id",                   :null => false
  end

  add_index(:firstdata_e4_transactions, :kb_payment_id)

  create_table "firstdata_e4_responses", :force => true do |t|
    t.string   "api_call",          :null => false
    t.string   "kb_payment_id"
    t.string   "kb_payment_transaction_id"
    t.string   "transaction_type"
    t.string   "payment_processor_account_id"
    t.string   "message"
    t.string   "authorization"
    t.boolean  "fraud_review"
    t.boolean  "test"
    t.string   "params_amount_requested"
    t.string   "params_authorization_num"
    t.string   "params_avs"
    t.string   "params_bank_message"
    t.string   "params_bank_resp_code"
    t.string   "params_bank_resp_code_2"
    t.string   "params_card_cost"
    t.string   "params_card_holders_name"
    t.string   "params_card_type"
    t.string   "params_cavv"
    t.string   "params_cavv_algorithm"
    t.string   "params_cavv_response"
    t.string   "params_client_email"
    t.string   "params_client_ip"
    t.text     "params_ctr"
    t.string   "params_currency"
    t.string   "params_current_balance"
    t.string   "params_customer_ref"
    t.string   "params_cvd_presence_ind"
    t.string   "params_cvv2"
    t.string   "params_dollar_amount"
    t.string   "params_ean"
    t.string   "params_ecommerce_flag"
    t.string   "params_error_description"
    t.string   "params_exact_id"
    t.string   "params_error_number"
    t.string   "params_exact_message"
    t.string   "params_exact_resp_code"
    t.string   "params_language"
    t.string   "params_merchant_address"
    t.string   "params_merchant_city"
    t.string   "params_merchant_country"
    t.string   "params_merchant_name"
    t.string   "params_merchant_postal"
    t.string   "params_merchant_province"
    t.string   "params_merchant_url"
    t.string   "params_pan"
    t.string   "params_partial_redemption"
    t.string   "params_password"
    t.string   "params_previous_balance"
    t.string   "params_reference_3"
    t.string   "params_reference_no"
    t.string   "params_retrieval_ref_no"
    t.string   "params_secure_auth_required"
    t.string   "params_secure_auth_result"
    t.string   "params_sequence_no"
    t.string   "params_surcharge_amount"
    t.string   "params_tax1_amount"
    t.string   "params_tax1_number"
    t.string   "params_tax2_amount"
    t.string   "params_tax2_number"
    t.string   "params_track1"
    t.string   "params_track2"
    t.string   "params_transaction_approved"
    t.string   "params_transaction_error"
    t.string   "params_transaction_tag"
    t.string   "params_transaction_type"
    t.string   "params_transarmor_token"
    t.string   "params_verification_str1"
    t.string   "params_virtual_card"
    t.string   "params_xid"
    t.string   "params_zip_code"
    t.string   "avs_result_code"
    t.string   "avs_result_message"
    t.string   "avs_result_street_match"
    t.string   "avs_result_postal_match"
    t.string   "cvv_result_code"
    t.string   "cvv_result_message"
    t.boolean  "success"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "kb_account_id"
    t.string   "kb_tenant_id"
  end
end
