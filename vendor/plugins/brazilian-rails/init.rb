#PROJECTS = %w(brdinheiro brcep brdata brhelper brtraducao brnumeros brstring)
PROJECTS = %w(brnumeros brdinheiro brdata)

PROJECTS.each do |project|
  require "#{File.dirname(__FILE__)}/#{project}/rails/init"
end
