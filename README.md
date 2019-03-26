dactylotest
===========

Un fork du dactylotest de Tazzon (<https://github.com/tazzon/dactylotest>) avec
 * des nouveaux textes qui remplacent ceux du dactylotest original
 * des textes deux fois plus longs en choisissant « français long » comme langue
 * un nouveau style plus sombre
 * un script bash pour ajouter facilement des nouveaux textes longs
 * un script bash pour convertir facilement le fichier de textes longs en un fichier de textes courts

On peut tester ici : <https://bakou.ze.cx/dactylotest/>

Dans la branche **frlong**, seuls les nouveaux textes longs ont été ajoutés, le reste est similaire au dactylotest original.

Pour que les fantômes des textes longs puissent être sauvegardés, il faut que le serveur web accepte les longues URIs. Par exemple avec Nginx, on peut ajouter, dans la section `http` du fichier `nginx.conf` :
```
client_header_buffer_size 64k;
large_client_header_buffers 4 64k;
```



