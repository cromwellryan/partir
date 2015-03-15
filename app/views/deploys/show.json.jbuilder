json.extract! @deploy, :id, :project_id, :occurred_at, :sha, :environment
json.attachments @deploy.attachments, :data
