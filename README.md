# vim-projectfiles

Creates a dictionary mapping basenames to their full paths from a user-specified
file. This is useful if you are working with large codebases where
`path`-related commands such as `find` are too slow. I use it for `includeexpr`
and command-line completion.

## Usage

Create a file containing the paths to all the files in your project. The default
location for this file is `.projectfiles`. To change this, set the
`g:projectfiles_filename` variable to the path you want. It can be either a
relative or an absolute path. This is how the `.projectfiles` would look for
this vim plugin

```txt
README.md
autoload/Projectfiles.vim
plugin/projectfiles.vim
test.vader
```

## Commands

These commands edits the specified filename using `edit`, `split` and `vsplit`
respectively. Modifiers and bang works.

- Projectfiles
- Sprojectfiles
- Vprojectfiles

The database is used for filename completion.

## Examples

Setting includeexpr to return the first path found that matches `v:fname`:

```vim
setlocal includeexpr=Projectfiles#GetFirstPath(v:fname)
```

Open a file in a vertical split using command-line completion. Given the
`.projectfiles` example above, this command would list both
`autoload/Projectfiles.vim` and `plugin/projectfiles.vim`.

```vim
Vprojectfiles vim<TAB> <CR>
```
