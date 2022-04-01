# modified from: https://github.com/fastruby/rails-template

gem_group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'dotenv_validator'
  gem 'factory_bot_rails'
  # gem 'next_rails'
  gem 'overcommit' # run linters when trying to commit
  gem 'reek' # code smells linter
  gem 'standard' # code style linter
end

gem_group :test do
  gem 'capybara', '>= 2.15'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

# environment
initializer '1_dotenv_validator.rb', 'DotenvValidator.check!'

# pagination
gem 'pagy'

# DO THIS AFTER ALL GEMS ARE SET
# Replace 'string' with "string" in the Gemfile so RuboCop is happy
gsub_file 'Gemfile', /'([^']*)'/, '"\1"'

if yes? 'Do you wish to generate a root controller? (y/n)'
  name = ask('What do you want to call it?').to_s.underscore
  generate :controller, "#{name} show"
  route "root to: '#{name}\#show'"
  route "resource :#{name}, controller: :#{name}, only: [:show]"
end

# Add `rails spec` task to run our tests
inject_into_file 'Rakefile', before: "Rails.application.load_tasks\n" do
  <<~'RUBY'
    begin
      require "rspec/core/rake_task"
      RSpec::Core::RakeTask.new(:spec)
    rescue LoadError
    end

  RUBY
end

environment <<-EOL
  config.generators do |g|
    g.test_framework :rspec
  end
EOL

# include Pagy helpers and create initializer
inject_into_file 'app/controllers/application_controller.rb',
                 after: "class ApplicationController < ActionController::Base\n" do
  <<-'RUBY'
  include Pagy::Backend
  RUBY
end

inject_into_file 'app/helpers/application_helper.rb', after: "module ApplicationHelper\n" do
  <<-'RUBY'
  include Pagy::Frontend
  RUBY
end

