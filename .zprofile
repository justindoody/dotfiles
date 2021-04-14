# Enabled bundle open gem to open in Sublime Text
export BUNDLER_EDITOR="sublime -w"

# Enable homebrew zsh completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export PATH=".git/safe/../../bin:$PATH"

# Various shortcuts
alias ll="ls -lahG"
alias gp="git push"
alias ga="git add ."
alias gs="git status"
alias gf="git add . && git commit -m 'squash' && git rebase -i HEAD~2"
alias gl="git log --oneline --graph"
