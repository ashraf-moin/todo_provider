class TODOModel {
  // Properties of a todo item
  String title;
  bool isCompleted;

  // Constructor to create a todo item
  TODOModel({required this.title, required this.isCompleted});

  // Method to toggle the completion status of a todo item
  void toggleCompleted() {
    isCompleted = !isCompleted; // Invert the current completion status
  }
}
