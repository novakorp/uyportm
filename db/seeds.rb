# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
#
#
# Roles

Role.create(name: 'sysadmin', comments: 'Administrador del Sistema');
Role.create(name: 'config', comments: 'Configuracion')
Role.create(name: 'hr', comments:'Recursos Humanos');
Role.create(name: 'oper', comments:'Operativa');



