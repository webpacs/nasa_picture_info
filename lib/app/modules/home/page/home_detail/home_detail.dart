import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/shared/models/nasa.dart';

import 'home_detail_mixin.dart';

class HomeDetail extends StatelessWidget with HomeDetailMixin {
  final Nasa nasa;

  HomeDetail(this.nasa);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
         child: Stack(
          children: <Widget>[
            getBackground(nasa, context),
            getGradient(),
            getContent(nasa),
            getToolbar(context),
          ],
        ),
      ),
    );
  }
}
