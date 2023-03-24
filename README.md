# Windows Server Handbook <img src="assets/220215.png" width="10%" height="10%" align="right" valign="center"/> 

![learning](https://img.shields.io/badge/WindowsServer-learning-green.svg)
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https://github.com/vitoriape/winserver-handbook&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=Views&edge_flat=false)](https://hits.seeyoufarm.com)

<!--ts-->
* [Máquinas Virtuais](#máquinas-virtuais)
  * [Configuração de Rede](#configuração-de-rede)
  * [Instalando Máquinas](#instalando-máquinas)
    * [Domínio](#domínio)
    * [Group Policy (GPO)](#group-policy-gpo)
    * [Active Directory (AD DS)](#active-directory-ad-ds)
    * [Domínio do Active Directory](#domínio-do-active-directory)
    * [Unidade Organizacional (UO)](#unidade-organizacional-uo)
  * [Adicionando Funções e Recursos](#adicionando-funções-e-recursos)
  * [Criando Usuários](#criando-usuários)
<!--te-->

---
---

## **Máquinas Virtuais**
Opera através de um hipervisor, um software executado no sistema operacional da máquina física, junto ao monitor de máquinas virtuais, o _Virtual Machine Monitor_. Nem sempre a virtualização da CPU vem habilitada na máquina, sendo necessário acessar as configurações ou a BIOS da mesma para permitir o uso das máquinas virtuais. São divididas em dois tipos:  

- **VM Tipo I (Bare Metal):** As aplicações são gerenciadas diretamente pelo Hipervisor do host
- **VM Tipo II (Hospedada):** As aplicações são gerenciadas pelo Sistema Operacional do host

### **Configuração de Rede**
O Modo de Rede escolhido para uma máquina virtual determina se a mesma tem **acesso a internet**, **comunicação com o host**, **comunicação com outras vms** e se a mesma fica visível na rede local do host.

<table><thead><tr><th>Modo de Rede</th><th>ACESSO A INTERNET</th><th>COMUNICAÇÃO COM HOST</th><th>COMUNICAÇÃO COM OUTRAS VMs</th><th>VISIBILIDADE NA REDE LOCAL DO HOST</th></tr></thead><tbody><tr><td>NAT</td><td>Sim</td><td>Não</td><td>Não</td><td>Não</td></tr><tr><td>NAT Network</td><td>Sim</td><td>Não</td><td>Sim</td><td>Não</td></tr><tr><td>Bridged Networking</td><td>Sim</td><td>Sim</td><td>Sim</td><td>Sim</td></tr><tr><td>Internal Networking</td><td>Não</td><td>Não</td><td>Sim</td><td>Não</td></tr><tr><td>Host-only Adapter</td><td>Não</td><td>Sim</td><td>Sim</td><td>Não</td></tr></tbody></table>

### **Instalando Máquinas**
A **Instalação Limpa** de um servidor contempla a implementação ou substituição de um sistema operacional, enquanto que a **Atualização in-loco** mantém o hardware, as configurações, os dados e as funções, apenas mudando o sistema existente. Já a **Atualização em Cluster** permite a atualização sem interromper o Hyper-V ou o trabalho do servidor.

- **Alterar o Nome da Máquina**
```cmd
Win + R
sysdm.dpl
```

- **Configurações**
As placas de rede das máquinas virtuais devem estar configuradas como host-only

```cmd
Win + R
ncpa.cpl
```

* Servidor
```cmd
IP: 10.0.0.100
Máscara: 255.0.0.0
Gateway padrão: 10.0.0.1
Servidor DNS preferencial: 127.0.0.1

\\Script do Windows PowerShell para Implantação do AD DS

Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "NOME.LOCAL" `
-DomainNetbiosName "NOME" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true

\\Exportar IFM
NTDSUTIL
Activate instance ntds
IFM
Create sysvol full C:\IFM
```

* Servidor (Core)
```cmd
sconfig

IP: 10.0.0.103
Máscara: 255.0.0.0
Gateway padrão: 10.0.0.1
Servidor DNS preferencial: 10.0.0.100
```

* Host
```cmd
IP: 10.0.0.102
Máscara: 255.0.0.0
Gateway padrão: 10.0.0.1
Servidor DNS preferencial: 10.0.0.100
```

* Caso seja necessário comunicação com a rede externa, deve-se adicionar uma placa de rede e deixar em modo BRIDGE

>---

### **Domínio**
Em oposição ao Workgroup, um domínio possui administração centralizada, tendo suas máquinas gerenciadas por políticas de grupo centralizadas, garantindo segurança e disponibilização de recursos. O computador pode ser gerenciado em locais remotos e o servidor pode gerenciar muitos computadores ao mesmo tempo.

### **Group Policy (GPO)**
Políticas criadas pelos administradores para gerenciar e configurar contas de computador e de usuário.

### **Active Directory (AD DS)**
O Serviço de Domínio do Active Diretory é um repositório Central de todos os objetos do domínio, contemplando as contas de usuário, computadores e grupos.

- Oferece um diretório hierárquico pesquisável
- Aplica parâmetros de configuração e segurança
- Hospeda o serviço de autenticação das contas de usuário e computador ao ser efetuado logon no domínio

### **Domínio do Active Directory**
Agrupamento de objetos de usuário, computador e grupo, sendo todos esses objetos armazenados no banco de dados do AD DS e uma cópia do mesmo armazenada em cada controlador de domínio do AD DS.

### **Unidade Organizacional (UO)**
Objeto de contêiner dentro de um domínio que pode ser utilizado para consolidar usuário, grupos, computadores e outros objetos. É possível utilizar as UOs para delegar o controle administrativo de objetos e para atribuir [políticas de grupo](#group-policy-gpo).

* Também é possível usar das unidades organizacionais para representar estruturas de hierarquia dentro da organização

>---

### **Adicionando Funções e Recursos**
No Painel do Gerenciador de Servidor, afim de configurar o servidor local, deve-se selecionar o servidor anteriormente configurado em Seleção de Servidor. Na tela Funções, selecionar o módulo Serviços de Domínio Active Directory e confirmar a adição do recurso.

* Caso não seja selecionado automáticamente, marcar a função Servidor DNS

>---

### **Criando Usuários**

```cmd
dsadd user cn="Nome Sobrenome", ou=Departamento, dc=dominio, dc=local -samId NSobrenome -upn "nsobrenome@dominio.local" -fn Nome -ln Sobrenome -pwd "Senha" -disable no
```

---
---
