
if [ $# != 2 ]; then
  echo "Usage: gdown.sh ID save_name"
  exit 0
fi

cookies=$(mktemp)
confirm=$(wget --quiet --save-cookies $cookies --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id='$1 -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
echo $confirm
wget --load-cookies $cookies "https://docs.google.com/uc?export=download&confirm=$confirm&id=$1" -O $2 && rm -rf $cookies