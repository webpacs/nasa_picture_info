import 'package:flutter/material.dart';
import 'package:nasa_picture_info/app/modules/home/home_controller.dart';

mixin HomeMixin {
  HomeController homeController;

  Widget getAppBarWidget() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 0,
      title: Text("NASA's Astronomy Picture of the Day"),
    );
  }
}
