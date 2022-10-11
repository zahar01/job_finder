import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_finder/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    Text("hehe"),
    Text("mmm"),
    Text("xd"),
  ];

  int selectedItem = 0;

  void changeItem(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectedItem],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, bottom: 12),
          child: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[500],
            currentIndex: selectedItem,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Messages"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done_all_sharp), label: "Saved"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ],
            type: BottomNavigationBarType.fixed,
            onTap: changeItem,
          ),
        ),
      ),
    );
  }
}
