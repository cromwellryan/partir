json.extract! @project, :id, :name, :token, :created_at, :updated_at
json.deploys @project.deploys, :sha, :occurred_at, :environment
