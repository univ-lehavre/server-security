# Cybersécurité d’un **cluster** de serveurs

[![DOI](https://zenodo.org/badge/1046248953.svg)](https://doi.org/10.5281/zenodo.16983614)

## Objectif

- Tendre vers une politique **zero trust** de cybersécurité
- Automatiser le plus possible l’installation et la configuration

## Méthode

Nous utilisons un ordinateur de contrôle (votre ordinateur de bureau par exemple) pour orchestrer à distance la configuration et la sécurisation d’un ou de plusieurs serveurs. L’automatisation est effectuée à l'aide de scripts et de playbooks Ansible.

## Pré-requis

Sur l’ordinateur de contrôle, assurez-vous d'avoir installé  les dépendances nécessaires :

- **Ansible** : pour l'exécution des playbooks ;
- **Python** : pour les scripts et modules utilisés ;
- **SSH** : pour la connexion aux serveurs distants.

Concernant les serveurs à sécuriser, nous considérons qu’ils bénéficient chacun de :

- Une installation minimale et récente de Debian bookworm (12) ;
- Un seul compte utilisateur avec un accès `sudo` et un mot de passe robuste ;
- Une adresse IP avec le port 22 accessible depuis l’ordinateur de contrôle.

## Installation

Sur l’ordinateur de contrôle, clonez ce dépôt localement :

```bash
git clone https://github.com/univ-lehavre/server-security.git
```

À la racine de ce dépôt cloné, renommez le fichier `.env.example` en `.env` et remplacez toutes les valeurs des variables d'environnement.

## Utilisation

Pour sécuriser les serveurs, lancez la commande suivante :

```bash
set -a; source .env; set +a; ansible-playbook --ask-pass --ask-become-pass --inventory hosts.yml secure.yml
```

Cette commande exécute le playbook Ansible `secure.yml` en utilisant les informations d'identification fournies dans le fichier `.env` et en ciblant les hôtes définis dans `hosts.yml`.

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

Avant de soumettre, lancez ce script afin que toutes les variables d’environnement du fichier privé `.env` soient bien obfusquées dans le fichier public `.env.example` :

```bash
perl ./blur-env.pl
```
