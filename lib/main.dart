import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubPage Example',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', //처음 앱을 시작했을 때 보여 줄 경로
      routes: {'/': (context) => FirstPage(), //String : Widget 형태로 경로를 선언한다
                '/second': (context) => SecondPage()},

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
                .pushNamed('/second');//pushNamed 함수는 페이지를 이동할 때 routes에 선언한 경로를 이용한다
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