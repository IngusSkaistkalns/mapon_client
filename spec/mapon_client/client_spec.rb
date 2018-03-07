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

  it "::DEFAULT_BASE_URL should be https://api.mapon.com/api/v1/" do
    expect(MaponClient::Client::DEFAULT_BASE_URL).to eq("https://mapon.com/api/v1/")
  end

  context '#request_format' do
    it 'should be json if format is json' do
      expect(MaponClient::Client.new(format: 'json').request_format).to eq(MaponClient::Client::JSON)
    end

    it 'should be xml if format is xml' do
      expect(MaponClient::Client.new(format: 'xml').request_format).to eq(MaponClient::Client::XML)
    end

    it 'should be json if format is structure' do
      expect(MaponClient::Client.new(format: 'structure').request_format).to eq(MaponClient::Client::JSON)
    end

    it 'should be json if format is object' do
      expect(MaponClient::Client.new(format: 'object').request_format).to eq(MaponClient::Client::JSON)
    end
  end
end
