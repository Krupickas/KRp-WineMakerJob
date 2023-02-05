fx_version 'adamant'

Author 'Krupickas'

game 'gta5'

version '1.1.0'

lua54 'yes'
shared_script {
  '@ox_lib/init.lua',
  '@es_extended/imports.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/sv.lua',
  'locales/cs.lua',
  'config.lua',
  'client/cl_rentcar.lua',
  'client/cl_crush_grapes.lua',
  'client/cl_pickup_grapes.lua',
  'client/cl_wineprocess.lua',
  'client/cl_buybottles.lua',
  'client/cl_blips.lua',
  'client/cl_sellbottles.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/sv.lua',
  'locales/cs.lua',
  'config.lua',
  'server/sv_crush_grapes.lua',
  'server/sv_pickup_grapes.lua',
  'server/sv_wineprocess.lua',
  'server/sv_buybottles.lua',
  'server/sv_sellbottles.lua'
}
