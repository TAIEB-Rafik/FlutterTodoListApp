import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/todo.dart';
import 'package:to_do_list/widgets/todo_item.dart';
import '../widgets/build_appBar.dart';
import '../widgets/searchbox.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: buildAppBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            'DO It',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                        for (ToDo todoo in todosList)
                          ToDoItem(
                            todo: todoo,
                            onToDoChanged: handleToDoChange,
                            onDeleteItem: () {},
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  AddTask(),
                  AddTaskButton(),
                ],
              ),
            )
          ],
        ));
  }

  void handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  Container AddTaskButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20, right: 20),
      child: ElevatedButton(
        child: Text(
          "+",
          style: TextStyle(fontSize: 40),
        ),
        onPressed: () {
          print("clicked on +");
        },
        style: ElevatedButton.styleFrom(
            primary: tdBlue, minimumSize: Size(60, 60), elevation: 10),
      ),
    );
  }

  Expanded AddTask() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0,
                spreadRadius: 0.0,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Ajouter une tache",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
