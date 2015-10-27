require "active_record/ssh_tunnel/version"
require "net/ssh/gateway"
require "rails/railtie"

module ActiveRecord
  module SshTunnel
    class Railtie < ::Rails::Railtie
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.singleton_class.prepend ::ActiveRecord::SshTunnel
      end
    end

    def establish_connection(spec = nil)
      spec     ||= ConnectionHandling::DEFAULT_ENV.call.to_sym
      resolver =   ConnectionAdapters::ConnectionSpecification::Resolver.new configurations
      spec     =   resolver.spec(spec)

      if spec.config[:ssh_tunnel_hostname]
        ssh_options = Hash[spec.config.keys.select { |key|
          key.to_s.start_with? "ssh_tunnel_"
        }.map{ |key|
          [key.to_s.gsub("ssh_tunnel_", "").to_sym, spec.config[key]]
        }]

        port = Net::SSH::Gateway.new(
          ssh_options.delete(:hostname),
          ssh_options.delete(:user),
          ssh_options,
        ).open(spec.config[:host], spec.config[:port])

        spec.config[:host] = "127.0.0.1"
        spec.config[:port] = port
      end

      remove_connection
      connection_handler.establish_connection self, spec
    end
  end
end
