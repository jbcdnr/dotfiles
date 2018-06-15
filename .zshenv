for file in ~/.{paths,exports,aliases,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$HOME/$file";
done;
unset file;
