import 'package:car_app/ProductPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'dependencies/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: CarBuyHometest(),
    debugShowCheckedModeBanner: false,
  ));
}

class CarBuyHometest extends StatefulWidget {
  final CarouselController _controller = CarouselController();

  @override
  State<CarBuyHometest> createState() => _CarBuyHometestState();
}

class _CarBuyHometestState extends State<CarBuyHometest> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var _MdQuerry = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        elevation: 0,
        leading: Container(
          // Profile_image
          padding: EdgeInsets.all(3.0),
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.yellow,
              width: 2,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/profile_carjpeg.jpeg'))),
          ),
        ),
        actions: [
          Row(
            //items_appBar
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "IDR",
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    TextSpan(
                        text: '17.7jt',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 45,
                height: 45,
                child: Container(
                  // plus_button
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Handle the onPressed event here.
                    },
                    icon: Icon(Icons.add),
                    color:
                        Colors.white, // Change the color of the icon as needed
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 350,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),

            child: Column(
              //_________imageSlider
              children: [
                Expanded(
                  flex: 5,
                  child: CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          //_____textBelowlSlider
                          children: [
                            Text(
                              'SRT',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            Text('Dodge'),
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text('My Garage '),
                                Icon(Icons.arrow_right_alt_outlined)
                              ],
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
            // child: CarouselWithIndicatorDemo(),
          ),

          //_____AvailableCarsContainer
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      'Available Cars',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    // Text(''),
                    SizedBox(height: 2),
                    Text('Long term and short term',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w100)),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CarProductPage(),));
                      },
                      splashColor: Colors.white,
                      icon: Icon(
                        Icons.chevron_right,
                        size: 27,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //_____TopDeals
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOP DEALS',
                  style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CarProductPage(),));
                    },
                    child: Row(
                      //_____More
                      children: [
                        Text(
                          'More',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.blue,
                        )
                      ],
                    ))
              ],
            ),
          ),

          //_____Car Cards below top deals
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: _MdQuerry.width / 2.5,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      //_____Weekly Button
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: Text(
                              'Weekly',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      // _____CarImage
                      Image.asset(
                        'assets/images/cars/Dodge Challenger SRT Hellcat 2015.png',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SRT Hellcat',
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Dodge ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('per week')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: _MdQuerry.width / 2.5,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      //_____Weekly Button
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: Text(
                              'Monthly',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      // _____CarImage
                      Image.asset(
                        'assets/images/cars/silver Dodge Challenger coupe.png',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Challenger',
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Dodge ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('per month')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: _MdQuerry.width / 2.5,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      //_____Weekly Button
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: Text(
                              'Weekly',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      // _____CarImage
                      Image.asset(
                        'assets/images/cars/Mercedes-Benz SLS AMG.png',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SLS AMG',
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Mercedes-Benz',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('per week')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: _MdQuerry.width / 2.5,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      //_____Weekly Button
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: Text(
                              'Weekly',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      // _____CarImage
                      Image.asset(
                        'assets/images/cars/red Mercedes-Benz sedan.png',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'S-Class',
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Mercedes-Benz',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('per week')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //____TOP DEALERS
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOP DEALERS',
                  style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      //_____More
                      children: [
                        Text(
                          'More',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.blue,
                        )
                      ],
                    ))
              ],
            ),
          ),

          //____Containers below top delears
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: _MdQuerry.width / 4,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/Delears/hertz.png',
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Hertz'),
                      Text("177 offices"),
                    ],
                  ),
                ),
                Container(
                  width: _MdQuerry.width / 4,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/Delears/avis.png',
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Avis'),
                        Text("198 offices"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.notifications_active_outlined,
                  text: 'Notification',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
