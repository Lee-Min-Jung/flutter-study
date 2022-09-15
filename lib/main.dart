import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubPage Example',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page Main'),
      ),
      body: Container(
        child: Center(
          child: Text('첫 번째 페이지'),

        ),

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondPage()));
            //navigator는 스택을 이용해 페이지를 관리할 때 사용하는 클래스.
            //navigator클래스의 of(context)함수는 현재 페이지를 나타내고
            //push함수는 스택에 페이지를 쌓는 역할을 함
            //따라서 위 코드는 현재 페이지 위에 SecondPage를 쌓는 것이라고 볼 수 있음
          },
          child: Icon(Icons.add),
        )
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop(); //지금 페이지를 종료
              //Navigator의 pop은 스택에서 제일 위에 있는 페이지를 제거
            },
            child: Text('돌아가기'),
          )
        )
      )
    );
  }
}

