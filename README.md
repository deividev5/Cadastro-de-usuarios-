# Cadastro de Usuários

Sistema desktop para cadastro e gerenciamento de usuários, desenvolvido em **Delphi** com interface VCL e banco de dados **SQLite**.

## Descrição

Aplicação CRUD completa que permite cadastrar, editar, excluir e consultar usuários. O banco de dados é criado automaticamente na primeira execução, sem necessidade de configuração prévia.

## Funcionalidades

- **Cadastro de usuários** — Nome, e-mail, login, senha e status (ativo/inativo)
- **Edição** — Alteração dos dados com opção de manter a senha atual
- **Exclusão** — Remoção com confirmação do usuário
- **Busca** — Filtro por nome, e-mail ou login
- **Hash de senha** — Senhas armazenadas com SHA-256
- **Grid customizada** — Coluna "Ativo" exibida como Sim/Não

## Tecnologias

| Componente | Tecnologia |
|---|---|
| Linguagem | Delphi (Object Pascal) |
| Interface | VCL (Visual Component Library) |
| Banco de Dados | SQLite |
| Acesso a Dados | FireDAC |

## Estrutura do Projeto

| Arquivo | Descrição |
|---|---|
| `CadastroUsuarios.dpr` | Arquivo principal do projeto |
| `uPrincipal.pas / .dfm` | Tela principal — listagem, busca e ações sobre usuários |
| `uCadastro.pas / .dfm` | Tela de cadastro/edição de usuário (modal) |
| `uDM.pas / .dfm` | DataModule — conexão com o banco e queries |

## Estrutura do Banco de Dados

**Tabela: USUARIOS**

| Campo | Tipo | Descrição |
|---|---|---|
| ID | INTEGER (PK, autoincrement) | Identificador único |
| NOME | VARCHAR(100) | Nome do usuário |
| EMAIL | VARCHAR(150) | E-mail (opcional) |
| LOGIN | VARCHAR(50) | Login de acesso |
| SENHA | VARCHAR(100) | Senha (hash SHA-256) |
| ATIVO | INTEGER | Status: 1 = Ativo, 0 = Inativo |
| DATA_CADASTRO | DATETIME | Data/hora de criação (automática) |

## Como Executar

1. Abra o projeto `CadastroUsuarios.dproj` no **Delphi** (RAD Studio)
2. Compile e execute (F9)
3. O banco `usuarios.db` será criado automaticamente no diretório do executável

> **Requisito:** Delphi com suporte a FireDAC e driver SQLite (incluído por padrão no RAD Studio).

