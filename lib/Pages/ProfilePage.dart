import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'BottomNavigation.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return InstaProfilePage();
  }
}

// InstaProfilePage
class InstaProfilePage extends StatefulWidget {
  @override
  _InstaProfilePageState createState() => _InstaProfilePageState();
}

class _InstaProfilePageState extends State<InstaProfilePage> {
  double get randHeight => Random().nextInt(100).toDouble();

  late List<Widget> _randomChildren;

  // Children with random heights - You can build your widgets of unknown heights here
  // I'm just passing the context in case if any widgets built here needs  access to context based data like Theme or MediaQuery
  List<Widget> _randomHeightWidgets(BuildContext context) {
    _randomChildren = List.generate(1, (index) {
      final height = randHeight.clamp(
        50.0,
        MediaQuery.of(context)
            .size
            .width, // simply using MediaQuery to demonstrate usage of context
      );
      return ProfileSection();
    });

    return _randomChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavi(
        selectedItemPosition: 4,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('verma86__'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          // allows you to build a list of elements that would be scrolled away till the body reached the top
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  _randomHeightWidgets(context),
                ),
              ),
            ];
          },
          // You tab view goes here
          body: Column(
            children: <Widget>[
              TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.teal,
                tabs: [
                  Tab(
                    icon: Icon(FontAwesomeIcons.th),
                  ),
                  Tab(
                    icon: Icon(FontAwesomeIcons.stream),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.count(
                        padding: EdgeInsets.zero,
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        children: <String>[
                          'assets/images/p2.jpg',
                          'assets/images/p2.jpg',
                          'assets/images/p2.jpg',
                          'assets/images/p2.jpg',
                          'assets/images/p2.jpg',
                          'assets/images/p2.jpg',
                          'assets/images/p2.jpg',
                          'assets/images/p2.jpg',
                          'assets/images/p3.jpg',
                          'assets/images/p5.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p3.jpg',
                          'assets/images/p5.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                        ].map((String url) {
                          return GridTile(
                              child: Image.asset(url, fit: BoxFit.cover));
                        }).toList()),
                    ListView(
                        padding: EdgeInsets.zero,
                        children: <String>[
                          'assets/images/p7.jpg',
                          'assets/images/p3.jpg',
                          'assets/images/p5.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p2.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p3.jpg',
                          'assets/images/p5.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                          'assets/images/p7.jpg',
                        ].map((String url) {
                          return GridTile(
                              child: Image.asset(url, fit: BoxFit.cover));
                        }).toList())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getItemContainer() {
    return SingleChildScrollView(
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          //childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: <String>[
            'assets/images/p7.jpg',
            'assets/images/p3.jpg',
            'assets/images/p5.jpg',
            'assets/images/p7.jpg',
            'assets/images/p7.jpg',
            'assets/images/p7.jpg',
            'assets/images/p7.jpg',
            'assets/images/p7.jpg',
            'assets/images/p3.jpg',
            'assets/images/p5.jpg',
            'assets/images/p7.jpg',
            'assets/images/p7.jpg',
            'assets/images/p7.jpg',
            'assets/images/p7.jpg',
          ].map((String url) {
            return GridTile(child: Image.asset(url, fit: BoxFit.cover));
          }).toList()),
    );
  }

  Widget ProfileSection() {
    return Container(
      color: Color(0xffE0E0E0),
      child: Column(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              child: Column(
                children: <Widget>[
                  ///Image Avatar
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/p5.jpg",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pranav Verma',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(
                    'Indore,India',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.lightBlueAccent),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              '1200',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'Post',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontFamily: ''),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '12k',
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.black87),
                            ),
                            Text(
                              'Follower',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontFamily: ''),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '33',
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.black87),
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                  fontFamily: ''),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
