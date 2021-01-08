import 'dart:io';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexqueue/Animation/Fade_animation.dart';
import 'package:nexqueue/Owner_Screens/OwnerHome_Screens/configuration.dart';
import 'package:nexqueue/Owner_Screens/OwnerHome_Screens/detail_screen.dart';
import 'package:nexqueue/Owner_Screens/Pending_Requests/pernding_requests.dart';
import 'package:nexqueue/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Ne',
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: SizeConfig.heightMultiplier * 3,
            fontWeight: FontWeight.w900,
            color: isDrawerOpen ? Colors.deepPurple[800] : Colors.orange[800],
          ),
          children: [
            TextSpan(
              text: 'x',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.heightMultiplier * 3,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'Q',
              style: TextStyle(
                color:
                    isDrawerOpen ? Colors.deepPurple[800] : Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier * 3,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'ue',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.heightMultiplier * 3,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'ue',
              style: TextStyle(
                color:
                    isDrawerOpen ? Colors.deepPurple[800] : Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier * 3,
                fontWeight: FontWeight.w900,
              ),
            ),
          ]),
    );
  }
Future<bool> _onWillPop() {
    // DateTime now = DateTime.now();

    return showDialog(
      context: context,
      builder: (context) => new Theme(
        data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.grey[100],
            backgroundColor: Colors.white),
        child: AlertDialog(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit from this App?'),
          actions: <Widget>[
            new FlatButton(
              color: Colors.red[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                // side: BorderSide(color: Colors.indigo)
              ),
              onPressed: () => exit(0),
              child: new Text('Yes'),
            ),
            new FlatButton(
              color: Colors.red[400],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.indigo)
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
      isDrawerOpen
    ? setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      })
    : null;
    },
    child: AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
    color: Colors.blueGrey[50],
    borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: SingleChildScrollView(
        child: FadeAnimation(
    1.2,
    Container(
      // height: SizeConfig.heightMultiplier * 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: isDrawerOpen
                    ? Colors.orange[800]
                    : Colors.deepPurple[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isDrawerOpen ? 40 : 0),
                  bottomLeft: Radius.circular(isDrawerOpen ? 0 : 40),
                  bottomRight: Radius.circular(isDrawerOpen ? 0 : 40),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isDrawerOpen
                          ? IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  isDrawerOpen = false;
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  xOffset = 230;
                                  yOffset = 150;
                                  scaleFactor = 0.6;
                                  isDrawerOpen = true;
                                });
                              }),
                      Column(
                        children: [
                          // Text('Location'),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.location_on,
                          //       color: Colors.red,
                          //     ),
                          //     Text('Rathnapura'),
                          //   ],
                          // ),
                          _title()
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/images/boy.png',
                          filterQuality: FilterQuality.high,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
              ],
            ),
          ),

          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          //   margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(20)
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Icon(Icons.search),
          //       Text('Search pet to adopt'),
          //       Icon(Icons.settings)

          //     ],
          //   ),
          // ),

          // Container(height: 120,
          // child: ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemCount: categories.length,
          //   itemBuilder: (context,index){
          //     return Container(
          //       child: Column(
          //         children: [
          //           Container(

          //             padding: EdgeInsets.all(10),
          //             margin: EdgeInsets.only(left: 20),
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               boxShadow: shadowList,
          //               borderRadius: BorderRadius.circular(10)
          //             ),
          //             child: Image.asset(categories[index]['iconPath'],       height: 50,
          //               width: 50,color: Colors.grey[700],),
          //           ),
          //           Text(categories[index]['name'])
          //         ],
          //       ),
          //     );
          //   },

          // ),
          // ),
        SizedBox(
            height: SizeConfig.heightMultiplier * 1.5,
          ),
          Center(
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(20.0),
              child: Container(
                //  margin: EdgeInsets.all(10.0),
                child: Container(
                    height: SizeConfig.heightMultiplier * 25,
                    width: SizeConfig.widthMultiplier * 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(0.0, 1.0), //(x,y)
                        //     blurRadius: 6.0,
                        //   ),
                        // ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Carousel(
                      images: [
                        NetworkImage(
                            'https://image.freepik.com/free-vector/e-learning-vector-illustration_95561-13.jpg'),
                        NetworkImage(
                            'https://previews.123rf.com/images/yupiramos/yupiramos1805/yupiramos180516827/101532377-group-students-with-books-and-coffee-cup-learning-vector-illustration.jpg'),
                        NetworkImage(
                            'https://image.freepik.com/free-vector/e-learning-vector-illustration_95561-13.jpg'),
                        NetworkImage(
                            'https://previews.123rf.com/images/liravega258/liravega2581801/liravega258180100026/93625061-education-online-training-courses-distance-education-vector-illustration-internet-studying-online-bo.jpg'),
                      ],
                      borderRadius: true,
                      boxFit: BoxFit.fill,
                      dotBgColor: Colors.transparent,
                      dotPosition: DotPosition.bottomCenter,
                      dotColor: Colors.deepPurple,
                      dotIncreasedColor: Colors.orange,
                    )),
              ),
            ),
          ),
          // SizedBox(
          //   height: SizeConfig.heightMultiplier * 1.5,
          // ),
          GestureDetector(
            onTap: () {
              isDrawerOpen
                  ? setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    })
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Screen2()));
            },
            child: Container(
              height: SizeConfig.heightMultiplier * 30,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 5),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: shadowList,
                          ),
                          margin: EdgeInsets.only(
                              top: SizeConfig.heightMultiplier * 10),
                        ),
                        Align(
                          child: Hero(
                              tag: 1,
                              child: Image.asset(
                                'assets/images/man1.png',
                                height:
                                    SizeConfig.heightMultiplier * 40,
                              )),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.heightMultiplier * 12,
                        bottom: SizeConfig.heightMultiplier * 2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                            child: Text(
                          'Queue for Saloon',
                          style: TextStyle(
                              fontSize:
                                  SizeConfig.heightMultiplier * 1.5,
                              fontWeight: FontWeight.bold),
                        )),
                        Row(
                          children: [
                            Icon(Icons.directions_walk),
                            Expanded(child: Text('Queue length: 15'))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.whatshot),
                            Expanded(child: Text('Ongoing number: 02'))
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          GestureDetector(
             onTap: () {
              isDrawerOpen
                  ? setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    })
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PendingRequestsScreen()));
            },
                              child: Container(
              height: SizeConfig.heightMultiplier * 30,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 5),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: shadowList,
                          ),
                          margin: EdgeInsets.only(
                              top: SizeConfig.heightMultiplier * 10),
                        ),
                        Align(
                          child: Image.asset('assets/images/owner1.png'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.heightMultiplier * 12,
                        bottom: SizeConfig.heightMultiplier * 2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                            child: Text(
                          'Requests for Saloon',
                          style: TextStyle(
                              fontSize: SizeConfig.heightMultiplier * 1.5,
                              fontWeight: FontWeight.bold),
                        )),
                        // Row(
                        //   children: [
                        //     Icon(Icons.account_circle),
                        //     Expanded(child: Text('Your number: 05'))
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Icon(Icons.whatshot),
                        //     Expanded(child: Text('Ongoing number: 02'))
                        //   ],
                        // )
                        Center(
                          child: Container(
                            height: SizeConfig.heightMultiplier * 7,
                            width:  SizeConfig.heightMultiplier * 7,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  SizeConfig.heightMultiplier * 0.5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      '07',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: SizeConfig
                                                  .heightMultiplier *
                                              2.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                                                            child: Text(
                                      'Pending',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.heightMultiplier *
                                                  1.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    ),
        ),
      ),
    ),
        );
  }
}
