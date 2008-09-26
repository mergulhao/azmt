# Receita de deploy de apps Rails para o Dreamhost. Capistrano V2.
# Pode ser facilmente adaptada para outros hosts compartilhados.
# Por Sylvestre Mergulhao em 20/08/2007
# Email: contato (at) mergulhao.info
# Site: http://mergulhao.info

def next_release
  return @next_release if @next_release
  list = `git branch -a | grep origin\/RB-`
  list_numbers = []
  list.each do |item|
    item =~ /RB-([0-9].*)/
    list_numbers << $1.to_i
  end
  @next_release = list_numbers.sort.last.to_i + 1
end

# Define o nome da aplicacao e o dominio a qual estara linkada no dreamhost
set :application, "azmt.en21.org" 

# Define seu usuario no dreamhost
set :user, "railsapp" 

set :repository, "git@github.com:mergulhao/azmt.git"
set :scm, "git"
set :deploy_via, :remote_cache
set :branch, "RB-#{next_release}"

set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}" 
set :domain, "#{user}@#{application}" 

role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :lsws_cmd, "/opt/lsws/bin/lswsctrl"

namespace :deploy do
  task :before_update_code, :roles => :app do
    system "git checkout master"
    system "git tag REL-#{next_release}"
    system "git push origin origin:refs/heads/RB-#{next_release}"
    system "git push --tags"
  end
  
  desc "Restarts all FCGI processes." 
  task :restart, :roles => :app do
    sudo "#{lsws_cmd} restart"
  end
end

