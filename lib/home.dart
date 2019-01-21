import 'package:flutter/material.dart';
import './fragments/artical_fragment.dart';
import './fragments/video_fragment.dart';


class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Camera", Icons.camera),

  ];

  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int index) {
    switch (index) {
      case 0:
        return new ArticalFragment();
      case 1:
        return new VideoFragment();

    }
  }

  _onSelectDrawerItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerCells = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var item = widget.drawerItems[i];
      drawerCells.add(new ListTile(

        leading: Icon(item.icon),
        title: Text(item.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectDrawerItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            new Container(
              color: Colors.green,
              child: UserAccountsDrawerHeader(
              accountName: Text('DashDroid'),

              // currentAccountPicture: Image.network('https://en.gravatar.com/userimage/62269105/d4f03cb59fdf23540406b41381556614.jpeg'),
            ),
            ),
        new Container (
          color: Colors.green[100],
          child:  Column(
              children: drawerCells,
            ),
        ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}