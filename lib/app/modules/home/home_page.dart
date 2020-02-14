import 'package:cached_network_image/cached_network_image.dart';
import 'package:nasa_picture_info/app/modules/home/home_controller.dart';
import 'package:nasa_picture_info/app/modules/home/home_mixin.dart';
import 'package:nasa_picture_info/app/modules/home/home_module.dart';
import 'package:nasa_picture_info/app/modules/home/page/home_detail/home_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

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
      backgroundColor: Colors.black,
      appBar: getAppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(
            builder: (_) {
              if (controller.nasaList == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: controller.refresh,
                  child: ListView.separated(
                    itemCount: controller.nasaList.length,
                    itemBuilder: (context, int index) {
                      controller.imageVerify(index);
                      var formatter = new DateFormat('MM/dd/yyyy');
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeDetail(
                                index: index,
                                nasa: controller.nasaList[index],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Hero(
                              tag: 'image$index',
                              child: controller.hasImage
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          controller.nasaList[index].hdurl,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      child: Text(
                                        "Error to load image",
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21),
                                        ),
                                      ),
                                    ),
                            ),
                            Text(
                              formatter.format(controller.nasaList[index].date),
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, int index) {
                      return SizedBox(
                        height: 30,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
