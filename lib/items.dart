import 'package:flutter/material.dart';
import 'datatypes.dart';

class Items extends StatelessWidget {
  final ToDO todo;
  final onChanged;
  final onDelete;
  const Items({super.key, 
  required this.todo,
  required this.onChanged,
  required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all()
        ),
        child: ListTile(
          onTap: () {
            onChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: todo.isDone
              ? Icon(
                  Icons.check_box,
                  color: Colors.pinkAccent,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              onDelete(todo.id);
            },
            icon: Icon(Icons.delete,color: Color.fromARGB(255, 240, 24, 9),),
          ),
        ),
      ),
    );
  }
}

