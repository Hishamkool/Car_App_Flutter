import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dependencies/carousalSliderIndicator.dart';
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
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List carsImages = [
      'assets/images/cars/Dodge Challenger SRT Hellcat 2015.png',
      'assets/images/cars/Dodge_Challenger_Chrysler_2017.png',
      'assets/images/cars/Mercedes-Benz SLS AMG.png',
      'assets/images/cars/red Mercedes-Benz sedan.png',
      'assets/images/cars/silver Dodge Challenger coupe.png',
    ];
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
            // child: CarouselSlider(
            //   items: [
            //
            //   ],
            //   options: CarouselOptions(
            //       autoPlay: true,
            //       enlargeCenterPage: true,
            //       aspectRatio: 2.0,
            //       onPageChanged: (index, reason) {
            //         setState(() {
            //           _current = index;
            //         });
            //       }),
            // ),
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
                      onPressed: () {},
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOP DEALS',
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
          //  how should i add a vertical scrollview here ? im not able to add a list.builder inside a listView
          //  Container(
          //    height: 100,
          //    child: SingleChildScrollView(
          //      scrollDirection: Axis.horizontal,
          //      child: ListView.builder(itemCount: 3,
          //        //inner listview.builder
          //        itemBuilder: (context, index) {
          //        return carCard();
          //      },),
          //    ),
          //  )

          //_____ParentContainer for Car Cards below top deals
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          //   child: Row(
          //     children: [
          //       ListView.builder(
          //         itemCount: 4,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //             width: 150,
          //             padding:
          //                 EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Colors.white,
          //             ),
          //             child: Column(
          //               children: [
          //                 //_____Weekly Button
          //                 Align(
          //                   alignment: Alignment.topRight,
          //                   child: TextButton(
          //                     onPressed: () {},
          //                     child: Container(
          //                       padding: EdgeInsets.all(4.0),
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                         color: Colors.grey[300],
          //                       ),
          //                       child: Text(
          //                         'Weekly',
          //                         style: TextStyle(fontSize: 12),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 //_____CarImage
          //                 // Container(
          //                 //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          //                 //     child: Image.asset(carsImages[index])),
          //               ],
          //             ),
          //           );
          //         },
          //       )
          //     ],
          //   ),
          // ),

        ],
      ),
      
      
    );
  }
}
