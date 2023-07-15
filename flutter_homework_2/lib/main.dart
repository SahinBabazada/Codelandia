// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              iconSize: 28,
              onPressed: () => {},
              icon: const FaIcon(FontAwesomeIcons.globe),
              color: Colors.black,
            ),
            actions: [
              IconButton(
                iconSize: 28,
                onPressed: () => {},
                icon: const FaIcon(FontAwesomeIcons.instagram),
                color: Colors.black,
              ),
              IconButton(
                iconSize: 28,
                onPressed: () => {},
                icon: const FaIcon(FontAwesomeIcons.bars),
                color: Colors.black,
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Toğrul Ağayev",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 22.0,
                            )),
                        Row(
                          children: [
                            Text(
                              'togrullagayev',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.all(
                                6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Color(0xfff5f5f5),
                              ),
                              child: Center(
                                child: Text('threads.net',
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffc0c0c0))),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://hips.hearstapps.com/hmg-prod/images/darth-vader-hayden-christensen-obi-wan-kenobi-1656074706.jpg?crop=0.414xw:0.984xh;0.252xw,0.0155xh&resize=1200:*'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 8),
                child: Text(
                  '"Its only after we have lost everything that we are free to do anything."',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 16,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            child: CircleAvatar(
                              radius: 8.0,
                              backgroundImage: NetworkImage(
                                  'https://media.vanityfair.com/photos/5d56eac902bf930008778de7/1:1/w_1270,h_1270,c_limit/obi-wan-ewan-series.jpg'),
                            ),
                          ),
                          Positioned(
                            left: 8,
                            child: CircleAvatar(
                              radius: 8.0,
                              backgroundImage: NetworkImage(
                                  'https://images.rtl.fr/~c/770v513/rtl/www/1267428-yoda-dans-l-empire-contre-attaque.jpg'),
                            ),
                          ),
                          Center(
                            child: Text(
                              '9 followers',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFd0d0d0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Color(0xFFD1CDCD),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: Size(160.0, 30.0),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Color(0xFFD1CDCD),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: Size(160.0, 30.0),
                      ),
                      child: Text(
                        'Share Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                      child: Text(
                    "Threads",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                  Tab(
                      child: Text(
                    "Replies",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 70.0, top: 40.0),
                      child: Text(
                        'You haven\'t posted any threads yet',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 70.0, top: 40.0),
                        child: Text(
                          'You haven\'t replied to any threads yet',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[500],
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.home,
                    color: Colors.black,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                icon: FaIcon(
                  // ignore: deprecated_member_use
                  FontAwesomeIcons.search,
                  color: Colors.black,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                  icon: FaIcon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.edit,
                    color: Colors.black,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.heart,
                    color: Colors.black,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.user,
                    color: Colors.black,
                  ),
                  label: ""),
            ],
          ),
        ),
      ),
    );
  }
}
