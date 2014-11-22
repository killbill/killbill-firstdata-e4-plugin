module Killbill #:nodoc:
  module FirstdataE4 #:nodoc:
    class PrivatePaymentPlugin < ::Killbill::Plugin::ActiveMerchant::PrivatePaymentPlugin
      def initialize(session = {})
        super(:firstdata_e4,
              ::Killbill::FirstdataE4::FirstdataE4PaymentMethod,
              ::Killbill::FirstdataE4::FirstdataE4Transaction,
              ::Killbill::FirstdataE4::FirstdataE4Response,
              session)
      end
    end
  end
end
