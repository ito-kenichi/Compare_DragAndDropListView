import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _rows;

  @override
  void initState() {
    super.initState();
    _rows = List<Widget>.generate(50,
            (int index) => Text('This is row $index', key: ValueKey(index), textScaleFactor: 1.5)
    );
  }

  @override
  Widget build(BuildContext context) {

    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _rows.removeAt(oldIndex);
        _rows.insert(newIndex, row);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ReorderableColumn(
          header: Text('THIS IS THE HEADER ROW'),
          footer: Text('THIS IS THE FOOTER ROW'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _rows,
          onReorder: _onReorder,
        ),
      ),
    );
  }
}
