require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "nginx server" do

  it "is listening on port 80" do
    expect(port(80)).to be_listening
  end

  it "is listening on port 443" do
    expect(port(443)).to be_listening
  end

  it "has a running service" do
    expect(service("nginx")).to be_running
  end

end