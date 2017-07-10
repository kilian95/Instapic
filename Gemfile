source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml', '~> 4.0', '>= 4.0.7'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'simple_form', '~> 3.4'
gem 'coffee-script-source', '1.8.0'
gem 'devise', '~> 4.2'
gem 'paperclip', '~> 5.1'
gem 'cocaine', '~> 0.5.8'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick', '~> 4.6'
gem 'masonry-rails', '~> 0.2.4'
gem 'acts_as_votable', '~> 0.10.0'
gem 'actionmailer', '~> 5.0', '>= 5.0.1'
gem 'faker', '~> 1.7', '>= 1.7.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
