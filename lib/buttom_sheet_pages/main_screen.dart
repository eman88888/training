import 'package:flutter/material.dart';
import 'package:flutter_application/models/todos_model.dart';
import 'package:flutter_application/servies/todos_servies.dart';

class mains extends StatefulWidget {
  const mains({super.key});

  @override
  State<mains> createState() => _mainscreenState();
}

class _mainscreenState extends State<mains> {
  List<Todosmodel> todos = [];
  bool isLoading = true;
  gettodos() async {
    todos = await todos_servies().getUsersData();
    isLoading = false;
    setState(() {});
    print(todos.length);
  }

  @override
  void initState() {
    super.initState();
    gettodos();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  todos[index].title ?? "--",
                  style: TextStyle(color: Colors.black),
                ),
                // dense: (todos[index].completed),
              );
            },
          );
  }
}
