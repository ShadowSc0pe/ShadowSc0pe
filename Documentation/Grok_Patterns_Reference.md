
# Grok Patterns – Référentiel de Parsing pour Logs de Sécurité

Ce document regroupe une série de **Grok Patterns** prêts à l’emploi pour parser les logs systèmes, SSH, web ou liés à la sécurité.

---

## 1. Connexion SSH échouée – Utilisateur invalide

```grok
%{SYSLOGBASE2} %{DATA:logSrc} %{WORD:program}\[%{BASE10NUM:pid}\]: %{WORD:result} %{WORD:loginType} for (invalid user )?%{WORD:username} from %{IP:srcIp} port %{BASE10NUM:clientPort} %{WORD:protocol}
```

---

## 2. Connexion SSH réussie

```grok
%{SYSLOGBASE2} %{DATA:logSrc} %{WORD:program}\[%{BASE10NUM:pid}\]: Accepted %{WORD:loginType} for %{USER:username} from %{IP:srcIp} port %{BASE10NUM:clientPort} %{WORD:protocol}
```

---

## 3. Tentative sudo échouée

```grok
%{SYSLOGTIMESTAMP:timestamp} %{HOSTNAME:host} sudo: %{USER:user} : %{GREEDYDATA:command}
```

---

## 4. Échec d’authentification PAM

```grok
%{SYSLOGTIMESTAMP} %{HOSTNAME} %{WORD:program}\[%{BASE10NUM:pid}\]: pam_unix\(%{GREEDYDATA}\): authentication failure; logname=%{USERNAME:logname} uid=%{NUMBER:uid} euid=%{NUMBER:euid} tty=%{DATA:tty} ruser=%{DATA:ruser} rhost=%{IP:rhost} user=%{USERNAME:user}
```

---

## 5. Commandes Bash exécutées (Auditd ou .bash_history)

```grok
%{SYSLOGTIMESTAMP} %{HOSTNAME} %{WORD:program}: user=%{USER:user} command="%{GREEDYDATA:command}"
```

---

## 6. Installation de paquet APT

```grok
%{SYSLOGTIMESTAMP} %{HOSTNAME} %{WORD:program}\[%{BASE10NUM:pid}\]: install %{DATA:package} %{DATA:version}
```

---

## 7. Logs d'accès Nginx

### Accès réussi

```grok
%{IPORHOST:clientip} - %{USER:ident} \[%{HTTPDATE:timestamp}\] "%{WORD:method} %{URIPATHPARAM:request} HTTP/%{NUMBER:http_version}" %{NUMBER:response} %{NUMBER:bytes}
```

### Erreur 404

```grok
%{IPORHOST:clientip} - %{USER:ident} \[%{HTTPDATE:timestamp}\] "%{WORD:method} %{URIPATHPARAM:request} HTTP/%{NUMBER:http_version}" 404 %{NUMBER:bytes}
```

---

## 8. Requête DNS (bind/named)

```grok
%{SYSLOGTIMESTAMP} %{HOSTNAME} named\[%{BASE10NUM:pid}\]: client %{IP:client}#%{NUMBER:port} \(%{DATA:domain}\): query: %{DATA:query} %{WORD:class} %{WORD:type} %{WORD:flags}
```

---

## 9. Modification de fichier (Auditd)

```grok
type=SYSCALL msg=audit\(%{NUMBER:timestamp}\.%{NUMBER}\): arch=%{WORD} syscall=%{NUMBER} success=%{WORD} exit=%{NUMBER} a0=%{DATA} a1=%{DATA} a2=%{DATA} a3=%{DATA} items=%{NUMBER} ppid=%{NUMBER} pid=%{NUMBER} auid=%{NUMBER} uid=%{NUMBER} gid=%{NUMBER} euid=%{NUMBER} suid=%{NUMBER} fsuid=%{NUMBER} egid=%{NUMBER} sgid=%{NUMBER} fsgid=%{NUMBER} tty=%{WORD} ses=%{NUMBER} comm="(?<command>[^"]+)" exe="(?<executable>[^"]+)"
```
