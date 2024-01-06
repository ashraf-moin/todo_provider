import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/provider/todo_provider.dart';
import 'package:todo_provider/view/home_page/home.dart';

void main() {
  // Run the app with a MultiProvider to make the TodoProvider available throughout the app
  runApp(MultiProvider(
    providers: [
      // Provide the TodoProvider using ChangeNotifierProvider
      ChangeNotifierProvider(create: (_) => TodoProvider()),
    ],
    child: const MyApp(), // Wrap the MyApp widget with providers
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
