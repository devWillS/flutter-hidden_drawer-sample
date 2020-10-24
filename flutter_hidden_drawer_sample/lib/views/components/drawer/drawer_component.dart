import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer_sample/models/home/menu_enum.dart';

class DrawerComponent extends StatelessWidget {
  final ValueChanged<MenuItem> onSelectMenu;

  const DrawerComponent({Key key, this.onSelectMenu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('チャット'),
              onTap: () {
                onSelectMenu(MenuItem.chat);
              },
            ),
            ListTile(
              title: Text('プロフィール'),
              onTap: () {
                onSelectMenu(MenuItem.profile);
              },
            ),
            ListTile(
              title: Text('設定'),
              onTap: () {
                onSelectMenu(MenuItem.setting);
              },
            ),
          ],
        ),
      ),
    );
  }
}
