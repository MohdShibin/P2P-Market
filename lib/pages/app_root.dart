import 'package:flutter/material.dart';


class AppRoot extends StatefulWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _selectedIndex = 0;
  final tabs = [
    Text("Home"),
    Text("Sell"),
    Text("Account"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AppName'),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          ],
          centerTitle: true,
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
          elevation: 0.0,
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: getCustomNavigationBar(),
        body: tabs[_selectedIndex],
      ),
    );
  }

  Widget getCustomNavigationBar() {
    List<IconData> activeIcons = [
      Icons.home,
      Icons.sell,
      Icons.person,
    ];
    return Row(
      children: List.generate(
        activeIcons.length,
            (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width / 3,
              decoration: index == _selectedIndex
                  ? const BoxDecoration(
                border:  Border(
                  bottom: BorderSide(width: 4, color: Colors.green),
                ),
                color: Colors.white,
              )
                  : const BoxDecoration(
                color: Colors.white,
              ),
              child: Icon(
                activeIcons[index],
                color: index == _selectedIndex ? Colors.green : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
