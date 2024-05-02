if [[ -f temp ]]; then
  rm temp;
fi

nim c -r -o:temp --verbosity:0 $1