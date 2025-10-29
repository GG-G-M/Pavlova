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
  {"title": "Mantilla Main.center", "widget": "row", "main": MainAxisAlignment.center, "cross": null},
  {"title": "Mantilla Main.spaceAround", "widget": "row", "main": MainAxisAlignment.spaceAround, "cross": null},
  {"title": "Mantilla Main.spaceBetween", "widget": "row", "main": MainAxisAlignment.spaceBetween, "cross": null},
  {"title": "Mantilla Main.spaceEvenly", "widget": "row", "main": MainAxisAlignment.spaceEvenly, "cross": null},
  {"title": "Mantilla Main.start", "widget": "row", "main": MainAxisAlignment.start, "cross": null},
  {"title": "Mantilla Main.end", "widget": "row", "main": MainAxisAlignment.end, "cross": null},

  // COLUMN – CrossAxisAlignment
  {"title": "Mantilla Cross.start", "widget": "column", "main": null, "cross": CrossAxisAlignment.start},
  {"title": "Mantilla Cross.end", "widget": "column", "main": null, "cross": CrossAxisAlignment.end},
  {"title": "Mantilla Cross.center", "widget": "column", "main": null, "cross": CrossAxisAlignment.center},
  {"title": "Mantilla Cross.stretch", "widget": "column", "main": null, "cross": CrossAxisAlignment.stretch},
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
            ? buildRowExample(mainAlign)
            : buildColumnExample(crossAlign),
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

  // ------------------ ROW (MainAxisAlignment) ------------------
  Widget buildRowExample(MainAxisAlignment alignmentType) {
    return Row(
      mainAxisAlignment: alignmentType,
      children: [
        Container(width: 90, height: 90, color: Colors.red),
        Container(width: 80, height: 80, color: Colors.yellow),
        Container(width: 70, height: 70, color: Colors.blue),
      ],
    );
  }

  // ------------------ COLUMN (CrossAxisAlignment) ------------------
  Widget buildColumnExample(CrossAxisAlignment alignmentType) {
    // Stretch alignment starts from top instead of center
    final mainAxis = alignmentType == CrossAxisAlignment.stretch
        ? MainAxisAlignment.start
        : MainAxisAlignment.center;

    return Column(
      crossAxisAlignment: alignmentType,
      mainAxisAlignment: mainAxis,
      children: [
        Container(width: 90, height: 40, color: Colors.red),
        Container(width: 80, height: 60, color: Colors.yellow),
        Container(width: 70, height: 80, color: Colors.blue),
      ],
    );
  }
}
