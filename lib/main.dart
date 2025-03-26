import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Dynamic List and Grids in Flutter',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: [
                Text('List', style: TextStyle(color: Colors.white)),
                Text('Grid', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          body: TabBarView(children: [_contentListView(), _contentGridView()]),
        ),
      ),
    );
  }

  Widget _contentListView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder:
          (context, index) => ListTile(
            title: Text('Item ${index.toString()}'),
            onTap: () => print('hello $index'),
          ),
    );
  }

  Widget _contentGridView() {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder:
          (context, index) => Card(
            child: GridTile(child: Center(child: Text(index.toString()))),
          ),
    );
  }
}
