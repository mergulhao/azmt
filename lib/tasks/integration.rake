ENV['SCM'] = 'git'

ENV['SKIP_TASKS'] = %w(
                         test:units
                         test:functionals
                         test:integration
                         spec:lib
                         spec:models
                         spec:helpers
                         spec:controllers
                         spec:views
                         test:rcov:units
                         test:rcov:units:verify
                         test:rcov:functionals
                         test:rcov:functionals:verify
                         test:plugins:selected
                         spec:plugins:selected
                         test:selenium:server:start
                         test_acceptance
                         test:selenium:server:stop
).join(',')