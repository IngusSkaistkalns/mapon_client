RSpec.describe MaponClient::Client do

  let(:mapon_client) {
    MaponClient::Client.new(
      api_key: 'fake_key_123',
      base_url: 'https://mapon.com/api/v1',
      format: 'json'
    )
  }

  it "#[] should delegate calls to #resource_base" do
    block_to_pass = Proc.new { }
    expect(mapon_client.resource_base).to receive(:[]).with('company/get.json', &block_to_pass)
    mapon_client.public_send(:[], 'company/get', &block_to_pass)
  end
end
