# Irrepleaceable #

# Other names #
vim-reflector
vim-relaxtor
vim-substitute
vim-irreplaceable (I like this one)

vim-decidot
vim-pittypoint
vim-changedot

# Names already taken
EasyGrep
vim-easyreplace


Let's say you quickly want to replace a variable name.
You can use the built-in :substitute command, but this plugin achieves this task quicker and more intuitively.
I got the idea for this plugin after reading [https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db](this blog post) by Christoph Hermank.
It can also do everything the various vim-visualstar plugins can do.

## Example usage ##

Let's say you want to replace "value" by "saldo"
```
if value:
    print("value = {}".format(value))
else:
    print("value is zero")

```

- Put the cursor on "value"
- Press `c.iw` to delete it
- Type "saldo" in its place

Now you can do the following:
- Press `n` to go to next "value"
- Press `N` to go to previous "value"
- Press `.` to replace the next occurrence of "value" by "saldo"
- Hold `.` down for a while to replace every occurence of "value" by "saldo"

## Installation ##

Use some plugin manager, e.g.

    Plug 'https://github.com/lverweijen/vim-easy-refactor.git'

## Configuration ##

Rebind the following to whatever you wish:
- `<Plug>(easy-refactor-y)`
- `<Plug>(easy-refactor-d)`
- `<Plug>(easy-refactor-c)`

By default these are bound to `y.`, `d.` and `c.`
