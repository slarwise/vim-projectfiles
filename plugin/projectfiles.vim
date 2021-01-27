if exists('g:loaded_projectfiles')
    finish
endif
let g:loaded_projectfiles = 1

let g:projectfiles_filename = get(g:, 'projectfiles_filename', '.projectfiles')

command! -complete=customlist,Projectfiles#CompleteList -nargs=1 -bang 
            \ Projectfiles <mods> edit<bang> <args>
command! -complete=customlist,Projectfiles#CompleteList -nargs=1 -bang 
            \ Sprojectfiles <mods> split<bang> <args>
command! -complete=customlist,Projectfiles#CompleteList -nargs=1 -bang 
            \ Vprojectfiles <mods> vsplit<bang> <args>
