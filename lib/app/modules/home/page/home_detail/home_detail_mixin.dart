import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/modules/home/common/nasa_summary.dart';
import 'package:nasa_picture_info/app/modules/home/common/separator.dart';
import 'package:nasa_picture_info/app/shared/models/nasa.dart';
import 'package:nasa_picture_info/app/shared/util/text_style.dart';

mixin HomeDetailMixin {
  Container getBackground(Nasa nasa) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: nasa.hdurl != null
            ? nasa.hdurl
            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcThnDUAcSijcalzrwFLDHFAWcj2Mn_Rzb_KcK53qRPc2tQRZJ9s',
        placeholder: (context, url) =>
            Image(image: new AssetImage("assets/img/load1.gif")),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 295.0),
    );
  }

  Container getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container getContent(Nasa nasa) {
    final _overviewTitle = "Overview".toUpperCase();
    return Container(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          NasaSummary(
            nasa,
            0,
            horizontal: false,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _overviewTitle,
                  style: Style.headerTextStyle,
                ),
                Separator(),
                Text(nasa.explanation, style: Style.commonTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );
  }
}
