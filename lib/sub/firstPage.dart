import 'package:flutter/material.dart';
import '../animalItem.dart'; //animal 클래스 사용을 위한 import

class FirstApp extends StatelessWidget {
  final List<Animal> list;
  FirstApp({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
              itemBuilder: (context, position) { //ListView.builder는 리스트뷰를 만들게 해주는 위젯의 한 종류
                                                                    //itembuilder는 buildContext와 int를 반환한다
                                                                  //buildContext는 위젯 트리에서 위젯의 위치를 알려주며, int는 아이템의 순번 의미
                                                                    //context는 위젯의 위치, position은 순번 의미
            return GestureDetector(//손가락 터치와 관련된 많은 이벤트를 처리하는 위젯
              child:  Card ( //리스트 뷰에 있는 각 항목을 card 위젯을 사용해서 만들 것, for문 처럼 list에 있는 거 다 만들어준다.
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        list[position].imagePath,
                        height:100,
                        width:100,
                        fit: BoxFit.contain,
                      ),
                      Text(list[position].animalName)
                    ],
                  )

              ),
              onTap: () { //GestureDetecotr 아래에 있는 한 번 터치했을 때 알림 창 띄우는 이벤트
                AlertDialog dialog = AlertDialog(
                  content: Text(
                    '이 동물은 ${list[position].kind}입니다',
                    style: TextStyle(fontSize: 30.0),
                  ),
                );
                showDialog( //showDialog는 함수, 이 함수를 호출해 알림 창을 띄운다
                  context: context,
                  builder: (BuildContext context) => dialog
                );
              }
            );

          },
          itemCount: list.length)//아이템 개수만큼만 스크롤 할 수 있게 제한
        )
      )
    );
  }
}