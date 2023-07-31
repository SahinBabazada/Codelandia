// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../widgets/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<int> indexList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return Scaffold(
      backgroundColor: Color(0xFFF1e1f24),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_scrollPosition <= 80 ? 60 : 90),
        child: AnimatedCrossFade(
          crossFadeState: _scrollPosition <= 80
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 380),
          firstChild: AppBarFirst(),
          secondChild: AppBarSecond(),
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 20,
        itemBuilder: (context, index) {
          debugPrint(index.toString());
          return containerMethod(Colors.lightBlue, indexList[index]);
        },
      ),
    );
  }

  AppBar AppBarFirst() {
    return AppBar(
      backgroundColor: Color(0xFFF1e1f24),
      title: const Text(
        "Your current location >",
        style: TextStyle(color: Color.fromRGBO(0, 157, 224, 1), fontSize: 13),
      ),
      leading: IconButton(
        icon: const Icon(FeatherIcons.navigation, color: Color(0xFFF03a4c8)),
        style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Color.fromRGBO(5, 7, 7, 0.6))),
        onPressed: () {},
      ),
    );
  }

  AppBar AppBarSecond() {
    List<String> menuLabel = ["Restaurants", "Groceries", "Alcohol", "Flowers", "General Stores", "Health & Beauty", "Pet Supply", "Pharmacies", "Wolt+"];

    return AppBar(
      backgroundColor: Color(0xFFF1e1f24),
      title: RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: '\t\t\t\t\t\t\t\t Discovery\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
                text: "Your current location >",
                style: TextStyle(
                    color: Color.fromRGBO(0, 157, 224, 1), fontSize: 13)),
          ],
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: SizedBox(
          width: 600,
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                child: OutlinedButton(
                  onPressed: () => {},
                  style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(1),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFF1e1f24)),
                  ),
                  child: Text(
                    menuLabel[index],
                    style: TextStyle(color: Color(0xffffefefe), fontSize: 12),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Container carousel() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: Colors.black),
      child: CarouselSliderWidget(),
    );
  }

  Widget containerMethod(Color color, int value) {
    Widget result;

    switch (value) {
      case 0:
        result = categories();
        break;
      case 1:
        result = carousel();
        break;
      case 2:
        result = scrollContainer("0 AZN delivery fee with Wolt+");
        break;
      case 3:
        result = brandContainer("Popular Brands");
        break;
      default:
        result = Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: 377,
            decoration: BoxDecoration(
              color: color,
            ),
            child: Center(
              child: Text(
                '$value',
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ),
        );
    }
    return result;
  }

  Container scrollContainer(String name) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 16.0, bottom: 4.0),
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () => {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            side: BorderSide(
                                color: Color.fromRGBO(0, 157, 224, 0.08)))),
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromRGBO(0, 157, 224, 0.08))),
                child: const Text(
                  "see all",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 157, 224, 1), fontSize: 13),
                ))
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: Container(
                      color: Color(0xFFF22222e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://imageproxy.wolt.com/venue/5e8cb531fd92cd14d2a1f8c4/15dc2636-2c54-11ee-8cd3-b2bb2ca381db_harbour_cashabck.png?w=960",
                            fit: BoxFit.cover,
                            height: 130,
                            width: 280,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8, top: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lucky sushi",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Hot pizza, panini and snacks!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 280,
                            height: 1.0,
                            child: Center(
                              child: Container(
                                margin: EdgeInsetsDirectional.only(
                                    start: 1.0, end: 1.0),
                                height: 1.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 4.0),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      )),
                                  child: Text(
                                    ' w+ ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                                Text(
                                  ' ₼0,00 ',
                                  style: TextStyle(
                                      color: Colors.lightBlue, fontSize: 11),
                                ),
                                Text(
                                  ' 25-35 min',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: Container(
                      color: Color(0xFFF22222e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://imageproxy.wolt.com/venue/5e8cb531fd92cd14d2a1f8c4/15dc2636-2c54-11ee-8cd3-b2bb2ca381db_harbour_cashabck.png?w=960",
                            fit: BoxFit.cover,
                            height: 130,
                            width: 280,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8, top: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lucky sushi",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Hot pizza, panini and snacks!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 280,
                            height: 1.0,
                            child: Center(
                              child: Container(
                                margin: EdgeInsetsDirectional.only(
                                    start: 1.0, end: 1.0),
                                height: 1.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 4.0),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      )),
                                  child: Text(
                                    ' w+ ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                                Text(
                                  ' ₼0,00 ',
                                  style: TextStyle(
                                      color: Colors.lightBlue, fontSize: 11),
                                ),
                                Text(
                                  ' 25-35 min',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: Container(
                      color: Color(0xFFF22222e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://imageproxy.wolt.com/venue/5e8cb531fd92cd14d2a1f8c4/15dc2636-2c54-11ee-8cd3-b2bb2ca381db_harbour_cashabck.png?w=960",
                            fit: BoxFit.cover,
                            height: 130,
                            width: 280,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8, top: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lucky sushi",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Hot pizza, panini and snacks!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 280,
                            height: 1.0,
                            child: Center(
                              child: Container(
                                margin: EdgeInsetsDirectional.only(
                                    start: 1.0, end: 1.0),
                                height: 1.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 4.0),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      )),
                                  child: Text(
                                    ' w+ ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                                Text(
                                  ' ₼0,00 ',
                                  style: TextStyle(
                                      color: Colors.lightBlue, fontSize: 11),
                                ),
                                Text(
                                  ' 25-35 min',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container brandContainer(String name) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 16.0, bottom: 4.0),
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () => {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            side: BorderSide(
                                color: Color.fromRGBO(0, 157, 224, 0.08)))),
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color.fromRGBO(0, 157, 224, 0.08))),
                child: const Text(
                  "see all",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 157, 224, 1), fontSize: 13),
                ))
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: Container(
                      color: Color(0xFFF22222e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/f46b10e4-0c54-11ee-b3ee-c2d3d70cd184_77cf0414_f17e_42d6_a54e_99a0bad9cf78.png?w=600",
                            fit: BoxFit.cover,
                            height: 120,
                            width: 110,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: Text(
                              'McDonald\'s',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: Container(
                      color: Color(0xFFF22222e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/010f1f20-0c55-11ee-b549-ca1c24e9db79_14a12af5_e8d1_408d_9dc5_ba5d70754e7d.png?w=600",
                            fit: BoxFit.cover,
                            height: 120,
                            width: 110,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: Text(
                              'KFC',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: Container(
                      color: Color(0xFFF22222e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/2cd1f4c0-0c55-11ee-812f-0e1daea0831d_0cdb830e_016a_46d2_baba_0294d028aa83.png?w=600",
                            fit: BoxFit.cover,
                            height: 120,
                            width: 110,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: Text(
                              'FRYDAY',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: Container(
                      color: Color(0xFFF22222e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/49fa9e1c-0c55-11ee-8d7f-8634ba009081_aaedb2f6_aa50_40c4_8576_f85bcc16c3fe.png?w=600",
                            fit: BoxFit.cover,
                            height: 120,
                            width: 110,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: Text(
                              'BIR-IKI DONER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    child: Container(
                      color: Color(0xFFF22222e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "https://imageproxy.wolt.com/wolt-frontpage-images/content_editor/banners/images/ba96033c-44c3-11ed-ba50-1a8111df7d0b_5d492e3f_613a_4c92_ab24_ac9bb0a4500d.png?w=600",
                            fit: BoxFit.cover,
                            height: 120,
                            width: 110,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13),
                            child: Text(
                              'Shaurma №1',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding categories() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(40, 15),
              topRight: Radius.elliptical(40, 15),
            ),
            color: Colors.black),
        child: Transform.translate(
          offset: Offset(0, -40),
          child: Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // physics: const BouncingScrollPhysics(),
              // reverse: true,
              // padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  circleContainer(
                      "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                      "Restaurants"),
                  circleContainer(
                      "https://img.freepik.com/premium-vector/food-store-basket-composition_1284-71713.jpg?w=2000",
                      "Groceries"),
                  circleContainer(
                      "https://previews.123rf.com/images/bsd555/bsd5551703/bsd555170300236/74630470-alcohol-drinks-color-icon-wine-bottle-glass-and-foamy-beer-mug-bar-or-pub-sign-isolated-vector.jpg",
                      "Alcohol"),
                  circleContainer(
                      "https://cdn.pixabay.com/photo/2018/03/04/08/58/flower-3197493_1280.png",
                      "Flowers"),
                  circleContainer(
                      "https://cdn3.vectorstock.com/i/1000x1000/35/22/supermarket-grocery-store-icon-isolated-on-white-vector-32003522.jpg",
                      "General Stores"),
                  circleContainer(
                      "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                      "Health & Beauty"),
                  circleContainer(
                      "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                      "Pet Supply"),
                  circleContainer(
                      "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                      "Pharmacies"),
                  circleContainer(
                      "https://d1nhio0ox7pgb.cloudfront.net/_img/g_collection_png/standard/512x512/hamburger.png",
                      "Wolt+"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding circleContainer(String imageUrl, String label) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(235, 209, 151, 0.3),
                      Color.fromRGBO(162, 121, 13, 0.3),
                    ],
                  )),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 26,
              )),
          const SizedBox(
            height: 6,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          )
        ]));
  }
}
