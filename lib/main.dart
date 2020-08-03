import 'package:flutter/material.dart';
void main() => runApp(MyApp()
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Bottom Sheet",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _showPersBottomSheetCallBack= _showBottomSheet;

  }

  void _showBottomSheet(){
    setState(() {
      _showPersBottomSheetCallBack=null;
    });
    _scaffoldKey.currentState.showBottomSheet((context){
      return Container(
        height: 300,
        color: Colors.lightGreenAccent,
        child: Center(
          child: Text("Hi Bottom Sheet"),
        ),
      );

    }
    ).closed
    .whenComplete(() {
      if(mounted){
        setState(() {
          _showPersBottomSheetCallBack= _showBottomSheet;
        });
      }
    });
  }
  void _showModelSheet(){
    showModalBottomSheet(context: context, builder: (builder){
      return Container(
        color: Colors.greenAccent,
        child: Center(
          child: Text("Hi ModelSheet"),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Flutter BottomSheet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: _showPersBottomSheetCallBack,
                child: Text("Persistent"),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10),
              ),
              RaisedButton(
                onPressed: _showModelSheet,
                child: Text("model"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
