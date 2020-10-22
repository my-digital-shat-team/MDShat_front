import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Toolbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  /// This class is the Toolbar/Appbar of MyDigitalShat.
  /// It displays icons redirecting to the corresponding pages.
  ///
  /// Cedric 01/10/2020 : i'm not sure about the `key` parameter used in the super() call. I don't think we need it.
  Toolbar({
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
          // TODO: define, design, and develop the Qui-Mange-Ou page
          // Expanded(
          //   child: IconButton(
          //       icon: new Icon(MdiIcons.silverwareForkKnife),
          //       color: Color(0xFF484847),
          //       onPressed: () {
          //         print('go to Qui-Mange-Où');
          //       }),
          // ),
          Expanded(
            child: IconButton(
                icon: new Icon(MdiIcons.cog),
                color: Color(0xFF484847),
                onPressed: () {
                  print('go to Settings');
                }),
          ),
        ],
      ),
      color: Color(0xFF2AABB7),
    );
  }
}
