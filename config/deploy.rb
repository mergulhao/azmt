# Receita de deploy de apps Rails para o Dreamhost. Capistrano V2.
# Pode ser facilmente adaptada para outros hosts compartilhados.
# Por Sylvestre Mergulhao em 20/08/2007
# Email: contato (at) mergulhao.info
# Site: http://mergulhao.info

def next_release
  return @next_release if @next_release
  list = `svn list #{svn_base_remote_address}/branches | grep RB-`
  list_numbers = []
  list.each do |item|
    item =~ /RB-([0-9].*)\//
    list_numbers << $1.to_i
  end
  @next_release = list_numbers.sort.last.to_i + 1
end

set :svn_base_remote_address, "svn+vpsssh://en21.org/svn/azmt"
set :svn_base_local_address,  "file:///svn/azmt"

# Define o nome da aplicacao e o dominio a qual estara linkada no dreamhost
set :application, "azmt.en21.org" 

# Define seu usuario no dreamhost
set :user, "railsapp" 
set :port, 20021 

# Define o local do seu repositorio svn
set :local_repository, "#{svn_base_remote_address}/tags/REL-#{next_release}"
set :repository,       "#{svn_base_local_address}/tags/REL-#{next_release}"

set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}" 
set :domain, "#{user}@#{application}" 

role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :lsws_cmd, "/opt/lsws/bin/lswsctrl"

namespace :deploy do
  task :before_update_code, :roles => :app do
    system "svn copy -m \"Creating release branch\" #{svn_base_remote_address}/trunk #{svn_base_remote_address}/branches/RB-#{next_release}"
    system "svn copy -m \"Creating tag release\" #{svn_base_remote_address}/branches/RB-#{next_release} #{svn_base_remote_address}/tags/REL-#{next_release}"
  end
  
  desc "Restarts all FCGI processes." 
  task :restart, :roles => :app do
    sudo "#{lsws_cmd} restart"
  end
end

