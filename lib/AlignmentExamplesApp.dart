import 'package:flutter/material.dart';

class AlignmentExamplesApp extends StatelessWidget {
  const AlignmentExamplesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TASK 3 MANTILLA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExamplePage(index: 0),
    );
  }
}

// List of all examples — first ROW then COLUMN
final List<Map<String, dynamic>> examples = [
  // ROW – MainAxisAlignment
  {"title": "Mantilla Row Main.center", "widget": "row", "main": MainAxisAlignment.center, "cross": null},
  {"title": "Mantilla Row Main.spaceAround", "widget": "row", "main": MainAxisAlignment.spaceAround, "cross": null},
  {"title": "Mantilla Row Main.spaceBetween", "widget": "row", "main": MainAxisAlignment.spaceBetween, "cross": null},
  {"title": "Mantilla Row Main.spaceEvenly", "widget": "row", "main": MainAxisAlignment.spaceEvenly, "cross": null},
  {"title": "Mantilla Row Main.start", "widget": "row", "main": MainAxisAlignment.start, "cross": null},
  {"title": "Mantilla Row Main.end", "widget": "row", "main": MainAxisAlignment.end, "cross": null},

  // ROW – CrossAxisAlignment
  {"title": "Mantilla Row Cross.start", "widget": "row", "main": null, "cross": CrossAxisAlignment.start},
  {"title": "Mantilla Row Cross.end", "widget": "row", "main": null, "cross": CrossAxisAlignment.end},
  {"title": "Mantilla Row Cross.center", "widget": "row", "main": null, "cross": CrossAxisAlignment.center},
  {"title": "Mantilla Row Cross.stretch", "widget": "row", "main": null, "cross": CrossAxisAlignment.stretch},

  // COLUMN – MainAxisAlignment
  
  {"title": "Mantilla Column Main.spaceAround", "widget": "column", "main": MainAxisAlignment.spaceAround, "cross": null},
  {"title": "Mantilla Column Main.spaceBetween", "widget": "column", "main": MainAxisAlignment.spaceBetween, "cross": null},
  {"title": "Mantilla Column Main.spaceEvenly", "widget": "column", "main": MainAxisAlignment.spaceEvenly, "cross": null},
  {"title": "Mantilla Column Main.start", "widget": "column", "main": MainAxisAlignment.start, "cross": null},
  {"title": "Mantilla Column Main.end", "widget": "column", "main": MainAxisAlignment.end, "cross": null},
  {"title": "Mantilla Column Main.center", "widget": "column", "main": MainAxisAlignment.center, "cross": null},

  // COLUMN – CrossAxisAlignment
  {"title": "Mantilla Column Cross.start", "widget": "column", "main": null, "cross": CrossAxisAlignment.start},
  {"title": "Mantilla Column Cross.end", "widget": "column", "main": null, "cross": CrossAxisAlignment.end},
  {"title": "Mantilla Column Cross.center", "widget": "column", "main": null, "cross": CrossAxisAlignment.center},
  {"title": "Mantilla Column Cross.stretch", "widget": "column", "main": null, "cross": CrossAxisAlignment.stretch},
];

class ExamplePage extends StatelessWidget {
  final int index;
  const ExamplePage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final example = examples[index];
    final title = example["title"];
    final widgetType = example["widget"];
    final mainAlign = example["main"];
    final crossAlign = example["cross"];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: widgetType == "row"
            ? buildRowExample(mainAlign, crossAlign)
            : buildColumnExample(mainAlign, crossAlign),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: index > 0
                  ? () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ExamplePage(index: index - 1)),
                      )
                  : null,
              child: const Text("Previous"),
            ),
            ElevatedButton(
              onPressed: index < examples.length - 1
                  ? () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ExamplePage(index: index + 1)),
                      )
                  : null,
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ ROW (MainAxisAlignment / CrossAxisAlignment) ------------------
  Widget buildRowExample(MainAxisAlignment? mainAlign, CrossAxisAlignment? crossAlign) {
    return Row(
      mainAxisAlignment: mainAlign ?? MainAxisAlignment.center,
      crossAxisAlignment: crossAlign ?? CrossAxisAlignment.center,
      children: [
        Container(width: 90, height: 90, color: Colors.red),
        Container(width: 80, height: 80, color: Colors.yellow),
        Container(width: 70, height: 70, color: Colors.blue),
      ],
    );
  }

  // ------------------ COLUMN (MainAxisAlignment / CrossAxisAlignment) ------------------
  Widget buildColumnExample(MainAxisAlignment? mainAlign, CrossAxisAlignment? crossAlign) {
    final cross = crossAlign ?? CrossAxisAlignment.center;
    final main = mainAlign ??
        (crossAlign == CrossAxisAlignment.stretch
            ? MainAxisAlignment.start
            : MainAxisAlignment.center);

    return Column(
      crossAxisAlignment: cross,
      mainAxisAlignment: main,
      children: [
        Container(width: 90, height: 90, color: Colors.red),
        Container(width: 80, height: 80, color: Colors.yellow),
        Container(width: 70, height: 70, color: Colors.blue),
      ],
    );
  }
}
