import 'package:flutter/material.dart';

class SecondDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop(controller.value.text); //이 값이 await 부분의 return 값으로 간다는 건가?

                    },
                    child: Text('저장하기'),
                  )
                ],
              )

            )
        )
    );
  }
}