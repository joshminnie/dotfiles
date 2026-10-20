export OPENCODE_BINARY="$(brew --prefix opencode)/bin/opencode"

# OpenCode: raise max file descriptor limit
ulimit -n 2147483646
