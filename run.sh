echo "This script only works on MacOS. Run the project manually if you are using Linux or Windows.";

if ! which caddy > /dev/null; then
  echo "This script requires caddy to be installed.";
  echo "MacOS : 'brew install caddy'.";
  exit 1;
fi

if ! echo `open -a "Google Chrome" http://localhost:80` > /dev/null; then
  open http://localhost:80;
fi
caddy file-server --browse --listen :80;