initializer 'pagy.rb', <<~CODE
  # frozen_string_literal: true

  # Pagy initializer file (5.10.1)
  # Customize only what you really need and notice that the core Pagy works also without any of the following lines.
  # Should you just cherry pick part of this file, please maintain the require-order of the extras


  # Pagy DEFAULT Variables
  # See https://ddnexus.github.io/pagy/api/pagy#variables
  # All the Pagy::DEFAULT are set for all the Pagy instances but can be overridden per instance by just passing them to
  # Pagy.new|Pagy::Countless.new|Pagy::Calendar::*.new or any of the #pagy* controller methods


  # Instance variables
  # See https://ddnexus.github.io/pagy/api/pagy#instance-variables
  # Pagy::DEFAULT[:page]   = 1                                  # default
  # Pagy::DEFAULT[:items]  = 20                                 # default
  # Pagy::DEFAULT[:outset] = 0                                  # default


  # Other Variables
  # See https://ddnexus.github.io/pagy/api/pagy#other-variables
  # Pagy::DEFAULT[:size]       = [1,4,4,1]                       # default
  # Pagy::DEFAULT[:page_param] = :page                           # default
  # The :params can be also set as a lambda e.g ->(params){ params.exclude('useless').merge!('custom' => 'useful') }
  # Pagy::DEFAULT[:params]     = {}                              # default
  # Pagy::DEFAULT[:fragment]   = '#fragment'                     # example
  # Pagy::DEFAULT[:link_extra] = 'data-remote="true"'            # example
  # Pagy::DEFAULT[:i18n_key]   = 'pagy.item_name'                # default
  # Pagy::DEFAULT[:cycle]      = true                            # example


  # Extras
  # See https://ddnexus.github.io/pagy/extras


  # Backend Extras

  # Array extra: Paginate arrays efficiently, avoiding expensive array-wrapping and without overriding
  # See https://ddnexus.github.io/pagy/extras/array
  # require 'pagy/extras/array'

  # Calendar extra: Add pagination filtering by calendar time unit (year, quarter, month, week, day)
  # See https://ddnexus.github.io/pagy/extras/calendar
  # require 'pagy/extras/calendar'
  # Default for each unit
  # Pagy::Calendar::Year::DEFAULT[:order]     = :asc        # Time direction of pagination
  # Pagy::Calendar::Year::DEFAULT[:format]    = '%Y'        # strftime format
  #
  # Pagy::Calendar::Quarter::DEFAULT[:order]  = :asc        # Time direction of pagination
  # Pagy::Calendar::Quarter::DEFAULT[:format] = '%Y-Q%q'    # strftime format
  #
  # Pagy::Calendar::Month::DEFAULT[:order]    = :asc        # Time direction of pagination
  # Pagy::Calendar::Month::DEFAULT[:format]   = '%Y-%m'     # strftime format
  #
  # Pagy::Calendar::Week::DEFAULT[:order]     = :asc        # Time direction of pagination
  # Pagy::Calendar::Week::DEFAULT[:format]    = '%Y-%W'     # strftime format
  #
  # Pagy::Calendar::Day::DEFAULT[:order]      = :asc        # Time direction of pagination
  # Pagy::Calendar::Day::DEFAULT[:format]     = '%Y-%m-%d'  # strftime format
  #
  # Uncomment the following lines, if you need calendar localization without using the I18n extra
  # module LocalizePagyCalendar
  #   def localize(time, opts)
  #     ::I18n.l(time, **opts)
  #   end
  # end
  # Pagy::Calendar.prepend LocalizePagyCalendar

  # Countless extra: Paginate without any count, saving one query per rendering
  # See https://ddnexus.github.io/pagy/extras/countless
  require 'pagy/extras/countless'
  Pagy::DEFAULT[:countless_minimal] = false   # default (eager loading)

  # Elasticsearch Rails extra: Paginate `ElasticsearchRails::Results` objects
  # See https://ddnexus.github.io/pagy/extras/elasticsearch_rails
  # Default :pagy_search method: change only if you use also
  # the searchkick or meilisearch extra that defines the same
  # Pagy::DEFAULT[:elasticsearch_rails_pagy_search] = :pagy_search
  # Default original :search method called internally to do the actual search
  # Pagy::DEFAULT[:elasticsearch_rails_search] = :search
  # require 'pagy/extras/elasticsearch_rails'

  # Headers extra: http response headers (and other helpers) useful for API pagination
  # See http://ddnexus.github.io/pagy/extras/headers
  # require 'pagy/extras/headers'
  # Pagy::DEFAULT[:headers] = { page: 'Current-Page',
  #                            items: 'Page-Items',
  #                            count: 'Total-Count',
  #                            pages: 'Total-Pages' }     # default

  # Meilisearch extra: Paginate `Meilisearch` result objects
  # See https://ddnexus.github.io/pagy/extras/meilisearch
  # Default :pagy_search method: change only if you use also
  # the elasticsearch_rails or searchkick extra that define the same method
  # Pagy::DEFAULT[:meilisearch_pagy_search] = :pagy_search
  # Default original :search method called internally to do the actual search
  # Pagy::DEFAULT[:meilisearch_search] = :ms_search
  # require 'pagy/extras/meilisearch'

  # Metadata extra: Provides the pagination metadata to Javascript frameworks like Vue.js, react.js, etc.
  # See https://ddnexus.github.io/pagy/extras/metadata
  # you must require the shared internal extra (BEFORE the metadata extra) ONLY if you need also the :sequels
  # require 'pagy/extras/shared'
  # require 'pagy/extras/metadata'
  # For performance reasons, you should explicitly set ONLY the metadata you use in the frontend
  # Pagy::DEFAULT[:metadata] = %i[scaffold_url page prev next last]   # example

  # Searchkick extra: Paginate `Searchkick::Results` objects
  # See https://ddnexus.github.io/pagy/extras/searchkick
  # Default :pagy_search method: change only if you use also
  # the elasticsearch_rails or meilisearch extra that defines the same
  # DEFAULT[:searchkick_pagy_search] = :pagy_search
  # Default original :search method called internally to do the actual search
  # Pagy::DEFAULT[:searchkick_search] = :search
  # require 'pagy/extras/searchkick'
  # uncomment if you are going to use Searchkick.pagy_search
  # Searchkick.extend Pagy::Searchkick


  # Frontend Extras

  # Bootstrap extra: Add nav, nav_js and combo_nav_js helpers and templates for Bootstrap pagination
  # See https://ddnexus.github.io/pagy/extras/bootstrap
  # require 'pagy/extras/bootstrap'

  # Bulma extra: Add nav, nav_js and combo_nav_js helpers and templates for Bulma pagination
  # See https://ddnexus.github.io/pagy/extras/bulma
  require 'pagy/extras/bulma'

  # Foundation extra: Add nav, nav_js and combo_nav_js helpers and templates for Foundation pagination
  # See https://ddnexus.github.io/pagy/extras/foundation
  # require 'pagy/extras/foundation'

  # Materialize extra: Add nav, nav_js and combo_nav_js helpers for Materialize pagination
  # See https://ddnexus.github.io/pagy/extras/materialize
  # require 'pagy/extras/materialize'

  # Navs extra: Add nav_js and combo_nav_js javascript helpers
  # Notice: the other frontend extras add their own framework-styled versions,
  # so require this extra only if you need the unstyled version
  # See https://ddnexus.github.io/pagy/extras/navs
  # require 'pagy/extras/navs'

  # Semantic extra: Add nav, nav_js and combo_nav_js helpers for Semantic UI pagination
  # See https://ddnexus.github.io/pagy/extras/semantic
  # require 'pagy/extras/semantic'

  # UIkit extra: Add nav helper and templates for UIkit pagination
  # See https://ddnexus.github.io/pagy/extras/uikit
  # require 'pagy/extras/uikit'

  # Multi size var used by the *_nav_js helpers
  # See https://ddnexus.github.io/pagy/extras/navs#steps
  # Pagy::DEFAULT[:steps] = { 0 => [2,3,3,2], 540 => [3,5,5,3], 720 => [5,7,7,5] }   # example


  # Feature Extras

  # Gearbox extra: Automatically change the number of items per page depending on the page number
  # See https://ddnexus.github.io/pagy/extras/gearbox
  # require 'pagy/extras/gearbox'
  # set to false only if you want to make :gearbox_extra an opt-in variable
  # Pagy::DEFAULT[:gearbox_extra] = false               # default true
  # Pagy::DEFAULT[:gearbox_items] = [15, 30, 60, 100]   # default

  # Items extra: Allow the client to request a custom number of items per page with an optional selector UI
  # See https://ddnexus.github.io/pagy/extras/items
  # require 'pagy/extras/items'
  # set to false only if you want to make :items_extra an opt-in variable
  # Pagy::DEFAULT[:items_extra] = false    # default true
  # Pagy::DEFAULT[:items_param] = :items   # default
  # Pagy::DEFAULT[:max_items]   = 100      # default

  # Overflow extra: Allow for easy handling of overflowing pages
  # See https://ddnexus.github.io/pagy/extras/overflow
  # require 'pagy/extras/overflow'
  # Pagy::DEFAULT[:overflow] = :empty_page    # default  (other options: :last_page and :exception)

  # Support extra: Extra support for features like: incremental, infinite, auto-scroll pagination
  # See https://ddnexus.github.io/pagy/extras/support
  # require 'pagy/extras/support'

  # Trim extra: Remove the page=1 param from links
  # See https://ddnexus.github.io/pagy/extras/trim
  # require 'pagy/extras/trim'
  # set to false only if you want to make :trim_extra an opt-in variable
  # Pagy::DEFAULT[:trim_extra] = false # default true

  # Standalone extra: Use pagy in non Rack environment/gem
  # See https://ddnexus.github.io/pagy/extras/standalone
  # require 'pagy/extras/standalone'
  # Pagy::DEFAULT[:url] = 'http://www.example.com/subdir'  # optional default


  # Rails
  # Enable the .js file required by the helpers that use javascript
  # (pagy*_nav_js, pagy*_combo_nav_js, and pagy_items_selector_js)
  # See https://ddnexus.github.io/pagy/extras#javascript

  # With the asset pipeline
  # Sprockets need to look into the pagy javascripts dir, so add it to the assets paths
  Rails.application.config.assets.paths << Pagy.root.join('javascripts')

  # I18n

  # Pagy internal I18n: ~18x faster using ~10x less memory than the i18n gem
  # See https://ddnexus.github.io/pagy/api/frontend#i18n
  # Notice: No need to configure anything in this section if your app uses only "en"
  # or if you use the i18n extra below
  #
  # Examples:
  # load the "de" built-in locale:
  # Pagy::I18n.load(locale: 'de')
  #
  # load the "de" locale defined in the custom file at :filepath:
  # Pagy::I18n.load(locale: 'de', filepath: 'path/to/pagy-de.yml')
  #
  # load the "de", "en" and "es" built-in locales:
  # (the first passed :locale will be used also as the default_locale)
  # Pagy::I18n.load({ locale: 'de' },
  #                 { locale: 'en' },
  #                 { locale: 'es' })
  #
  # load the "en" built-in locale, a custom "es" locale,
  # and a totally custom locale complete with a custom :pluralize proc:
  # (the first passed :locale will be used also as the default_locale)
  # Pagy::I18n.load({ locale: 'en' },
  #                 { locale: 'es', filepath: 'path/to/pagy-es.yml' },
  #                 { locale: 'xyz',  # not built-in
  #                   filepath: 'path/to/pagy-xyz.yml',
  #                   pluralize: lambda{ |count| ... } )


  # I18n extra: uses the standard i18n gem which is ~18x slower using ~10x more memory
  # than the default pagy internal i18n (see above)
  # See https://ddnexus.github.io/pagy/extras/i18n
  # require 'pagy/extras/i18n'

  # Default i18n key
  # Pagy::DEFAULT[:i18n_key] = 'pagy.item_name'   # default


  # When you are done setting your own default freeze it, so it will not get changed accidentally
  Pagy::DEFAULT.freeze
