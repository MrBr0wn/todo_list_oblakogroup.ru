json.array! @projects do |project|
  json.id project.id
  json.title project.title

  json.todos(project.todos) do |todo|
    json.id todo.id
    json.text todo.text
    json.isCompleted todo.isCompleted
    json.project_id todo.project_id
  end
end
