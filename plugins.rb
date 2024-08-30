require "bundler-native-gems"

class NativeGems < Bundler::Plugin::API
  command "native-gems"

  def exec(command, args)

  rescue Exception => e
    raise BundlerError, e
  end
end
