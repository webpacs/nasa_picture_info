import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/Theme.dart' as Theme;
import 'package:nasa_picture_info/app/shared/models/Planet.dart';

class PlanetDetailBody extends StatelessWidget {
  final Planet planet;

  PlanetDetailBody(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      new Container(
        color: Theme.Colors.planetPageBackground,
        child: new Center(
          child: new Hero(
            tag: 'planet-icon-${planet.id}',
            child: new Image(
              image: new AssetImage(planet.image),
              height: Theme.Dimens.planetHeight,
              width: Theme.Dimens.planetWidth,
            ),
          ),
        ),
      ),
    ]);
  }
}