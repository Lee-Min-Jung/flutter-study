import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubDetail();
}

class _SubDetail extends State<SubDetail> {
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.add('당근 사오기');
    todoList.add('약 사오기');
    todoList.add('청소하기');
    todoList.add('부모님께 전화하기');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Detail Example'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell( //InkWell 위젯은 탭, 더블탭, 롱탭 등 다양한 터치 이벤트를 처리할 수 있다
              child: Text(
                todoList[index],
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/third', arguments: todoList[index]); //third 페이지로 이동하면서 arguments에는 어떤 데이터를 지정해서 그 페이지로 넘긴다
              }
            ),
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNavigation(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNavigation(BuildContext context) async { //데이터를 받은 다음 처리해야 하니 비동기로 작성
    final result = await Navigator.of(context).pushNamed('/second'); //await 뒤에 적힌 함수가 끝날 때까지 기다리고 반환값을 todolist에 추가
    setState(() {
      todoList.add(result.toString());
    });
  }
}