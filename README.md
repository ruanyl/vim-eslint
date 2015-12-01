vim-eslint
===========

This plugin is a simple wrap of [eslint_d.js](https://github.com/mantoni/eslint_d.js)
eslint_d run an eslint server on the background, it reduces the linting time.

How to install
-----------------------
###vim-plug

~~Plug 'ruanyl/vim-eslint', {'do': 'npm install'}~~

Add this if you are using `vim-plug`
```vim
Plug 'ruanyl/vim-eslint', {'do': 'cd eslint_d.js && npm install'}
```

or you will need to manually:
```
cd path/to/vim-eslint/eslint_d.js
npm install
```

~~or `cd path/to/vim-eslint` then run `npm install`~~

Then restart vim and run `:PlugInstall`.
To update the plugin to the latest version, you can run `:PlugUpdate`.

How to use
----------

Basically no configuration needed, this plugin will set `g:syntastic_javascript_eslint_exec` for you,
please do not overwrite this variable

Make sure you have:
```
let g:syntastic_javascript_checkers = ['eslint']
```

this plugin improve the linting speed significantly for me. Thanks to [eslint_d.js](https://github.com/mantoni/eslint_d.js)
