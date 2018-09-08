Migração de dados heroku

heroku pg:backups:capture
heroku pg:backups:download

heroku pg:backups:restore https://trello-attachments.s3.a79d/ssss.dump --confirm homolog-admin-maratonavirtual

rake db:migrate:up VERSION=20170405201210