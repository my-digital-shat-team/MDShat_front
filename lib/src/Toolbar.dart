import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Toolbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  Toolbar(
    this.title, {
    Key key,
  })  : preferredSize = Size.fromHeight(100.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
                icon: new Icon(MdiIcons.home),
                color: Color(0xFF484847),
                onPressed: () {
                  print('go to Home');
                }),
          ),
          Expanded(
            child: IconButton(
                icon: new Icon(MdiIcons.silverwareForkKnife),
                color: Color(0xFF484847),
                onPressed: () {
                  print('go to Qui-Mange-Où');
                }),
          ),
          Expanded(
            child: IconButton(
                icon: new Icon(MdiIcons.cog),
                color: Color(0xFF484847),
                onPressed: () {
                  print('go  to Settings');
                }),
          ),
        ],
      ),
      color: Color(0xFF2AABB7),
    );
  }
}
