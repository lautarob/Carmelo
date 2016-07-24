source 'https://rubygems.org'
ruby '2.3.1'

gem 'bundler', '>= 1.8.4'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap', '3.3.6'
end

gem 'rails', '>= 5.0.0.rc1', '< 5.1' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'jquery-rails', '~> 4.1', '>= 4.1.1'
gem 'pg', '~> 0.18' # Use postgresql as the database for Active Record
gem 'puma', '~> 3.0' # Use Puma as the app server
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0' # Use CoffeeScript for .coffee assets and views

gem 'turbolinks', '~> 5.x' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'kaminari' # Paginator for Rails 3 and 4
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem


gem 'devise' # Use Devise for user authentication
gem 'omniauth' # Use Omniauth for user authentication
gem 'omniauth-facebook' # Use Omniauth Facebook for user authentication
gem "koala", "~> 2.2" # Use Koala to get user information
gem 'active_link_to' # Helper to manage "active" state of a link

group :development, :test do
  gem 'capistrano-rails' # Use Capistrano for deployment
  gem 'byebug', platform: :mri # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :development do
  gem 'web-console' # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
end
