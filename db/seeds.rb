# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all
Project.destroy_all

Project.create!([{
                  title: 'Семья', todos: Todo.create([
                                                       { text: 'Купить молоко', isCompleted: false },
                                                       { text: 'Заменить масло в двигателе до 23 апреля',
                                                         isCompleted: false },
                                                       { text: 'Отправить письмо бабушке', isCompleted: true },
                                                       { text: 'Заплатить за квартиру', isCompleted: false },
                                                       { text: 'Забрать обувь из ремонта', isCompleted: false }
                                                     ])
                },
                 {
                   title: 'Работа', todos: Todo.create([
                                                         { text: 'Позвонить заказчику', isCompleted: true },
                                                         { text: 'Отправить документы', isCompleted: true },
                                                         { text: 'Заполнить отчет', isCompleted: false }
                                                       ])
                 },
                 {
                   title: 'Прочее', todos: Todo.create([
                                                         { text: 'Позвонить другу', isCompleted: false },
                                                         { text: 'Подготовиться к поездке', isCompleted: false }
                                                       ])
                 }])
