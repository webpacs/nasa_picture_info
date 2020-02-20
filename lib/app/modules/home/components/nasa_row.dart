import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/modules/home/page/home_detail/home_detail.dart';
import 'package:nasa_picture_info/app/shared/models/nasa.dart';
import 'package:nasa_picture_info/app/Theme.dart' as Theme;

class NasaRow extends StatelessWidget {
  final Nasa nasa;
  final int index;

  NasaRow(this.nasa, this.index);

  @override
  Widget build(BuildContext context) {
    final nasaThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: 'planet-icon-$index',
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: nasa.hdurl != null ? nasa.hdurl : 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcThnDUAcSijcalzrwFLDHFAWcj2Mn_Rzb_KcK53qRPc2tQRZJ9s',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            height: Theme.Dimens.planetHeight,
            width: Theme.Dimens.planetWidth,
          ),
        ),
      ),
    );

    final nasaCard = new Container(
      margin: const EdgeInsets.only(left: 72.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Theme.Colors.planetCard,
        shape: BoxShape.rectangle,
        border: Border.all(color: Theme.Colors.planetCard),
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              nasa.title,
              style: Theme.TextStyles.planetTitle,
              maxLines: 1,
            ),
            new Text('Milkyway Galaxy', style: Theme.TextStyles.planetLocation),
            new Container(
                color: const Color(0xFF00C6FF),
                width: 24.0,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0)),
            new Row(
              children: <Widget>[
                new Icon(Icons.location_on,
                    size: 14.0, color: Theme.Colors.planetDistance),
                new Text('54.6m Km', style: Theme.TextStyles.planetDistance),
                new Container(width: 24.0),
                new Icon(Icons.flight_land,
                    size: 14.0, color: Theme.Colors.planetDistance),
                new Text('3.711 m/s', style: Theme.TextStyles.planetDistance),
              ],
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HomeDetail(nasa),
            ),
          );
        },
        child: new Stack(
          children: <Widget>[
            nasaCard,
            nasaThumbnail,
          ],
        ),
      ),
    );
  }
}
