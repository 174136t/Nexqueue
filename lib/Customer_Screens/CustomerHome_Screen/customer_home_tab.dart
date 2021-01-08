import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexqueue/Animation/Fade_animation.dart';
import 'package:nexqueue/Customer_Screens/CustomerHome_Screen/configuration1.dart';
import 'package:nexqueue/Customer_Screens/CustomerHome_Screen/detail_screen1.dart';
import 'package:nexqueue/Customer_Screens/Service_Categories/service_providers_category_wise.dart';
import 'package:nexqueue/utils/size_config.dart';

class CustomerHomeTab extends StatefulWidget {
  @override
  _CustomerHomeTabState createState() => _CustomerHomeTabState();
}

class _CustomerHomeTabState extends State<CustomerHomeTab> {
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
              height: SizeConfig.heightMultiplier * 100,
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
                                      icon:
                                          Icon(Icons.menu, color: Colors.white),
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
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          margin: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.search),
                              Text('Search for Service...'),
                              Icon(Icons.stacked_bar_chart)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 5),
                    child: Text('Discover Our Services',
                        style: GoogleFonts.varelaRound(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Container(
                    height: SizeConfig.heightMultiplier * 12,
                    // color: Colors.red,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                             isDrawerOpen
                          ? setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            })
                          : 
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ServiceProvidersListScreen()));
                          },
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.widthMultiplier * 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(
                                        SizeConfig.heightMultiplier * 1.2),
                                    // margin: EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: shadowList,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.asset(
                                      categories[index]['iconPath'],
                                      height: SizeConfig.heightMultiplier * 6,
                                      width: SizeConfig.heightMultiplier * 6,
                                      filterQuality: FilterQuality.high,
                                      // color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.heightMultiplier * 0.5,
                                  ),
                                  Text(
                                    categories[index]['name'],
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                    SizedBox(
                    height: SizeConfig.heightMultiplier * 1,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*20),
                    child: Divider(color: Colors.black,thickness: 2,),
                  ),
                    Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 5),
                    child: Text('My Queues',
                        style: GoogleFonts.varelaRound(
                            fontWeight: FontWeight.bold, fontSize: 17)),
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
                                  builder: (context) => DetailScreen2()));
                    },
                    child: Container(
                      // color: Colors.red,
                      height: SizeConfig.heightMultiplier * 20,
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
                                      top: SizeConfig.heightMultiplier * 5),
                                ),
                                Align(
                                  child: Hero(
                                      tag: 1,
                                      child: Image.asset(
                                        'assets/images/man.png',
                                        height:
                                            SizeConfig.heightMultiplier * 20,
                                        fit: BoxFit.fill,
                                      )),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.heightMultiplier * 7,
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
                                    Icon(Icons.account_circle),
                                    Expanded(child: Text('Your number: 05'))
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
                  // Container(
                  //   height: SizeConfig.heightMultiplier * 20,
                  //   margin: EdgeInsets.symmetric(
                  //       horizontal: SizeConfig.widthMultiplier * 5),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Stack(
                  //           children: [
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                 color: Colors.blueGrey[300],
                  //                 borderRadius: BorderRadius.circular(20),
                  //                 boxShadow: shadowList,
                  //               ),
                  //               margin: EdgeInsets.only(
                  //                   top: SizeConfig.heightMultiplier * 5),
                  //             ),
                  //             Align(
                  //               child: Image.asset(
                  //                 'assets/images/owner1.png',
                  //                 height: SizeConfig.heightMultiplier * 20,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Expanded(
                  //           child: Container(
                  //         margin: EdgeInsets.only(
                  //             top: SizeConfig.heightMultiplier * 7,
                  //             bottom: SizeConfig.heightMultiplier * 2),
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             boxShadow: shadowList,
                  //             borderRadius: BorderRadius.only(
                  //                 topRight: Radius.circular(20),
                  //                 bottomRight: Radius.circular(20))),
                  //       ))
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 50,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
