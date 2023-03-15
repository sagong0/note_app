import 'package:flutter/material.dart';
import 'package:notes_app/ui/common/const/colors.dart';

class DefaultLayOut extends StatelessWidget {
  final String? title;
  final Widget child;
  FloatingActionButton? floatingActionButton;
  List<Widget>? actions;

  DefaultLayOut({
    this.title,
    required this.child,
    this.floatingActionButton,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    }
    return AppBar(
      backgroundColor: darkGray,
      actions: actions,
      elevation: 0,
      title: Text(
        title!,
        style: TextStyle(fontSize: 30.0),
      ),
      // actions: actions,
    );
  }
}
