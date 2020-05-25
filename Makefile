redb:
	bundle exec rake db:drop
	bundle exec rake db:create
	bundle exec rake db:migrate
	bundle exec rake db:seed

deploy:
	bundle exec cap production deploy

rspec:
	bundle exec rspec