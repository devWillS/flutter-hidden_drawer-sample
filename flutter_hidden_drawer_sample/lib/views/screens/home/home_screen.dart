import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hidden_drawer_sample/utils/global_keys.dart';
import 'package:flutter_hidden_drawer_sample/viewmodels/home/home_view_model.dart';
import 'package:flutter_hidden_drawer_sample/views/components/home/tab_container_bottom.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab = model.key.currentState.canPop();
            if (isFirstRouteInCurrentTab) {
              return !await model.key.currentState.maybePop();
            }
            return false;
          },
          child: Scaffold(
            bottomNavigationBar: TabContainerBottom(
              tabIndex: model.tabIndex,
              onTap: model.onTabChanged,
            ),
            body: Stack(
              children: List.generate(
                model.screenList.length,
                (index) {
                  return Offstage(
                    offstage: model.tabIndex != index,
                    child: Navigator(
                      key: navigatorKeys[index],
                      onGenerateRoute: (settings) {
                        return MaterialPageRoute(
                          settings: settings,
                          builder: (context) {
                            return model.screenList[index];
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
