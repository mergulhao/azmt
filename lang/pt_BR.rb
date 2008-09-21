Localization.define('pt_BR') do |l|
  l.store 'Add', 'Adicionar'
  l.store 'Address', 'Endereço'
  l.store 'Bank Number', 'Banco'
  l.store 'Bank Branch', 'Agência'
  l.store 'Bank Account', 'Conta'
  l.store 'Bank Check', 'Cheque'
  l.store 'Capacity', 'Capacidade'
  l.store 'Classe', 'Turma'
  l.store 'Classes', 'Turmas'
  l.store 'Classroom', 'Sala de aula'
  l.store 'Classrooms', 'Salas de aula'
  l.store 'Color', 'Cor'
  l.store 'Comercial Phone', 'Telefone Comercial'
  l.store 'Complement', 'Complemento'
  l.store 'Contract', 'Contrato'
  l.store 'Course', 'Formação'
  l.store 'Courses', 'Formações'
  l.store 'CPF', 'CPF'
  l.store 'Create', 'Criar'
  l.store 'Date', 'Data'
  l.store 'Delete', 'Deletar'
  l.store 'Discipline', 'Disciplina'
  l.store 'Disciplines', 'Disciplinas'
  l.store 'Due Date', 'Vencimento'
  l.store 'External?', 'Externa?'
  l.store 'false', 'Não'
  l.store 'First Semester', 'Primeiro Semestre' 
  l.store 'From', 'De'
  l.store 'Home Phone', 'Telefone Residencial'
  l.store 'Installment', 'Parcela'
  l.store 'Installments', 'Parcelas'
  l.store 'Lesson', 'Aula'
  l.store 'Lessons', 'Aulas'
  l.store 'Lessons Number', 'Número de Aulas'
  l.store 'Mobile Phone', 'Telefone Celular'
  l.store 'Name', 'Nome'
  l.store 'Neighbourhood', 'Bairro'
  l.store 'Number', 'Número'
  l.store 'Personal info', 'Informações pessoais'
  l.store 'Phones', 'Telefones'
  l.store 'Street', 'Rua'
  l.store 'Student', 'Aluno'
  l.store 'Students', 'Alunos'
  l.store 'Successfully created!', 'Inserido com sucesso!'
  l.store 'Successfully removed!', 'Removido com sucesso!'
  l.store 'Successfully updated!', 'Atualizado com sucesso!'
  l.store 'Teacher', 'Instrutor'
  l.store 'Teachers', 'Instrutores'
  l.store 'There is no installments.', 'Não existem parcelas cadastradas.'
  l.store 'To', 'Até'
  l.store 'true', 'Sim'
  l.store 'Update', 'Atualizar'
  l.store 'Value', 'Valor'
  l.store 'You will delete it permanently. Are you sure?', 'O registro será apagado permamentemente. Deseja continuar?'
  l.store 'Zip', 'CEP'

  #---- week days
  l.store 'Sun', 'Dom'
  l.store 'Mon', 'Seg'
  l.store 'Tue', 'Ter'
  l.store 'Wed', 'Qua'
  l.store 'Thu', 'Qui'
  l.store 'Fri', 'Sex'
  l.store 'Sat', 'Sáb'
  
  #---- custom messages
  l.store 'Edit %s', 'Editar %s'
  l.store 'Editing %s', 'Editando %s'
  l.store 'New %s', 'Criar %s'
  l.store 'Add %s', 'Adicionar %s'
  
  #---- localization
  l.store '(date)', lambda { |t| t.strftime('%d/%m/%Y') rescue '' }
  l.store '(time)', lambda { |t| t.strftime('%H:%M') rescue '' }
end