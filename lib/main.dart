import 'package:flutter/material.dart'; //해당 소스 파일에서 사용하려는 패키지를 불러올 때 사용하는 구문
//main에서 runApp을 통해 MyApp를 실행한다.
//MyApp에서 MaterialApp를 반환하며 home에 MaterialFlutterApp을 실행한다
//MaterialFlutterApp은 stateful이라 state클래스 상속받는 _MaterialFlutterApp을 실행시킨다
//_MaterialFlutterApp은 Scaffold 안에 다양한 위젯을 담아 반환한다.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MaterialFlutterApp(),
    );
  }
}

class MaterialFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialFlutterApp();
  }
}

class _MaterialFlutterApp extends State<MaterialFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(title: Text('Material Design App'),),
        floatingActionButton: FloatingActionButton(
                                                child: Icon(Icons.add),
                                                onPressed: () {

                                                }),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(Icons.android),
                Text('android')
            ],
              mainAxisAlignment: MainAxisAlignment.center //세로로 정렬해줌,
          )
        )
        )
    );
  }
}