import "package:flutter/material.dart";

class myBottomBar extends StatelessWidget {
  const myBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 60,
      child: BottomAppBar(color: Colors.black38,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            )
          ],
        ),
      ),
    );
  }
}