web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
resque: QUEUE=* bundle exec rake schedule_and_work
