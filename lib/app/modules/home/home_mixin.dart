import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:nasa_picture_info/app/modules/home/components/nasa_row.dart';
import 'package:nasa_picture_info/app/modules/home/home_controller.dart';
import 'package:nasa_picture_info/app/shared/models/nasa.dart';
import 'package:nasa_picture_info/app/Theme.dart' as Theme;

mixin HomeMixin {
  HomeController homeController;

  GradientAppBar getGradientAppBar() {
    return GradientAppBar(
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          Expanded(
            child: Center(
              child: Text(
                'treva',
                style: Theme.TextStyles.appBarTitle,
              ),
            ),
          )
        ],
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      gradient: LinearGradient(
        colors: [
          Theme.Colors.appBarGradientStart,
          Theme.Colors.appBarGradientEnd
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        )
      ],
    );
  }

  Container getListView(List<Nasa> nasaList) {
    return Container(
      color: Theme.Colors.planetListBackground,
      child: ListView.builder(
        itemExtent: 160.0,
        itemCount: nasaList.length,
        itemBuilder: (_, index) => NasaRow(nasaList[index], index),
      ),
    );
  }

  Expanded getCircularProgressIndicator(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.Colors.planetListBackground,
        child: Center(
            child: ClipOval(
                child: Image.asset(
          "assets/img/load1.gif",
          height: Theme.Dimens.planetHeight,
          width: Theme.Dimens.planetWidth,
          fit: BoxFit.fitHeight,
        ))),
      ),
    );
  }
}
