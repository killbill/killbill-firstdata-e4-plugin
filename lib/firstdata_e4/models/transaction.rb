module Killbill #:nodoc:
  module FirstdataE4 #:nodoc:
    class FirstdataE4Transaction < ::Killbill::Plugin::ActiveMerchant::ActiveRecord::Transaction

      self.table_name = 'firstdata_e4_transactions'

      belongs_to :firstdata_e4_response

    end
  end
end
