import 'package:flutter/material.dart';
import 'list_task.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  int navbarindex = 0;

  addTasks(String input) {
    tasksList.tasks.add(input);
    print(tasksList.tasks);
    setState(() {});
  }

  addChecks() {
    tasksList.check.add(false);
    print(tasksList.check);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
      Center(
        child: ListView.builder(
            itemCount: tasksList.tasks.length,
            itemBuilder: (context, i) => Tasks(
              index: i,
            )
        ),
      ),
      Center(
        child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              icon: Icon(
                Icons.input,
                color: Colors.white,
              ),
              hintText: 'Add Tasks',
            ),
            onSubmitted:(input) {
              addTasks(input);
              addChecks();
            }
        ),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: bodyWidgets[navbarindex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orangeAccent,
          iconSize: 30.0,
          onTap: (index) {
            setState(() {
              navbarindex = index;
            });
          },
          selectedItemColor: Colors.white,
          currentIndex: navbarindex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.file_download_done),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Tasks',
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text(
            "To-Do-List",
            style: TextStyle(fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}


class Tasks extends StatelessWidget {
  final int index;
  bool value = false;

  Tasks({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Box(),
          Text(
            tasksList.tasks[index],
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

class Box extends StatefulWidget{
  @override
  checkBox createState(){
    return checkBox();
  }

}

class checkBox extends State<Box>{
  bool value=false;
  int ind=0;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (value) {
        setState(() {
          tasksList.check[ind]=value;
          this.value=tasksList.check[ind];
        });
      },
      checkColor: Colors.black,
      activeColor: Colors.white,
    );
  }
}