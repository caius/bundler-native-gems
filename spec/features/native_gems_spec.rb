require "spec_helper"

RSpec.describe "bundler native-gems command", type: :aruba, exit_timeout: 1, startup_wait_time: 1 do
  before do
    unset_bundler_env_vars
  end

  describe "with no native extensions" do
    before do
      write_file("Gemfile", <<~GEMFILE)
        source "https://rubygems.org/"

        gem "bundler-native-gems", path: "../.."
        gem "net-pop"
      GEMFILE
    end

    it "does not output gems without native extensions" do
      run_command("bundle install")
      expect(last_command_started).to be_successfully_executed

      # run_command("bundle native-gems")
      run_command("bundle exec bundler-native-gems")
      expect(last_command_started).to be_successfully_executed
      expect(last_command_started.output).not_to include("net-pop")
    end
  end

  describe "with native extensions" do
    before do
      write_file("Gemfile", <<~GEMFILE)
        source "https://rubygems.org/"

        gem "bundler-native-gems", path: "../.."
        gem "nokogiri"
      GEMFILE
    end

    it "outputs native gems with their versions" do
      run_command("bundle install")
      expect(last_command_started).to be_successfully_executed

      # binding.irb

      # run_command("bundle native-gems")
      run_command("bundle exec bundler-native-gems")
      expect(last_command_started).to be_successfully_executed
      expect(last_command_started.output).to include("nokogiri")
    end
  end
end
