import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer_sample/models/home/menu_enum.dart';
import 'package:flutter_hidden_drawer_sample/viewmodels/home/home_view_model.dart';
import 'package:flutter_hidden_drawer_sample/views/components/drawer/drawer_component.dart';
import 'package:flutter_hidden_drawer_sample/views/screens/home/home_screen.dart';
import 'package:hidden_drawer_menu/controllers/animated_drawer_controller.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  HomeViewModel viewModel = HomeViewModel();
  SimpleHiddenDrawerController _controller;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_controller.state == MenuState.open) {
          return false;
        }
        return true;
      },
      child: SimpleHiddenDrawer(
        withShadow: false,
        menu: DrawerComponent(
          onSelectMenu: onSelectMenu,
        ),
        screenSelectedBuilder: (position, controller) {
          _controller = controller;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  controller.toggle();
                },
              ),
            ),
            body: ChangeNotifierProvider(
              create: (BuildContext context) => viewModel,
              child: HomeScreen(),
            ),
          );
        },
      ),
    );
  }

  void onSelectMenu(MenuItem menuItem) {
    switch (menuItem) {
      case MenuItem.chat:
        if (viewModel.tabIndex != 0) {
          viewModel.changeTab(0);
        }
        _controller.close();
        break;
      case MenuItem.profile:
        if (viewModel.tabIndex != 1) {
          viewModel.changeTab(1);
        }
        _controller.close();
        break;
      case MenuItem.setting:
        if (viewModel.tabIndex != 2) {
          viewModel.changeTab(2);
        }
        _controller.close();
        break;
    }
  }
}
