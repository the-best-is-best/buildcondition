# BuildCondition

Synchronous conditional widget renderer.

Lets you declaratively render a widget based on a condition, using this you can get rid of
implicit conditional statements in your code to display/hide a widget.

## Example

After following the installation guide, you can use this widget as follow:

```dart
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Build Condition Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Build Condition Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int id = 0;
  int id2 = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => loaded());
  }

  Future loaded() async {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        id = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BuildCondition(
          condition: id == id2,
          builder: (context) => const Text("Loaded"),
          fallback: (context) => const CircularProgressIndicator(),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

```
