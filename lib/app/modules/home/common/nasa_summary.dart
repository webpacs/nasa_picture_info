import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/modules/home/common/separator.dart';
import 'package:nasa_picture_info/app/modules/home/page/home_detail/home_detail.dart';
import 'package:nasa_picture_info/app/shared/models/nasa.dart';
import 'package:nasa_picture_info/app/shared/util/text_style.dart';

class NasaSummary extends StatelessWidget {
  final Nasa nasa;
  final bool horizontal;
  final int index;

  NasaSummary(this.nasa, this.index, {this.horizontal = true});

  NasaSummary.vertical(this.nasa, this.index) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: "planet-hero-$index",
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: nasa.hdurl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            height: 92.0,
            width: 92.0,
          ),
        ),
      ),
    );

    Widget _planetValue({String value, String image}) {
      return Container(
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Image.asset(image, height: 12.0),
          Container(width: 8.0),
          Text('3.711 m/s', style: Style.smallTextStyle),
        ]),
      );
    }

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 4.0),
          Text(
            nasa.title,
            style: Style.titleTextStyle,
            maxLines: 1,
          ),
          Container(height: 10.0),
          Text('Milkyway Galaxy', style: Style.commonTextStyle),
          Separator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: '54.6m Km', image: 'assets/img/ic_distance.png')),
              Container(
                width: 32.0,
              ),
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: '3.711 m/s', image: 'assets/img/ic_gravity.png'))
            ],
          ),
        ],
      ),
    );

    final planetCard = Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin:
          horizontal ? EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => HomeDetail(nasa),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Stack(
            children: <Widget>[
              planetCard,
              planetThumbnail,
            ],
          ),
        ));
  }
}
