source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "active_model_serializers", "~> 0.10.0"  # 追加
gem "bootsnap", ">= 1.4.2", require: false
gem "devise_token_auth" # 追加
gem "pg"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "factory_bot_rails" # 追加
  gem "faker" # 追加
  gem "pry-byebug" # 追加
  gem "pry-doc" # 追加
  gem "pry-rails" # 追加
  gem "rspec-rails" # 追加
  gem "rubocop-rails" # 追加
  gem "rubocop-rspec" # 追加
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", "~> 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "annotate" # 追加
  gem "rails-erd" # 追加
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
