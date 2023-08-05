import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'HomePage.dart';
import 'dependencies/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: CarProductPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class CarProductPage extends StatefulWidget {
  @override
  State<CarProductPage> createState() => _CarProductPageState();
}

class _CarProductPageState extends State<CarProductPage> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var _MdQuerry = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(10),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              // boxShadow: [BoxShadow( color: Colors.black,blurRadius: 2),],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2)),
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CarBuyHometest(),));
            },
            splashColor: Colors.white,
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Row(
            //items_appBar
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    splashColor: Colors.white,
                    icon: Icon(
                      LineIcons.umbrella,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    splashColor: Colors.white,
                    icon: Icon(
                      Icons.ios_share_outlined,
                      color: Colors.black,
                    ),
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
            height: 550,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              children: [
                //__Carousal Slider
                Expanded(
                  flex: 4,
                  child: Container(
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
                  //corosal slider
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

                //__Emi
                Expanded(
                  flex: 2,
                  //___EMI containers
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          width: _MdQuerry.width / 3.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("12 Month"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "4.35jt",
                                style: TextStyle(fontSize: 22),
                              ),
                              Text("IDR")
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          width: _MdQuerry.width / 3.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("12 Month"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "4.35jt",
                                style: TextStyle(fontSize: 22),
                              ),
                              Text("IDR")
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          width: _MdQuerry.width / 3.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("12 Month"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "4.35jt",
                                style: TextStyle(fontSize: 22),
                              ),
                              Text("IDR")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //__Specification
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              children: [
                Text(
                  'SPECIFICATIONS',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ],
            ),
          ),
          //___Specification Containers
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  width: _MdQuerry.width / 3.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Color"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "White",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  width: _MdQuerry.width / 3.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("GearBox"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Automatic",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  width: _MdQuerry.width / 3.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Seats"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //__Select This Car container
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(18.0),
            width: _MdQuerry.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '12 Month',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'IDR 4.35jt',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'per month',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ))
                      ],
                    ))
                  ],
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Select this Car'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
