require 'spec_helper'

describe Killbill::FirstdataE4::PaymentPlugin do

  include ::Killbill::Plugin::ActiveMerchant::RSpec

  before(:each) do
    Dir.mktmpdir do |dir|
      file = File.new(File.join(dir, 'firstdata_e4.yml'), 'w+')
      file.write(<<-eos)
:firstdata_e4:
  :test: true
# As defined by spec_helper.rb
:database:
  :adapter: 'sqlite3'
  :database: 'test.db'
      eos
      file.close

      @plugin = build_plugin(::Killbill::FirstdataE4::PaymentPlugin, 'firstdata_e4', File.dirname(file))

      # Start the plugin here - since the config file will be deleted
      @plugin.start_plugin
    end
  end

  it 'should start and stop correctly' do
    @plugin.stop_plugin
  end

  it 'should generate forms correctly' do
    kb_account_id = SecureRandom.uuid
    kb_tenant_id  = SecureRandom.uuid
    context       = @plugin.kb_apis.create_context(kb_tenant_id)
    fields        = @plugin.hash_to_properties({
                                                   :order_id => '1234',
                                                   :account_id => '5678',
                                                   :amount   => 10
                                               })
    form          = @plugin.build_form_descriptor kb_account_id, fields, [], context

    form.kb_account_id.should == kb_account_id
    form.form_method.should == 'POST'
    form.form_url.should == 'https://checkout.globalgatewaye4.firstdata.com/payment'

    form_fields = @plugin.properties_to_hash(form.form_fields)
  end

  # TODO: non-standard acknowledge API
  xit 'should receive notifications correctly' do
    description    = 'description'

    kb_tenant_id = SecureRandom.uuid
    context      = @plugin.kb_apis.create_context(kb_tenant_id)
    properties   = @plugin.hash_to_properties({ :description => description })

    notification    = ""
    gw_notification = @plugin.process_notification notification, properties, context
  end
end
