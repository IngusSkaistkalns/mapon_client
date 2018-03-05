RSpec.describe MaponClient do
  it "has a version number" do
    expect(MaponClient::VERSION).not_to be nil
  end

  it "::DEFAULT_BASE_URL should be https://api.mapon.com/api/v1/" do
    expect(MaponClient::DEFAULT_BASE_URL).to eq("https://mapon.com/api/v1/")
  end
end
