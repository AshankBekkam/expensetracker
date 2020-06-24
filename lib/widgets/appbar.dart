import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  const myAppBar({
    Key key, this.appBar,this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(

      child: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style:
          TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
        ),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(bottom: Radius.elliptical(70, 20))),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(80);
}