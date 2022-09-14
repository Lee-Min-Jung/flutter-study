import 'package:flutter/material.dart'; //해당 소스 파일에서 사용하려는 패키지를 불러올 때 사용하는 구문
import 'imageWidget.dart' ;

//main에서 runApp을 통해 MyApp를 실행한다.
//MyApp에서 MaterialApp를 반환하며 home에 MaterialFlutterApp을 실행한다
//MaterialFlutterApp은 stateful이라 state클래스 상속받는 _MaterialFlutterApp을 실행시킨다
//_MaterialFlutterApp은 Scaffold 안에 다양한 위젯을 담아 반환한다.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 static const String _title = 'Widget Example';

 @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: _title,
     home: WidgetApp(),
   );
 }
}

class WidgetApp extends StatefulWidget {
  WidgetApp({Key? key}) : super(key: key);

  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  var result;
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  List _buttonList = ['더하기','빼기','곱하기','나누기'];
  List<DropdownMenuItem<Object>> _dropDownMenuItems = [];
  String _buttonText = '';

  @override
  void initState() {
    super.initState();
    for(var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding( //위젯 사이의 간격 넓히기, flutter 문구
                padding: EdgeInsets.all(15), //사방 모든 공간에 여백
                child: Text('flutter'),
              ),
              Padding( //입력창 1
                padding: EdgeInsets.only(left:20, right:20), //동서남북 중 어디 여백 줄 지 지정 가능
                child: TextField(keyboardType: TextInputType.number, controller: value1), //keyboardType는 사용자에게 보일 키보드 지정. 숫자나 한글이나 등등
              ),
              Padding( //입력창 2
                padding: EdgeInsets.only(left:20, right:20),
                child: TextField(keyboardType: TextInputType.number, controller: value2),
              ),
              Padding( //계산 진행 버튼
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Text(_buttonText)
                    ],
                  ),
                  style: ElevatedButton.styleFrom( //버튼의 스타일
                      primary: Colors.amber
                  ),
                  onPressed: () {
                    setState(() {
                      var value1Int = double.parse(value1.value.text);
                      var value2Int = double.parse(value2.value.text);

                      if(_buttonText == '더하기') {
                        result = value1Int + value2Int;
                      } else if (_buttonText == '빼기') {
                        result = value1Int  - value2Int;
                      } else if (_buttonText == '곱하기') {
                        result = value1Int  * value2Int;
                      } else if (_buttonText == '나누기') {
                        result = value1Int  / value2Int;
                      }
                    });
                  },

                ),
              ),
              Padding( //결과 나오는 곳
                padding: EdgeInsets.all(15),
                child: Text(
                  '결과 : $result',
                  style: TextStyle(fontSize: 20),
                )
              ),
              Padding( //사칙연산버튼
                padding: EdgeInsets.all(15),
                child: DropdownButton(items: _dropDownMenuItems, onChanged: (value) {
                  setState(() {
                    _buttonText = value.toString();
                  });
                }, value: _buttonText,),
              )


            ]
          ),
        ),
      ),
    );
  }
}
