# AWS re/Start — Laboratório 239: Gerenciar Processos

Este laboratório apresenta conceitos de gerenciamento de processos no Linux, utilizando comandos para listar processos, acompanhar o desempenho do sistema e automatizar tarefas de auditoria com `cron`.

## Objetivos

* Criar um arquivo de log contendo informações dos processos em execução.
* Utilizar o comando `ps` para listar processos.
* Utilizar o comando `top` para acompanhar processos e o desempenho do sistema.
* Consultar informações de uso e versão do comando `top`.
* Criar uma tarefa automatizada utilizando `cron`.
* Verificar e validar uma tarefa configurada no `crontab`.

## Ambiente

* **AWS re/Start**
* **AWS Vocareum**
* **Amazon EC2**
* **Amazon Linux**
* **SSH**
* **Windows**
* **PuTTY**
* **Chave:** `labsuser.ppk`
* **Usuário:** `ec2-user`

## 1. Conexão com a instância EC2

Neste laboratório, a conexão com a instância foi realizada utilizando o PuTTY no Windows.

Configuração utilizada:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

A chave `labsuser.ppk` foi configurada em:

```text
Connection > SSH > Auth > Credentials
```

Após estabelecer a conexão, o acesso foi realizado com o usuário:

```text
ec2-user
```

> A chave privada utilizada no laboratório não deve ser enviada para o GitHub.

---

## 2. Criar o arquivo de processos

Primeiro, foi verificado o diretório atual:

```bash
pwd
```

O laboratório utiliza o diretório:

```text
/home/ec2-user/companyA
```

Caso necessário:

```bash
cd companyA
```

Para listar os processos em execução e remover da saída os processos que contêm `root`, foi utilizado:

```bash
sudo ps -aux | grep -v root | sudo tee SharedFolders/processes.csv
```

O resultado é gravado no arquivo:

```text
SharedFolders/processes.csv
```

Para verificar o conteúdo:

```bash
cat SharedFolders/processes.csv
```

### Comandos utilizados

| Comando        | Função                                      |
| -------------- | ------------------------------------------- |
| `ps -aux`      | Lista os processos em execução              |
| `grep -v root` | Remove da saída as linhas que contêm `root` |
| `tee`          | Exibe e grava a saída em um arquivo         |
| `cat`          | Exibe o conteúdo de um arquivo              |

---

## 3. Monitorar processos com `top`

O comando `top` foi utilizado para acompanhar os processos e o desempenho do sistema em tempo real:

```bash
top
```

O comando apresenta informações como:

* Número total de tarefas;
* Tarefas em execução;
* Tarefas em estado de espera;
* Tarefas interrompidas;
* Processos em estado zombie;
* Utilização da CPU;
* Utilização da memória;
* Utilização de swap.

Durante a execução do `top`, a quantidade de processos em execução pode variar conforme o estado atual da instância.

Para sair do `top`:

```text
q
```

Também foi utilizado:

```bash
top -hv
```

Esse comando permite consultar informações relacionadas ao uso e à versão do `top`.

---

## 4. Criar uma tarefa com Cron

O `cron` permite executar comandos automaticamente em horários ou intervalos definidos.

Neste laboratório, foi criada uma tarefa utilizando o `crontab` para gerar um arquivo de auditoria a partir dos arquivos `.csv`.

Para editar o `crontab`:

```bash
sudo crontab -e
```

No editor, foram adicionadas as seguintes configurações:

```text
SHELL=/bin/bash
PATH=/usr/bin:/bin:/usr/local/bin
MAILTO=root
0 * * * * ls -la $(find .) | sed -e 's/..csv/#####.csv/g' > /home/ec2-user/companyA/SharedFolders/filteredAudit.csv
```

### Configuração do Cron

A expressão:

```text
0 * * * *
```

define a execução no minuto `0` de cada hora.

A estrutura básica de um agendamento do `cron` é:

```text
MINUTO HORA DIA_DO_MÊS MÊS DIA_DA_SEMANA COMANDO
```

### Comando executado

```bash
ls -la $(find .) | sed -e 's/..csv/#####.csv/g' > /home/ec2-user/companyA/SharedFolders/filteredAudit.csv
```

Esse comando gera o arquivo:

```text
/home/ec2-user/companyA/SharedFolders/filteredAudit.csv
```

Para verificar a configuração do cron:

```bash
sudo crontab -l
```

O comando exibe as tarefas configuradas no `crontab`.

---

## 5. Conceitos praticados

### `ps`

Utilizado para consultar os processos atualmente em execução no sistema.

### `grep`

Utilizado para filtrar informações da saída de outros comandos.

### `tee`

Permite gravar uma saída em um arquivo enquanto também a encaminha para a saída padrão.

### `top`

Permite acompanhar processos e informações de desempenho do sistema em tempo real.

### `cron`

Permite automatizar a execução de comandos em horários ou intervalos definidos.

### `crontab`

Arquivo utilizado para definir as tarefas que serão executadas pelo `cron`.

---

## 6. Aprendizados

Neste laboratório, foram praticados:

* Listagem de processos no Linux;
* Filtragem de informações utilizando `grep`;
* Gravação de resultados em arquivos;
* Monitoramento de processos com `top`;
* Consulta de informações do sistema;
* Automação de tarefas com `cron`;
* Configuração e validação de tarefas no `crontab`.

## 7. Arquivos do repositório

```text
aws-restart-laboratorio-239-gerenciar-processos/
├── README.md
├── comandos.sh
└── .gitignore
```

### `README.md`

Documentação do laboratório, incluindo os procedimentos realizados e os principais conceitos aprendidos.

### `comandos.sh`

Lista dos comandos utilizados durante o laboratório, acompanhados de comentários explicativos.

### `.gitignore`

Define arquivos que não devem ser enviados para o repositório, como chaves privadas e arquivos de ambiente.

## Conclusão

O laboratório permitiu praticar o gerenciamento de processos no Linux e compreender como ferramentas como `ps` e `top` podem ser utilizadas para consultar e monitorar processos.

Também foi praticada a automação de tarefas administrativas utilizando `cron` e `crontab`, permitindo executar comandos de auditoria de forma periódica.
