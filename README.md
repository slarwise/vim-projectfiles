# vim-projectfiles

Creates a dictionary mapping basenames to their full paths from a file with file
paths. This is useful if you are working with large codebases where
`path`-related commands such as `find` is too slow. I use this for `includeexpr`
and command-line completion.

## Usage

Create a file with containing the paths to all the files in your project. The
default location for this file is `.projectfiles`. To change this, set the
`g:projectfiles_filename` variable to what you want. It can be either a relative
or an absolute path.

## Commands

These commands edits the specified filename using `edit`, `split` and `vsplit`
respectively. Modifiers and bang works.

```vim
Projectfiles
Sprojectfiles
Vprojectfiles
```

## Examples

Setting includeexpr to return the first path found that matches `v:fname`

```vim
setlocal includeexpr=Projectfiles#GetFirstPath(v:fname)
```

Open a file in a vertical split using command-line completion

```vim
Vprojectfiles <part-of-filename> <TAB> <CR>
```
