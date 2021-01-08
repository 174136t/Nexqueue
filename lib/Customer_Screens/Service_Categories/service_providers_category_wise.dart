import 'package:flutter/material.dart';
import 'package:nexqueue/Animation/Fade_animation.dart';
import 'package:nexqueue/utils/size_config.dart';

class ServiceProvidersListScreen extends StatefulWidget {
  @override
  _ServiceProvidersListScreenState createState() =>
      _ServiceProvidersListScreenState();
}

class _ServiceProvidersListScreenState
    extends State<ServiceProvidersListScreen> {
  Widget _categoryThumbnail() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.015),
      alignment: FractionalOffset.centerLeft,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.height * 0.045,
        backgroundColor: Colors.deepPurple[100],
        child: CircleAvatar(
          backgroundColor: Colors.deepPurple[800],
          radius: MediaQuery.of(context).size.height * 0.04,
          backgroundImage: AssetImage('assets/images/boy.png'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FadeAnimation(
          1.2,
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios)),
                      Text(
                        'Service Provider list',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.heightMultiplier * 2.3),
                      ),
                      Container(
                        height: 1,
                        width: 1,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.widthMultiplier * 2),
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Stack(
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier*1.2),
                                child: Container(
                                  height: SizeConfig.heightMultiplier * 10,
                                  // width: width*0.95,
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.widthMultiplier * 10),
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[100],
                                      borderRadius: BorderRadius.circular(10)),
                                  // width: size.width * 0.85,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: SizeConfig.widthMultiplier * 10),
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: SizeConfig.widthMultiplier*50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      SizeConfig.widthMultiplier *
                                                          50,
                                                  child: Text(
                                                      'Service Provider name',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: SizeConfig
                                                                  .widthMultiplier *
                                                              4,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black)),
                                                ),
                                                IntrinsicHeight(
                                                                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.collections_bookmark,
                                                        color:
                                                            Colors.green[800],
                                                        size: SizeConfig
                                                                .heightMultiplier *
                                                            2,
                                                      ),
                                                      Text(
                                                        ' Active',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                                FontWeight.w800),
                                                      ),
                                                      VerticalDivider(color: Colors.black,),
                                                        Icon(
                                                        Icons.place,
                                                        color:
                                                            Colors.red[800],
                                                        size: SizeConfig
                                                                .heightMultiplier *
                                                            2,
                                                      ),
                                                        Expanded(
                                                                                                                  child: Text(
                                                          ' Place',
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                                  FontWeight.w800),
                                                      ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width:
                                                SizeConfig.widthMultiplier * 20,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: SizeConfig
                                                          .heightMultiplier *
                                                      4,
                                                  decoration: BoxDecoration(
                                                      color: Colors
                                                          .deepPurple[200],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        SizeConfig
                                                                .heightMultiplier *
                                                            0.5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons.directions_walk,
                                                          color: Colors
                                                              .deepPurple[800],
                                                          size: SizeConfig
                                                                  .heightMultiplier *
                                                              1.8,
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            '15',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                        .deepPurple[
                                                                    800],
                                                                fontSize: SizeConfig
                                                                        .heightMultiplier *
                                                                    1.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        // Text(
                                                        //   '15',
                                                        //   style: TextStyle(
                                                        //       color: Colors
                                                        //           .deepPurple[800],
                                                        //       fontSize: SizeConfig
                                                        //               .heightMultiplier *
                                                        //           2,
                                                        //       fontWeight:
                                                        //           FontWeight
                                                        //               .bold),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: SizeConfig
                                                              .widthMultiplier *
                                                          1),
                                                  child: Container(
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        4,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Colors.orange[800]),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Icon(Icons.check_circle,
                                                            color:
                                                                Colors.white),
                                                        Text(
                                                          'Join',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: SizeConfig
                                                                      .heightMultiplier *
                                                                  1.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              _categoryThumbnail()
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
