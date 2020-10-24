import 'package:flutter/material.dart';

class TabContainerBottom extends StatelessWidget {
  final int tabIndex;
  final ValueChanged<int> onTap;

  const TabContainerBottom({
    this.tabIndex = 0,
    this.onTap,
  });

  get selectedItemColor {
    switch (tabIndex) {
      case 0:
        return Colors.pink[400];
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: selectedItemColor,
      unselectedItemColor: Colors.grey[400],
      backgroundColor: Colors.white,
      currentIndex: tabIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: 'チャット',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'プロフィール',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '設定',
        ),
      ],
    );
  }
}
