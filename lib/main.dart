import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

import './styles.dart';
import './model/headphone.dart';
import 'widgets/productCard.dart';

void main() => runApp(MaterialApp(
      title: 'App',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f6fb),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Shop",
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      offset: Offset(0, 10),
                      blurRadius: 30,
                    )
                  ]),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Procurar...",
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Headphones",
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 240,
              child: ListView.builder(
                itemCount: MOCK_PRODUCTS_LIST.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = MOCK_PRODUCTS_LIST[index];
                  return ProductCard(
                    imgUrl: product.image,
                    name: product.title,
                    color: product.color,
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text("Speakers", style: speakerTitleStyle),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 6),
                                  blurRadius: 6),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.only(left: 22, top: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Rális", style: productTitleStyle),
                              SizedBox(
                                height: 4,
                              ),
                              Text("Haute red, slate blue\nMist Grey",
                                  style: speakerDescStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: -5,
                    child: Image.asset(
                      "assets/images/speaker.png",
                      fit: BoxFit.cover,
                      width: 120,
                      height: 140,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: BubbleBottomBar(
          backgroundColor: Colors.transparent,
          opacity: 1,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: changePage,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text("Home", style: bottomBarItemStyle),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.insert_invitation,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.insert_invitation,
                color: Colors.white,
              ),
              title: Text("Agenda", style: bottomBarItemStyle),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.mail_outline,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.mail_outline,
                color: Colors.white,
              ),
              title: Text("Inbox", style: bottomBarItemStyle),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.poll,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.poll,
                color: Colors.white,
              ),
              title: Text("Dash", style: bottomBarItemStyle),
            ),
          ],
        ),
      ),
    );
  }
}
