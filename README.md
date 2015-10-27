# Activerecord::SshTunnel

Connect ActiveRecord with SSH Tunnel

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-ssh_tunnel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-ssh_tunnel

## Usage

Add `ssh_tunnel_hostname` and `ssh_tunnel_user` to Your database.yml.

```yml
development:
  adapter: DB_ADAPTER
  username: DB_USERNAME
  password: DB_PASSWORD
  host: DB_HOST
  port: DB_PORT
  database: DB_NAME
  ssh_tunnel_hostname: SSH_GATEWAY_HOST
  ssh_tunnel_user: SSH_USER #  <%= ENV['USER'] %>
```

or

```ruby
class Item < ActiveRecord::Base
  establish_connection(
    adapter: DB_ADAPTER,
    host: DB_HOST,
    username: DB_USERNAME,
    password: DB_PASSWORD,
    database: DB_NAME,
    port: DB_PORT,
    ssh_tunnel_hostname: SSH_GATEWAY_HOST,
    ssh_tunnel_user: SSH_USER,
    ssh_tunnel_password: SSH_PASSWORD,
  )
end
```

### Other ssh options...

Use the options of [Net::SSH](https://github.com/net-ssh/net-ssh) with `ssh_tunnel` prefix.

e.g. password

```yml
ssh_tunnel_password: SSH_PASSWORD
```

e.g keys

```yml
ssh_tunnel_keys:
  - "~/.ssh/ssh-key"
```

```ruby
ssh_tunnel_keys: ["~/.ssh/ssh-key"],
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yoshiori/activerecord-ssh_tunnel.
