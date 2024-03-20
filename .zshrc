# z
. /opt/homebrew/etc/profile.d/z.sh
alias build:api="just api-gen-api"
alias build:api-d="just api-gen-api"
alias build:web="yarn nx spec @clh/web-backend && yarn nx spec @clh/web-backend"
alias build:web-d="just yarn nx spec @clh/web-backend && just api-gen-web"
alias build="build:api"
alias pgadmin="just up -d pgadmin && echo 'http://localhost:8042'"
alias admin="yarn nx run @clh/admin:start"
alias api="yarn nx run @clh/api-backend:start"
alias api-d="just up api"
alias a="api"
alias ad="api-d"
alias backend="yarn nx run @clh/web-backend:start"
alias backend-d="just up webapp-backend"
alias b="backend"
alias bd="backend-d"
alias frontend="yarn nx run @clh/web-frontend:start"
alias frontend-d="just up webapp-frontend"
alias f="frontend"
alias fd="frontend-d"
alias migrate:create="yarn workspace @clh/data-model migrate:create"
alias migrate:apply="yarn workspace @clh/data-model migrate:apply"
alias e2e="yarn nx test:e2e @clh/api-backend"
alias e2ed="just yarn nx test:e2e @clh/api-backend"
alias unit="yarn nx test @clh/api-backend --verbose"
alias ngrok="/Users/trevorlitsey/code/ngrok"
alias grok='ngrok http https://localhost:3000 --host-header="localhost:3000"'
alias db:reset="yarn workspace @clh/data-model reset"
alias docker:prune="docker system prune --volumes"
alias cfn:deploy="./devops/bin/deploy-cfn.sh applications localdev && ./devops/bin/deploy-cfn.sh api localdev && ./devops/bin/deploy-cfn.sh web-backend localdev"
alias login="aws sso login --profile clh-dev"
alias l="login"
alias chat="node /Users/trevorlitsey/code/ai-course/chat"
alias gpt="chat"

# https://platform.openai.com/docs/api-reference/models/list
function hey_gpt() {
    gpt=$(curl https://api.openai.com/v1/chat/completions -s \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -d '{
                "model": "gpt-3.5-turbo",
                "messages": [{"role": "user", "content": "'$1'"}],
                "temperature": 0.7
            }')
    echo $gpt | jq -r '.choices[0].message.content';
} 

alias h=hey_gpt