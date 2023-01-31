import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:geres_park/data.dart';
import 'package:geres_park/place_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gêres Park',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double opacityHeader = 0.0;
  double opacitySearch = 0.0;
  double opacityCategory = 0.0;
  double opacityItems = 0.0;
  double opacityBottom = 0.0;

  @override
  void initState() {
    handleShowOpacity();
    super.initState();
  }

  void handleShowOpacity() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        opacityHeader = 1.0;
      });
    });
    Future.delayed(const Duration(milliseconds: 1400), () {
      setState(() {
        opacitySearch = 1.0;
      });
    });
    Future.delayed(const Duration(milliseconds: 1800), () {
      setState(() {
        opacityCategory = 1.0;
      });
    });
    Future.delayed(const Duration(milliseconds: 2200), () {
      setState(() {
        opacityItems = 1.0;
      });
    });
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        opacityBottom = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(elevation: 0, toolbarHeight: 0, backgroundColor: Colors.white),
      body: Container(
        color: Colors.white,
        child: _body(context),
      ),
      bottomNavigationBar: _bottomNavigation(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: opacityHeader,
                child: _bodyHeader(context)),
            const SizedBox(
              height: 16.0,
            ),
            AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: opacitySearch,
                child: _bodySearch(context)),
            const SizedBox(
              height: 16.0,
            ),
            AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: opacityCategory,
                child: _bodyCategories(context)),
            const SizedBox(
              height: 16.0,
            ),
            AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: opacityItems,
                child: _carouselItems(context))
          ],
        ),
      ),
    );
  }

  Widget _bodyHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Você está aqui,",
                style: GoogleFonts.notoSans(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Text(
                    "Porto, Portugal",
                    style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 21.0,
                        fontWeight: FontWeight.w700),
                  ),
                  const Icon(Icons.arrow_drop_down_rounded)
                ],
              ),
            ],
          ),
          SizedBox(
            width: 44.0,
            height: 44.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(44.0), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(48), // Image radius
                child: Image.network(
                    gaplessPlayback: true,
                    'https://i.ibb.co/LJ0Pyrx/327145868-870740227561868-599821732326491906-n.jpg',
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodySearch(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 44.0,
              width: widthDevice - 104.0,
              child: TextFormField(
                style: GoogleFonts.notoSans(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    hintText: "Buscar por local ou cidade",
                    hintStyle: GoogleFonts.notoSans(
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500),
                    contentPadding:
                        const EdgeInsets.only(left: 16.0, right: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                          width: 1, color: Colors.grey), //<-- SEE HERE
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey.withOpacity(0.6)), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(
                          width: 2, color: Color(0xFF0072DC)), //<-- SEE HERE
                    )),
              )),
          Container(
            width: 44.0,
            height: 44.0,
            decoration: BoxDecoration(
                color: const Color(0xFF0072DC),
                borderRadius: BorderRadius.circular(8.0)),
            child: const Center(
                child: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                FeatherIcons.sliders,
                color: Colors.white,
                size: 20.0,
              ),
            )),
          )
        ],
      ),
    );
  }

  Widget _bodyCategories(BuildContext context) {
    TextStyle styleListItem = GoogleFonts.notoSans(
        color: Colors.grey, fontSize: 13.0, fontWeight: FontWeight.w700);
    TextStyle styleListItemFocus = GoogleFonts.notoSans(
        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w700);

    return SizedBox(
      height: 44.0,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        const SizedBox(
          width: 20.0,
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0),
          child: Text(
            "Melhores locais",
            style: styleListItemFocus,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0),
          child: Text(
            "Mais populares",
            style: styleListItem,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0),
          child: Text(
            "Por perto",
            style: styleListItem,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0),
          child: Text(
            "Novos locais",
            style: styleListItem,
          ),
        ),
      ]),
    );
  }

  Widget _carouselItems(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: CarouselSlider(
        options: CarouselOptions(
          height: widthDevice + 100.0,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          viewportFraction: 0.9,
          enableInfiniteScroll: false,
          scrollPhysics: const PageScrollPhysics(),
        ),
        items: data.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return _listItems(context, i);
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _listItems(BuildContext context, PlaceModel item) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: widthDevice - 20.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                item.image ?? '',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Row(
              children: [
                Container(
                  height: 30.0,
                  margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                  padding: const EdgeInsets.only(right: 14.0, left: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 22.0,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(item.rate.toString(),
                            style: GoogleFonts.notoSans(
                                color: const Color(0xFF0072DC),
                                fontSize: 15.0,
                                height: 1.0,
                                fontWeight: FontWeight.w700))
                      ]),
                )
              ],
            )
          ]),
        ),
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: widthDevice * 0.6,
                    child: Flexible(
                      child: Text(
                        item.name ?? '',
                        style: GoogleFonts.notoSans(
                            fontSize: 21.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.bed,
                            color: Colors.grey,
                            size: 22.0,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            "${item.bedroom} ${item.bedroom == 1 ? 'quarto' : 'quartos'}",
                            style: GoogleFonts.notoSans(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.aspect_ratio,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            "${item.areaUsed} metros",
                            style: GoogleFonts.notoSans(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "€ ${item.price}",
                    style: GoogleFonts.notoSans(
                        fontSize: 22.0,
                        color: const Color(0xFF0072DC),
                        fontWeight: FontWeight.bold),
                  ),
                  Text("por noite",
                      style: GoogleFonts.notoSans(
                          fontSize: 15.0, color: Colors.grey))
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _bottomNavigation(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return AnimatedOpacity(
      opacity: opacityBottom,
      duration: const Duration(milliseconds: 400),
      child: Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.only(
              top: 0.0,
              right: 20.0,
              bottom: bottomPadding == 0.0 ? 20.0 : 0.0 + bottomPadding,
              left: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 10.0),
          width: widthDevice - 40,
          decoration: BoxDecoration(
              color: const Color(0xFF0072DC),
              borderRadius: BorderRadius.circular(20.0)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Icon(FeatherIcons.home, color: Colors.white),
            Icon(FeatherIcons.heart, color: Colors.white.withOpacity(0.6)),
            Icon(FeatherIcons.messageCircle,
                color: Colors.white.withOpacity(0.6)),
            Icon(FeatherIcons.settings, color: Colors.white.withOpacity(0.6))
          ]),
        ),
      ),
    );
  }
}