CODE

# remove the .ruby-version file to use the version from the Gemfile
run 'mv .ruby-version .ruby-version.sample'

# create a sample database.yml instead of a real one
run 'mv config/database.yml config/database.yml.sample'

# make bin/setup copy the database file
gsub_file 'bin/setup', \
          '# puts "\n== Copying sample files =="
   # unless File.exist?("config/database.yml")
   #   FileUtils.cp "config/database.yml.sample", "config/database.yml"
   # end', \
          '# puts "\n== Copying sample files =="
   # unless File.exist?("config/database.yml")
   #   FileUtils.cp "config/database.yml.sample", "config/database.yml"
   # end'

# make bin/setup move sample files to new locations
inject_into_file 'bin/setup', before: 'puts "\n== Removing old logs and tempfiles =="' do
  <<-'RUBY'
  # Install overcommit hooks
  system("overcommit --install")

  # install StandardJS so it can be used by overcommit
  system("npm install standard --global")

  # set ruby/node versions
  File.open(".tool-versions", "w") do |f|
    f.write "nodejs 17.7.2\n"
    f.write "ruby 3.1.1\n"
  end

  # copy database.yml sample
  FileUtils.cp "config/database.yml.sample", "config/database.yml"

  # copy .env file
  unless File.exist?(".env")
    puts "\n== Copying .env file"
    FileUtils.cp ".env.sample", ".env"
  end

  RUBY
