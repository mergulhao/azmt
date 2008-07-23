Localization.define('pt_BR') do |l|
  l.store 'Add', 'Adicionar'
  l.store 'Classrooms', 'Salas de Aula'
  l.store 'Name', 'Nome'
  l.store 'Capacity', 'Capacidade'
  
  l.store 'You will delete it permanently. Are you sure?', 'O registro será apagado permamentemente. Deseja continuar?'

  l.store '(time)', lambda { |t| t.strftime('%H:%M') }
end