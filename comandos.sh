#!/bin/bash

# ============================================================

# AWS re/Start - Laboratório 239

# Gerenciar Processos

#

# Este arquivo documenta os principais comandos utilizados

# durante o laboratório.

#

# A conexão com a instância foi realizada no Windows usando:

# PuTTY + labsuser.ppk + usuário ec2-user

#

# Este arquivo serve como documentação dos comandos.

# Alguns comandos são interativos e não devem ser executados

# todos de uma vez.

# ============================================================

# ============================================================

# 1. VERIFICAR O DIRETÓRIO ATUAL

# ============================================================

# Exibe o diretório em que o usuário está atualmente.

pwd

# Caso não esteja no diretório do laboratório:

cd companyA

# ============================================================

# 2. CRIAR O ARQUIVO COM A LISTA DE PROCESSOS

# ============================================================

# Lista todos os processos em execução.

# grep -v root remove da saída as linhas que contêm "root".

# tee grava o resultado no arquivo processes.csv.

sudo ps -aux | grep -v root | sudo tee SharedFolders/processes.csv

# Exibe o conteúdo do arquivo criado.

cat SharedFolders/processes.csv

# ============================================================

# 3. MONITORAR PROCESSOS COM TOP

# ============================================================

# Exibe processos e informações de desempenho do sistema

# em tempo real.

top

# Para sair do comando top:

# pressione q

# Exibe informações de uso e versão do comando top.

top -hv

# ============================================================

# 4. CRIAR UMA TAREFA COM CRON

# ============================================================

# Abre o crontab do usuário root para edição.

#

# O comando abre um editor de texto.

# No laboratório, foi utilizado o Vim.

sudo crontab -e

# Dentro do editor, foram adicionadas as seguintes linhas:

#

# SHELL=/bin/bash

# PATH=/usr/bin:/bin:/usr/local/bin

# MAILTO=root

# 0 * * * * ls -la $(find .) | sed -e 's/..csv/#####.csv/g' > /home/ec2-user/companyA/SharedFolders/filteredAudit.csv

# No Vim:

#

# Pressione "i" para entrar no modo de inserção.

#

# Depois de inserir o conteúdo:

# Pressione ESC

# Digite :wq

# Pressione ENTER

#

# :wq salva e fecha o arquivo.

# ============================================================

# 5. VERIFICAR O CRON CONFIGURADO

# ============================================================

# Exibe as tarefas configuradas no crontab.

sudo crontab -l

# ============================================================

# REFERÊNCIA DE CONEXÃO SSH

# ============================================================

# No laboratório, a conexão real foi feita pelo Windows

# utilizando PuTTY e a chave labsuser.ppk.

#

# Exemplo de configuração no PuTTY:

#

# Host Name: <PublicIP>

# Port: 22

# Connection type: SSH

#

# Chave:

# Connection > SSH > Auth > Credentials > labsuser.ppk

#

# Usuário:

# ec2-user

# ============================================================

# OBSERVAÇÃO SOBRE PEM

# ============================================================

# O laboratório também apresenta instruções para usuários

# macOS/Linux utilizando uma chave .pem.

#

# Esse procedimento NÃO foi utilizado na conexão deste laboratório.

#

# Exemplo apenas como referência:

#

# chmod 400 labsuser.pem

# ssh -i labsuser.pem ec2-user@<public-ip>

#

# Nunca coloque arquivos .pem ou .ppk no GitHub.