end

# add a blank .env.sample file
create_file '.env.sample'

dir_name = ask('What directory contains reek/overcommit/rubocop templates?')
if dir_name.present? && !['none', 'skip', 'n/a'].include?(dir_name)
  # add suggested reek config for Rails applications
  puts 'Copying reek.yml...'
  FileUtils.cp "#{dir_name}/reek.yml", '.reek.yml'

  # add config for Overcommit (set it to do a few checks and run standardrb and reek)
  puts 'Copying overcommit.yml...'
  FileUtils.cp "#{dir_name}/overcommit.yml", '.overcommit.yml'

  # add RuboCop config
  puts 'Copying rubocop.yml...'
  FileUtils.cp "#{dir_name}/rubocop.yml", '.rubocop.yml'
end

# adds the github action for rspec
# create_file ".github/workflows/rails_next.yml", get_gh_file_content("github_actions_rails_next.yml")

# ignore some files for git
append_file '.gitignore' do
  <<~'GIT'
    .env
    .nvmrc
    .node-version
    .ruby-version
    /config/database.yml
    coverage/
    spec/examples.txt
  GIT
end

after_bundle do
  generate 'rspec:install'
  # Add simplecov and rspec configuration
  inject_into_file 'spec/spec_helper.rb', before: "RSpec.configure do |config|\n" do
    <<~'RUBY'
      require "simplecov"
      SimpleCov.start

    RUBY
  end

  # Add simplecov and rspec configuration
  inject_into_file 'spec/rails_helper.rb', before: "require 'rspec/rails'\n" do
    <<~'RUBY'
      require "capybara/rails"
      Capybara.server = :puma, { Silent: true }

    RUBY
  end
  # Initialize Gemfile.next for dual boot
  # run 'next --init'
  # Add dual-boot in Gemfile
  # next_gem = '''
  # if next?
  # gem "rails", github: "rails/rails", branch: "main"
  # else
  # gem "rails", \1
  # end
  # '''
  # Update Gemfile
  # gsub_file("Gemfile", /^gem\s+["']rails["'].*$/, next_gem)
  # gsub_file('Gemfile', /^gem\s+["']rails["'],\s+(["'].*["']).*$/, next_gem)
  # run 'next bundle install'
  # adds x86_64-linux platform in the Gemfile.lock
  run 'bundle lock --add-platform x86_64-linux'
  run 'bundle exec rubocop -A .'
  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end
