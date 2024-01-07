import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/model/todo_model.dart';

import '../../provider/todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();

  Future<void> _showDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add todo List"),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: "Write a List"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_textController.text.isEmpty) {
                  return;
                }

                context.read<TodoProvider>().addToDOList(
                      TODOModel(
                          title: _textController.text, isCompleted: false),
                    );
                _textController.clear();
                Navigator.pop(context);
              },
              child: Text("Submit"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    "To Do List",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemBuilder: (context, itemIndex) {
                  return ListTile(
                    title: Text(provider.allTODOList[itemIndex].title),);
                },
                itemCount: provider.allTODOList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          _showDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
