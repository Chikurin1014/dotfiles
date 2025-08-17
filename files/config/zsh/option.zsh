setopt nonomatch  # コマンドがblobのワイルドカードを含んでいても、必要以上にファイル名として展開しない

# keybind
bindkey -d # default keybind

# history
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白を排除して記録
setopt hist_ignore_all_dups  # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt share_history         # 複数の端末でリアルタイムにヒストリを共有
setopt hist_verify           # ヒストリを呼び出してから実行する間に一旦編集可能

# completion
setopt list_types  # 補完候補の表示をls -F
