import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "チャット",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: Colors.pink[200],
        child: ListView(
          children: List.generate(100, (index) {
            return Column(
              children: [
                SizedBox(
                  height: index == 0 ? 20 : 0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                          ),
                          elevation: 0,
                          color: Colors.pink[100],
                          onPressed: () {
                            Navigator.of(context, rootNavigator: false).push(
                              MaterialPageRoute(
                                builder: (BuildContext co) => ChatScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Detail ${index + 1}",
                            style: TextStyle(color: Colors.pink[300]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
