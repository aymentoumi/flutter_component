
import 'package:component/counter_component.dart';
import 'package:component/title_component.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TitleComponent _title = TitleComponent();
  final CounterComponent _counter = CounterComponent();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: _title,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              _counter,
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter.incrementCounter();
            _title.value = "${_title.value} ${_counter.value}";
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
