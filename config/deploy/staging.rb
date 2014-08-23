set :branch, :master
set :deploy_to, '/home/keeper/staging'

server 'keeper.cinek.co',
  user: 'keeper',
  roles: %w{web app db},
  ssh_options: { forward_agent: true }
