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
    Resque.schedule = YAML.load_file(Rails.root.join('/config/resque_schedule.yml'))
  end

  task scheduler: :setup_schedule
end

# Scheduler needs very little cpu, just start it with a worker.
desc 'schedule and work, so we only need 1 dyno'
task schedule_and_work: :environment do
  if Process.fork
    sh 'rake environment resque:work'
  else
    sh 'rake resque:scheduler'
    Process.wait
  end
end

Rails.application.load_tasks
