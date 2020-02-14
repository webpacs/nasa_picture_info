import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/Theme.dart' as Theme;
import 'package:nasa_picture_info/app/modules/planet/planet_row.dart';
import 'package:nasa_picture_info/app/shared/models/planet_dao.dart';

class PlanetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Theme.Colors.planetListBackground,
        child: ListView.builder(
          itemExtent: 160.0,
          itemCount: PlanetDao.planets.length,
          itemBuilder: (_, index) => PlanetRow(PlanetDao.planets[index]),
        ),
      ),
    );
  }
}
