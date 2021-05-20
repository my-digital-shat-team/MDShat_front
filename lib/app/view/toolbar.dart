import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_digital_shat/chat/view/chat_page.dart';

class Toolbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  Toolbar({
    Key? key,
  })  : preferredSize = Size.fromHeight(100.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
                icon: new Icon(MdiIcons.message),
                color: Color(0xFF484847),
                onPressed: () =>
                    Navigator.of(context).push<void>(ChatPage.route())),
          ),
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
    );
  }
}
