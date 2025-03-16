# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Locale
export LC_ALL=en_US.UTF-8

# Zsh & Theme
ZSH_THEME="bureau"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git zsh-autosuggestions)

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Java (Uncomment if needed)
# export JAVA_HOME=$(/usr/libexec/java_home -v 21)

# Automatically start tmux if not already in a session
if [ -z "$TMUX" ]; then
  tmux
fi

###CatFiles
alias mitel="cat ~/catfiles/mi_tel"

### Tmux ###
alias tmk="tmux kill-server"
alias tls="tmux ls"
alias tmc="nvim ~/.conf/tmux/tmux.conf"

### Zsh ###
alias zrl="omz reload"
alias zrc="nvim ~/.zshrc"

### Neovim ###
alias nv="nvim ."
alias nvrc="nvim ~/.config/nvim"

### Git ###
alias lzy="lazygit"
alias c="git commit -m"
alias rbc="git rebase --continue"
alias b="git checkout"
alias bb="git checkout -"
alias bdev="git checkout develop"
alias sq="git rebase -i --root"
alias sd="git fetch origin develop:develop && git rebase -i develop"
alias devrb="git fetch origin develop:develop && git rebase develop && git status"
alias obi="git push --force"

# GitHub Search Function
ORG="xxx"
ghf() {
  local baseUrl="https://github.com/search?q=org%3A$ORG+"
  local query="$1"
  local encoded_query=$(echo "$query" | jq -sRr @uri) # More efficient encoding
  local url="${baseUrl}${encoded_query}&type=code"
  open -a "Google Chrome" "$url"
}

### Navigation ###
alias ls="ls -1 --color"
alias :qa!="exit"
alias sysconf="cd ~/.config"
alias h="cd ~/Hangar"
alias s="cd ~/Stash"
alias sb="cd ~/Sandbox"
alias notes="nvim ~/Documents/Powerhouse/Notes.md"

### Docker ###
alias dkd="docker-compose down"
alias dku="docker-compose up"
alias dkps="docker ps"
alias dklogs="docker logs"

CONTAINER="ContainerName"
alias awxa="docker exec $CONTAINER awslocal"
alias awxs="docker exec $CONTAINER awslocal"
alias dxa="docker exec $CONTAINER"
alias dxs="docker exec $CONTAINER"

### Jira Ticket Lookup ###
t_num() {
  branch_name=$(git branch --show-current)  
  prefix_removed="${branch_name#*/}"
  prefix="${prefix_removed%%-*}"
  number=$(echo "$prefix_removed" | grep -oE '[0-9]+')
  ticket_number="${prefix}-${number// /}"
  echo "$ticket_number"
}

jira() {
  n=$(t_num)
  echo "🔷 Jumping to Ticket: ${n} 🔷"
  jira_url="https://xxx.atlassian.net/browse/${n}"
  open -a "Google Chrome" "$jira_url"
}

### Brew Services ###
alias brewls="brew services list"
alias mongostart="brew services start mongodb-community@6.0"
alias mongostop="brew services stop mongodb-community@6.0"
alias pgstart="brew services start postgresql"
alias pgstop="brew services stop postgresql"

### JavaScript ###
alias mdb="npx json-server db.json"
alias jcc="npx jest --coverage"
alias rsb="npm run storybook"
alias rdev="npm run dev"
alias nfw="npm run format:write"

### Java ###
jtest() {
  mvn test
  open ./target/index.html
}

jrun() {
  echo "Building the project..."
  mvn clean install
  if [ $? -ne 0 ]; then
    echo "Build failed. Exiting."
    return 1
  fi
  echo "Running the project..."
  mvn spring-boot:run
}

### Python ###
alias pyenv="source ~/myenv/bin/activate"
alias p3="python3"

