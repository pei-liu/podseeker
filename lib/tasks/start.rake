namespace :start do
  desc 'Start deveopment server (frontend and backend)'
  task :dev do
    exec 'heroku local -f Procfile.dev'
  end

  desc 'Start Rails API server'
  task :server do
    exec 'PORT=3001 bundle exec rails s'
  end

  desc 'Start React App'
  task :client do
    exec 'PORT=3000 yarn --cwd frontend start'
  end
end
