class ToDO{
  String? id;
  String? todoText;
  bool isDone;
  ToDO({
    required this.id,
    required this.todoText,
    this.isDone =false
  });
  static List<ToDO> todoList(){
    return [
      ToDO(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDO(id: '02', todoText: 'Check Meals', isDone: true),
      ToDO(id: '03', todoText: 'Buy Groceries'),
      ToDO(id: '04', todoText: 'Go for Shopping'),
      ToDO(id: '05', todoText: 'Trip'),
      ToDO(id: '06', todoText: 'Studies'),
    ];
  }
}