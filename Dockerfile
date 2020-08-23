# コードを実行するコンテナイメージ
FROM ubuntu:latest

# アクションのリポジトリからコードファイルをファイルシステムパスへコピー`/` of the container
COPY getPublicRepository.sh /getPublicRepository.sh

# dockerコンテナが起動する際に実行されるコードファイル (`getPublicRepository.sh`)
ENTRYPOINT ["/getPublicRepository.sh"]
