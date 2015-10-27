require 'spec_helper'

describe ActiveRecord::SshTunnel do
  it 'has a version number' do
    expect(ActiveRecord::SshTunnel::VERSION).not_to be nil
  end
end
