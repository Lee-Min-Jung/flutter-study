import 'package:flutter/material.dart';
import '../animalItem.dart'; //animal 클래스 사용을 위한 import

class SecondApp extends StatefulWidget {
  final List<Animal> list;
  SecondApp({Key? key, required this.list}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SecondApp(); //기존에 여러 줄로 함수 호출 표현했던 걸 여기서는 한 줄로 표현한 것

}

class _SecondApp extends State<SecondApp> {
  final nameController = TextEditingController();
  int? _radioValue = 0;
  bool? flyExist = false;
  var _imagePath;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //대괄호 안은 위젯을 담을 공간
            children: <Widget> [
              TextField( //텍스트 입력받는 위젯
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Row(
                children: <Widget> [
                  Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange), //value는 인덱스, groupValue는 그룹화, onChanged는 이벤트 처리
                  Text('양서류'),
                  Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange),
                  Text('파충류'),
                  Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange),
                  Text('포유류')
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround, //양쪽 여백 사이에 균일하게 배치하도록 함
              ),
              Row(
                children: <Widget>[
                  Text('날 수 있나요?'),
                  Checkbox(value: flyExist,
                          onChanged: (check) {
                              setState(() {
                                flyExist = check;
                    });
                      })
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset('repo/images/cow.png', width: 80),
                      onTap: (){
                        _imagePath = 'repo/images/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/pig.png', width: 80),
                      onTap: (){
                        _imagePath = 'repo/images/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/bee.png', width: 80),
                      onTap: (){
                        _imagePath = 'repo/images/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/cat.png', width: 80),
                      onTap: (){
                        _imagePath = 'repo/images/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/fox.png', width: 80),
                      onTap: (){
                        _imagePath = 'repo/images/fox.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repo/images/monkey.png', width: 80),
                      onTap: (){
                        _imagePath = 'repo/images/monkey.png';
                      },
                    ),

                  ],
                )


              ),
              ElevatedButton(child: Text('동물 추가하기'),
                              onPressed: () { //동물 추가하기 버튼을 누르면 진행되는 것
                                  var animal = Animal(
                                    animalName: nameController.value.text,
                                    kind: getKind(_radioValue),
                                    imagePath: _imagePath,
                                    flyExist: flyExist
                                  );
                                  AlertDialog dialog = AlertDialog(
                                    title: Text('동물 추가하기'),
                                    content: Text(
                                      '이 동물은 ${animal.animalName} 입니다.'
                                          '또 동물의 종류는 ${animal.kind} 입니다. \n 이 동물을 추가하시겠습니까?',
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                    actions: [ //배열 형태로 위젯을 가져올 수 있음, 이걸 앞에서 생성한 AlertDialog 위젯 아래에 붙여줌
                                      ElevatedButton(onPressed: (){
                                        widget.list.add(animal); //리스트에 추가
                                        Navigator.of(context).pop();//알림창 끄기
                                      },
                                          child: Text('예')),
                                      ElevatedButton(onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                          child: Text('아니오'))
                                    ],
                                  );
                                  showDialog(context: context,
                                      builder: (BuildContext context) => dialog);
                              }, )
            ],

          ),

        ),

      )

    );

  }
  void _radioChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  getKind(int? radioValue){
    switch (radioValue) {
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  }
}