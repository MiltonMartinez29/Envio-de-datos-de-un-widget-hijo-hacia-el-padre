import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dataFromChild = '';

  void updateData(String newData) {
    setState(() {
      dataFromChild = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Navegacion'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Pantalla 1'),
              Tab(text: 'Pantalla 2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab1(updateData),
            Tab2(dataFromChild),
          ],
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  final Function(String) onDataReceived;

  Tab1(this.onDataReceived);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          String newData = 'Datos de pantalla 1';
          onDataReceived(newData);
        },
        child: Text('Envio de datos a los padres'),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  final String data;

  Tab2(this.data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(data),
    );
  }
}
