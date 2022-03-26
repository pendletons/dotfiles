gem_group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
end

gem_group :test do
  gem 'rspec'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

run 'bundle install'

if yes? 'Do you wish to generate a root controller? (y/n)'
  name = ask('What do you want to call it?').to_s.underscore
  generate :controller, "#{name} show"
  route "root to: '#{name}\#show'"
  route "resource :#{name}, controller: :#{name}, only: [:show]"
end

generate 'rspec:install'

environment <<-EOL
  config.generators do |g|
    g.test_framework :rspec
  end"
EOL

file '.rubocop.yml', <<~EOL
  require:
    - rubocop-performance
    - rubocop-rspec
    - rubocop-rails
    - rubocop-rake
    - rubocop-graphql

  AllCops:
    Exclude:
      - 'bin/**/*'
      - 'node_modules/**/*'
      - 'tmp/**/*'
      - 'vendor/**/*'
      - '.git/**/*'
    DisplayCopNames: true
    NewCops: disable
    TargetRubyVersion: 3.1

  Layout/LineLength:
    Max: 120

  Style/Documentation:
    Enabled: false

  Style/StringLiterals:
    Enabled: true
    EnforcedStyle: double_quotes
EOL

after_bundle do
  run 'bundle exec rubocop -A .'
  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end
