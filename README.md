# biblioapp-backend

Grupo:

- Abraha Silvera

## Instalacion

Clonar repositorio

```bash
  git clone https://github.com/AlonsoCGonzales/BackendSoftwareII
  cd BackendSoftwareII
```
Restaurar base de datos de Postgresql

```bash
  pg_restore -U postgres -d postgres scripts/data-backup.sql
```
Instalar dependencias con npm

```bash
  npm install
  npm install cors express sequelize react-router-doom
```