Our vim configuration is based on vim-gt3 that seems to be the best version for WSL.
In fact it does allow to copy/paste (allowing +clipboard). which is important to me as a script kiddie.

## How to get help

You can reference to the manual in a lot of different ways : 

```
:help
```

help rediect to the huge page where everything is written about vim. You can retrict by going to specific parts 

```
:h quickref
```

```
:h usr_<press Ctr-d to get the list of possibilities>
```

## Remaps

### Opening Project Fileview (NetRW)

We have 2 ways to open the buffer:

1. Open the file view to replace the file in current buffer:

```
<space>pv 
```

2. Vertically spli and open to search in a new buffer

```
<space>pvv
```

### Navigate in buffer

This goes to the previous buffer

```
<controll>6 
```

### Reload Vim in current buffer

```
<space><enter>
```

### Open FuzzyFinder 

```
<controll>p
```

### Quickfix Navigation

Go to the next item in quickfix list

```
<controll>j
```

Go to the previous item in quickfix list

```
<controll>k
```
