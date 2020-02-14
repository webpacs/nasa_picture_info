import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nasa_picture_info/app/shared/models/nasa.dart';

class HomeDetail extends StatefulWidget {
  final Nasa nasa;
  final int index;

  const HomeDetail({Key key, this.nasa, this.index}) : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  Nasa nasa;

  @override
  void initState() {
    nasa = widget.nasa;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var formatter = new DateFormat('MM/dd/yyyy');
    String data = formatter.format(nasa.date);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'image${widget.index}',
              child: CachedNetworkImage(
                imageUrl: nasa.hdurl,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Details",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Title: ${nasa.title}",
                    softWrap: true,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Date: $data",
                    softWrap: true,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  alignment: Alignment.centerLeft,
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(iconColor: Colors.white),
                    header: Text(
                      "Explanation",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    expanded: Text(
                      nasa.explanation,
                      softWrap: true,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    collapsed: Text(
                      nasa.explanation,
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
