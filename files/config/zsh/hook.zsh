autoload -Uz add-zsh-hook

# コマンド実行後、ヒストリに残すかを判定
remove_last_history_if_not_needed () {
    local last_status="$?"
    local history_file=~/.zsh_history
    # 直前のコマンドが失敗した場合、ヒストリから最後のエントリを削除
    if [[ "${last_status}" -ne 0 ]]; then
        # ヒストリをファイルに書き出し
        fc -W
        # 最後のエントリを削除
        ed -s "${history_file}" > /dev/null << EOF
d
wq
EOF
        # ヒストリをファイルから再読み込み
        fc -R
    fi
}
add-zsh-hook precmd remove_last_history_if_not_needed

