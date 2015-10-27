# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/ssh_tunnel/version'
Gem::Specification.new do |spec|
  spec.name          = "active_record-ssh_tunnel"
  spec.version       = ActiveRecord::SshTunnel::VERSION
  spec.authors       = ["Yoshiori SHOJI"]
  spec.email         = ["yoshiori@gmail.com"]

  spec.summary       = %q{Connect ActiveRecord with SSH Tunnel.}
  spec.description   = %q{Connect ActiveRecord with SSH Tunnel.}
  spec.homepage      = "https://github.com/yoshiori/activerecord-ssh_tunnel"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "net-ssh-gateway", "~> 1.2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "rspec"
end
