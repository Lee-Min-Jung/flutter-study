import 'package:flutter/material.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';
import './animalItem.dart';
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

  List<Animal> animalList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //맨 위에 나오는 bar 부분
        title: Text('Listview Example'),
      ),
      body: TabBarView( //가운데 화면. 근데 내비게이션 탭에 따라 달라져야 해서 나오게 할 화면의 class를 등록해 놓는다
        children: <Widget>[FirstApp(list: animalList), SecondApp(list: animalList)],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(tabs: <Tab>[ //맨 아래에 나오는 내비게이션 탭 부분
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
  void initState() { //위젯 생성할 때 한 번만 호출, 여기서 리스트에 어떤 내용 삽입하는 경우 많다
    super.initState();
    controller = TabController(length:2, vsync: this); //vsync에는 탭이 이동했을 때 호출되는 콜백 함수를 어디서 처리할지 지정함

    //리스트에 add 해주기
    animalList.add(Animal(animalName: "벌", kind: "곤충",
      imagePath: "repo/images/bee.png"));
    animalList.add(Animal(animalName: "고양이", kind: "포유류",
        imagePath: "repo/images/cat.png"));
    animalList.add(Animal(animalName: "젖소", kind: "포유류",
        imagePath: "repo/images/cow.png"));
    animalList.add(Animal(animalName: "강아지", kind: "포유류",
        imagePath: "repo/images/dog.png"));
    animalList.add(Animal(animalName: "여우", kind: "포유류",
        imagePath: "repo/images/fox.png"));
    animalList.add(Animal(animalName: "원숭이", kind: "포유류",
        imagePath: "repo/images/monkey.png"));
    animalList.add(Animal(animalName: "돼지", kind: "포유류",
        imagePath: "repo/images/pig.png"));
    animalList.add(Animal(animalName: "늑대", kind: "포유류",
        imagePath: "repo/images/wolf.png"));
  }

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }


}
