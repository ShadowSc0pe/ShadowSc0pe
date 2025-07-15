# 🧪 Writeup – [Nom de la machine HTB] (Exemples)

## 🧠 Informations générales
- **Niveau** : Facile / Intermédiaire / Difficile
- **Système cible** : Linux / Windows
- **Adresse IP ou Hostname** : [à renseigner]
- **But** : Obtenir user.txt et root.txt

---

## 🔍 Énumération
### Nmap
```
nmap -sC -sV -oA nmap/scan [IP]
```

### Web / Services
- Utilisation de gobuster, nikto, etc.
- Découverte de [service / CVE / version]

---

## 💥 Exploitation
- Détail de la faille exploitée
- Exploit utilisé ou script maison
- Shell obtenu via : reverse shell / Metasploit / netcat / etc..

---

## 🪜 Privilege Escalation
- Enumeration locale (`linPEAS`, `sudo -l`, `pspy`)
- Escalade via [technique]

---

## 📝 Post-exploitation / Notes
- Résumé
- Commandes utiles
- Erreurs rencontrées

---

## ✅ Flags
- `user.txt` : [flag]
- `root.txt` : [flag]
