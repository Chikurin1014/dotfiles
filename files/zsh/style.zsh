autoload -Uz colors
colors

dir="%~"
host="%m"
user="%n"
date="%W"
T="%*"
line_head="%# "
colored_host_at_user="%F{64}[%f%F{83}${user}%f%F{64}@%f%F{83}${host}%f%F{64}]%f"
colored_dir="%F{202}${dir}%f"
colored_line_head="%F{172}${line_head}%f"
colored_ymdt="%F{202}${T} - ${date}%f"

PROMPT="${colored_host_at_user} ${colored_dir}"$'\n'"${colored_line_head}"
RPROMPT="${colored_ymdt}"
