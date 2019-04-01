# Load DSL and set up stages
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'

require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'

install_plugin Capistrano::Puma
install_plugin Capistrano::SCM::Git


# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
