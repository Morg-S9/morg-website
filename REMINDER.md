Reminder to Morg (by Morg)

Update the branch name on your main PC

```Shell
git branch -m main master
git fetch origin
git branch -u origin/master master
git remote set-head origin -a
```

and Update the repo
```Shell
git fetch --prune
```