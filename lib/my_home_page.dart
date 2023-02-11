import 'package:flutter/material.dart';
import 'package:flutter_application_18/datatypes.dart';
import 'package:flutter_application_18/items.dart';

class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todoList = ToDO.todoList();
  final _todoController = TextEditingController();
  List<ToDO> _foundToDo = [];
  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 5,
        shadowColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 25,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset('images/hassan.jpg'),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 25,
                          bottom: 25,
                        ),
                        child: Text(
                          'ALL ToDos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      for(ToDO todoo in _foundToDo.reversed)
                      Items(
                      todo: todoo,
                      onChanged: _handleChange,
                      onDelete: _deleteItem,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                      right: 20,
                      left: 25,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0,0.0),
                        color: Colors.grey,
                        ),],
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add new item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 15,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        _add(_todoController.text);
                      },
                      child: Text(
                        '+', style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pinkAccent,
                        minimumSize: Size(50, 50),
                        elevation: 10,
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
  void _handleChange(ToDO todo){
    setState(() {
      todo.isDone = !todo.isDone; 
    });
  }
  void _deleteItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }
  void _add(String toDo){
    setState(() {
      todoList.add(ToDO(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
    });
    _todoController.clear();
  }
  void _filter(String enterKeyword){
    List<ToDO> results = [];
    if(enterKeyword.isEmpty){
      results = todoList;
    }else{
      results = todoList.where((item) => item.todoText!.toLowerCase().contains(enterKeyword.toLowerCase())).toList();
      
    }
    setState(() {
      _foundToDo = results;
    });
  }


Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
      ),
    ),
    child: TextField(
      onChanged: (value) {
        _filter(value);
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 23,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          maxWidth: 20,
        ),
        border: InputBorder.none,
        hintText: 'Search here...',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  );
}
}

