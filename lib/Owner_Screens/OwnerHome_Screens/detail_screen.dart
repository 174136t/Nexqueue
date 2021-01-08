import 'package:flutter/material.dart';
import 'package:nexqueue/Animation/Fade_animation.dart';
import 'package:nexqueue/Owner_Screens/OwnerHome_Screens/configuration.dart';
import 'package:nexqueue/utils/size_config.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blueGrey[300],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                )
              ],
            )),
            Container(
              margin: EdgeInsets.only(top: SizeConfig.heightMultiplier * 1),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // IconButton(
                      //     icon: Icon(Icons.arrow_back_ios),
                      //     onPressed: () {
                      //       Navigator.pop(context);
                      //     }),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                      Text(
                        'My queue details',
                        style: TextStyle(
                            fontSize: SizeConfig.heightMultiplier * 2.3,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 1,
                        width: 1,
                      )
                      // IconButton(icon: Icon(Icons.share), onPressed: () {})
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child:
                    Hero(tag: 1, child: Image.asset('assets/images/man1.png')),
              ),
            ),
            FadeAnimation(
              1,
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: SizeConfig.heightMultiplier * 15,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: shadowList,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.directions_walk),
                            Expanded(
                                child: Text(
                              ' Current queue length: 15',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.heightMultiplier * 1.8),
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.whatshot),
                            Expanded(
                                child: Text(
                              ' Ongoing number: 02',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.heightMultiplier * 1.8),
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.deepPurple,
                            ),
                            Expanded(
                                child: Text(
                              ' Estimated working time: 40 min',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.heightMultiplier * 1.8),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: SizeConfig.heightMultiplier * 15,
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[800],
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[800],
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          'Invite Next',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
