import 'package:flutter/foundation.dart'; // Import for ChangeNotifier
import '../model/todo_model.dart'; // Import the TODOModel class

class TodoProvider extends ChangeNotifier {
  // Private list to store todo items
  final List<TODOModel> _todoList = [];

  // Getter to access the todo list (read-only)
  List<TODOModel> get allTODOList => _todoList;

  // Add a new todo item to the list
  void addToDOList(TODOModel todoModel) {
    _todoList.add(todoModel);
    notifyListeners(); // Notify listeners of list change
  }

  void todoStatusChange(TODOModel todoModel) {
    final index = _todoList.indexOf(todoModel);
      _todoList[index].toggleCompleted();
      notifyListeners();// Notify listeners of list change
  }

  // Remove a todo item from the list
  void removeToDOList(TODOModel todoModel) {
    final index = _todoList.indexOf(todoModel);
    if (index != -1) { // Ensure the item exists before removing
      _todoList.removeAt(index);
      notifyListeners(); // Notify listeners of list change
    }
  }
}
