#!/bin/bash

criar_estrutura_projeto() {
    local nome_projeto="$1"
    local linguagens=()

    
    echo "Selecione as linguagens para incluir no projeto (separadas por espaço):"
    echo "1. Java"
    echo "2. Python"
    echo "3. JavaScript"
    read -r -p "Escolha: " -a selecione_linguagens
    
   
    for escolha in "${selecione_linguagens[@]}"; do
        case $escolha in
            1) linguagens+=("java") ;;
            2) linguagens+=("python") ;;
            3) linguagens+=("javascript") ;;
            *) echo "Escolha inválida. Saindo..."; exit 1 ;;
        esac
    done

    
    mkdir "$nome_projeto"
    cd "$nome_projeto" || exit
ada
    for linguagem in "${linguagens[@]}"; do
        mkdir "$linguagem"
        touch "$linguagem/$nome_projeto.$linguagem"
    done

    
    git init > /dev/null 2>&1

    
    touch README.md
    echo "# $nome_projeto" >> README.md
    echo "Este é um projeto simples para demonstração de estrutura básica de repositório." >> README.md

  
    touch .gitignore
    echo "# Arquivos/diretórios a serem ignorados pelo Git" >> .gitignore
    echo "*.log" >> .gitignore
    echo "node_modules/" >> .gitignore

    echo "Estrutura do projeto '$nome_projeto' criada com sucesso!"
}

to
if [ $# -eq 0 ]; then
    echo "Por favor, especifique o nome do projeto."
    exit 1
fi


criar_estrutura_projeto "$1"
