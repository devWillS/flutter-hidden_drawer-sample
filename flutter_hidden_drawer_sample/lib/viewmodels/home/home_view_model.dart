import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer_sample/utils/global_keys.dart';
import 'package:flutter_hidden_drawer_sample/views/screens/chat/chat_screen.dart';
import 'package:flutter_hidden_drawer_sample/views/screens/profile/profile_screen.dart';
import 'package:flutter_hidden_drawer_sample/views/screens/settings/settings_screen.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({messageRepository, userRepository}) {
    screenList = [
      ChatScreen(),
      ProfileScreen(),
      SettingsScreen(),
    ];
  }

  List<Widget> screenList;
  List<String> titleList = [
    "チャット",
    "プロフィール",
    "設定",
  ];

  int tabIndex = 0;

  String get title => titleList[tabIndex];

  Widget get screen => screenList[tabIndex];

  GlobalKey<NavigatorState> get key => navigatorKeys[tabIndex];

  onTabChanged(int value) {
    changeTab(value);
  }

  changeTab(int value) async {
    tabIndex = value;
    notifyListeners();
  }
}
