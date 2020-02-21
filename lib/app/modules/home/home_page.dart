import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nasa_picture_info/app/modules/home/home_controller.dart';
import 'package:nasa_picture_info/app/modules/home/home_mixin.dart';
import 'package:nasa_picture_info/app/modules/home/home_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  final HomeController controller = HomeModule.to.get();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    homeController = this.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getGradientAppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (_) {
              var nasaList = controller.nasaList;

              if (nasaList != null) {
                if (nasaList.error != null) {
                  return Center(
                      child: RaisedButton(
                          child: Text('Erro!'),
                          onPressed: () {
                            controller.getNasaPlanetaryData();
                          }));
                }
                if (nasaList.value == null)
                  return getCircularProgressIndicator(context);

                return Expanded(
                    child: RefreshIndicator(
                  onRefresh: controller.refresh,
                  child: getListView(nasaList.value),
                ));
              } else {
                return Center(child: Text('Lista Vazia!'));
              }
            }),
          ]),
    );
  }
}
