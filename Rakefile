# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
    task setup: :environment do
      require 'resque'
    end
  
    task setup_schedule: :setup do
      require 'resque-scheduler'
    end
  
    task scheduler: :setup_schedule
  end

Rails.application.load_tasks
