setopt no_global_rcs
typeset -U path PATH
path=(
  $HOME/local/bin(N-/)
  /usr/local/heroku/bin(N-/)
  $HOME/homebrew/bin(N-/)
  $HOME/.go/bin(N-/)
  $HOME/.anyenv/bin(N-/)
  /usr/local/bin(N-/)
  /usr/bin(N-/)
  /bin(N-/)
  /usr/sbin(N-/)
  /sbin(N-/)
)

# anyenv
if type anyenv >/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

