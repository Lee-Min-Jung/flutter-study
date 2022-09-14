import 'package:flutter/material.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{ //singleTickerProviderStateMixin을 추가로 상속하여 탭을 눌렀을 때
                                                          // _MyHomePageState 클래스에서 애니메이션 동작을 처리할 수 있게 한다

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
      ),
      body: TabBarView(
        children: <Widget>[FirstApp(), SecondApp()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(tabs: <Tab>[
        Tab(icon: Icon(Icons.looks_one, color: Colors.blue),),
        Tab(icon: Icon(Icons.looks_two, color: Colors.blue),)
      ], controller: controller)
    );
  }
    @override //탭 컨트롤러는 애니메이션을 이용하므로 dispose해야 메모리 누수를 막을 수 있다
    void dispose() {
      controller.dispose();
      super.dispose();

  }
  int _counter = 0;
  late TabController controller;


  @override
  void initState() {
    super.initState();
    controller = TabController(length:2, vsync: this); //vsync에는 탭이 이동했을 때 호출되는 콜백 함수를 어디서 처리할지 지정함
  }

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }


}
