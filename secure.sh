set -a; source .env; set +a; ansible-playbook --ask-pass --ask-become-pass --inventory hosts.yml secure.yml
# Une fois que la sécurité de base est en place, vous pouvez exécuter plutôt cette commande
# set -a; source .env; set +a; ansible-playbook --inventory hosts.yml secure.yml