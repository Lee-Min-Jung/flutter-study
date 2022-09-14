import 'package:flutter/material.dart'; //해당 소스 파일에서 사용하려는 패키지를 불러올 때 사용하는 구문

//다른 다트 클래스나 pubspec.yaml파일에서 내려받은 패키지 불러올 때 사용
//material.dart 패키지는 플러터의 UI와 관련된 거의 모든 클래스가 포함되어 있음
void main() {
  runApp(MyApp()); //runApp 함수는 binding.dart 클래스에 정의되어 있고 플러터 앱을 시작
  //runApp 함수에 플러터 앱을 시작하면서 화면에 표시활 위젯 전달, 여기서는 위젯이 MyApp
}

//내용을 갱신할 필요가 없는 위젯은 앱이 위젯 상태를 감시할 필요가 없다 -> StatelessWidget 클래스 상속 받는다
//내용을 갱신할 필요가 있는 위젯은 앱이 위젯 상태를 감시해야 한다 -> StatefulWidget 클래스 상속 받는다
class MyApp extends StatefulWidget { //stateful 위젯은 혼자서 화면을 출력할 수 없고 state 클래스가 필요하다.
  //그래서 state 클래스를 상속받는 _MyApp클래스를 만들고 그 안에 위젯을 담는다
  //Stateful위젯을 상속받는 MyApp은 createState 함수를 재정의해서 호출한다.
  //이렇게 하면 MyApp클래스가 현재 화면을 주시하다가 상태가 변경되면 이를 감지하고 _MyApp클래스가 화면 갱신
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  //StatelessWidget은 상태가 변경되지 않는 위젯
  var switchValue = false;
  String test = 'hello';
  Color _color = Colors.blue;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //build에는 어떤 위젯 만들 것인지 정의
    return MaterialApp(
      //runApp을 이용해 클래스 실행할 때 MaterialApp 함수를 반환해야 함, MaterialApp은 일종의 도화지
      //title과 theme, home는 일종의 그림 그리는 도구
      title: 'Flutter Demo', //앱의 이름
      theme: ThemeData(
        //지금 만들 앱의 테마 어떤 색상으로 할지
        primarySwatch: Colors.blue, //
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold( //scaffold 클래스를 통해 앱에 머티리얼 디자인 적용 가능
          body: Center(
              child: ElevatedButton ( //버튼 위젯
                  child: Text('$test'), //버튼에 들어갈 텍스트
                  style: ElevatedButton.styleFrom( //버튼의 스타일
                      primary: _color
                  ),
                  onPressed: () { //버튼이 눌러졌을 때 일어날 일 작성
                    if (_color == Colors.blue) {
                      setState(() {
                        test = 'flutter';
                        _color = Colors.amber;
                      });
                    } else {
                      setState(() {
                        test = 'flutter';
                        _color = Colors.blue;
                      });
                    }
                  }
              ))), //앱을 실행할 때 첫 화면에 어떤 내용 표시할지
      //child옵션은 자신 아래 어떤 위젯을 넣겠다는 의미, 하나만 넣을 때는 child, 여러 개 넣을 때는 children
    );
  }
}