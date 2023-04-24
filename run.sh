# This script runs the project and uses watchman to reload Chrome when a file changes.
# It also uses a VScode extension to compile the sass files to css.

echo "\nThis script only works on MacOS. Run the project manually if you are using Linux or Windows.";

if ! which caddy > /dev/null; then
  echo "This script requires caddy to be installed.";
  echo "MacOS : 'brew install caddy'.";
  exit 1;
fi

if ! which watchman > /dev/null; then
  echo "This script requires watchman to be installed.";
  echo "MacOS : 'brew install watchman'.";
  exit 1;
fi

if ! echo `open -a "Google Chrome" http://localhost:80` > /dev/null; then
  open http://localhost:80;
else
  watchman watch .;
  watchman -- trigger . reload-chrome '*' -- ./reloadChrome.sh;
  echo "Watch list: \n";
  watchman watch-list;
fi

caddy file-server --browse --listen :80;
watchman trigger-del . reload-chrome > /dev/null;
