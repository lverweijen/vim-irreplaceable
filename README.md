# Irrepleaceable #

Let's say you want to replace a variable name.
You can use the built-in `:substitute` command, but this vim plug-in achieves this task faster and more intuitively.
I got the idea for this plug-in after reading [https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db](this blog post) by Christoph Hermank.

## Example usage ##

Let's say you want to replace "value" by "saldo" in the snippet below:

```python3
if value:
    print("value = {}".format(value))
else:
    print("value is zero")
```

- Put the cursor on "value"
- Press `c.iw` to change it
- Type "saldo" in its place

Now you can do the following:
- Press `n` to go to next occurrence "value"
- Press `N` to go to previous "value"
- Press `.` to replace the next occurrence of "value" by "saldo"
- Press `.` repeatedly to replace every occurrence of "value" by "saldo"

The end result should look like this:

```python3
if saldo:
    print("saldo = {}".format(saldo))
else:
    print("saldo is zero")
```

## Installation ##

Use some plugin manager, e.g.

    Plug 'https://github.com/lverweijen/vim-irrepleaceable.git'

## Configuration ##

Rebind the following to whatever you wish:
- `<Plug>(easy-refactor-y)`
- `<Plug>(easy-refactor-d)`
- `<Plug>(easy-refactor-c)`

By default these are bound to `y.`, `d.` and `c.`
