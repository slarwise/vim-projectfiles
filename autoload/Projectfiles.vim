let s:last_modified_time = -1
let s:database = {}

function! Projectfiles#RefreshDatabase() abort
    let mod_time = getftime(g:projectfiles_filename)
    if mod_time == -1 || mod_time == s:last_modified_time
        return
    endif
    let s:last_modified_time = mod_time
    let s:database = {}
    let paths = readfile(g:projectfiles_filename)
    for path in paths
        let basename = fnamemodify(path, ':t')
        let s:database[basename] = get(s:database, basename, []) + [path]
    endfor
endfunction

function! Projectfiles#GetDatabase() abort
    call Projectfiles#RefreshDatabase()
    return s:database
endfunction

function! Projectfiles#GetPaths(basename) abort
    call Projectfiles#RefreshDatabase()
    return get(s:database, a:basename, [])
endfunction

function! Projectfiles#GetFirstPath(basename) abort
    call Projectfiles#RefreshDatabase()
    let paths = get(s:database, a:basename, [])
    return empty(paths) ? '' : paths[0]
endfunction

function! Projectfiles#GetPathsMatchingPattern(pattern) abort
    call Projectfiles#RefreshDatabase()
    let filtered_database = filter(deepcopy(s:database), 'v:key =~# a:pattern')
    if exists('*flatten')
        return flatten(values(filtered_database))
    else
        let paths = []
        for path in values(filtered_database)
            call extend(paths, p)
        endfor
        return paths
    endif
endfunction

function! Projectfiles#CompleteList(arglead, cmdline, cursorpos) abort
    return Projectfiles#GetPathsMatchingPattern(a:arglead)
endfunction
