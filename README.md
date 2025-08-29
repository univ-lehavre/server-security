# Cybersécurité d’un **cluster** de serveurs

[![DOI](https://zenodo.org/badge/1046248953.svg)](https://doi.org/10.5281/zenodo.16983614)

## Pré-requis

Avant de commencer, assurez-vous d'avoir installé localement les dépendances nécessaires :

- **Ansible** : pour l'exécution des playbooks.
- **Python** : pour les scripts et modules utilisés.
- **SSH** : pour la connexion aux serveurs distants.

Vous avez besoin des adresses IP de tous vos serveurs, ces derniers viendront d’être installés avec le système d’exploitation Debian bookworm (12) et seront accessibles via le port 22.

## Installation

Clonez ce dépôt localement :

```bash
git clone https://github.com/univ-lehavre/server-security.git
```

À la racine de ce dépôt cloné, renommez le fichier `.env.example` en `.env` et remplacez toutes les valeurs des variables d'environnement.

## Utilisation

Pour sécuriser votre ou vos serveurs, lancez la commande suivante :

```bash
set -a; source .env; set +a; ansible-playbook --ask-pass --ask-become-pass --inventory hosts.yml secure.yml
```

## Contribution

Il est recommandé d'installer les modules suivants pour garantir la qualité et la cohérence du code :

- **prettier** : pour le formatage automatique du code.
- **ansible** : pour l'exécution des playbooks et rôles Ansible.
- **ansible-lint** : pour l'analyse statique et le linting des fichiers Ansible.

Pour formatter le code et exécuter le **linter** :

```bash
npm run format
npm run lint
```

Avant de soumettre, lancez ce script afin que toutes les variables d’environnement soit bien dans l’exemple :

```bash
cp .env .env-example && sed -i '' -E 's/^(.*)=.*/\1=<à modifier>/' .env-example
```
