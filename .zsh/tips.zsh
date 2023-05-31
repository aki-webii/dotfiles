## カレントの１つ下の全てのdirectoryでコマンドを実行する
# find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && pwd" \;
## Usage example: カレント配下のdirectoryでgitのremote URLとってghq getする
# find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && git config --get remote.origin.url" \; | xargs ghq get
