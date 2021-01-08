import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexqueue/Animation/Fade_animation.dart';
import 'package:nexqueue/Customer_Screens/cus_login_screen.dart';
import 'package:nexqueue/Owner_Screens/owner_login_screen.dart';
import 'package:nexqueue/utils/size_config.dart';

class LoginMainScreen extends StatefulWidget {
  @override
  _LoginMainScreenState createState() => _LoginMainScreenState();
}

class _LoginMainScreenState extends State<LoginMainScreen> {
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Ne',
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: SizeConfig.heightMultiplier*5.8,
            fontWeight: FontWeight.w900,
            color: Colors.orange[800],
          ),
          children: [
            TextSpan(
              text: 'x',
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontSize: SizeConfig.heightMultiplier*5.8,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'Q',
              style: TextStyle(
                color: Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier*5.8,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'ue',
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontSize: SizeConfig.heightMultiplier*5.8,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'ue',
              style: TextStyle(
                color: Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier*5.8,
                fontWeight: FontWeight.w900,
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              FadeAnimation(
                1.4,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/images/que.png',
                          height: SizeConfig.heightMultiplier * 35,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.widthMultiplier * 5),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 90,
                          decoration: BoxDecoration(
                              color: Colors.orange[50],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome to,",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: SizeConfig.heightMultiplier*4.5),
                                ),
                                _title(),
                                SizedBox(
                                  height: SizeConfig.heightMultiplier * 2,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orange[200],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "The Best Queue management Solution",
                                      style: TextStyle(
                                          fontSize: SizeConfig.heightMultiplier*2,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[50],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "Join with us by selecting your user type from below options",
                                style: TextStyle(
                                    fontSize: SizeConfig.heightMultiplier*2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 1,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "If you willing to buy products or get service, then choose Customer Login",
                                    style: TextStyle(
                                        fontSize: SizeConfig.heightMultiplier*2,
                                        color: Colors.deepPurple[800],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 1,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "If you are a service provider, then choose Owner Login",
                                    style: TextStyle(
                                        fontSize: SizeConfig.heightMultiplier*2,
                                        color: Colors.orange[800],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                                SizedBox(
                        height: SizeConfig.heightMultiplier * 15,
                      ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          height: SizeConfig.heightMultiplier * 10,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerLoginScreen()));
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 10,
                  width: SizeConfig.widthMultiplier * 50,
                  color: Colors.deepPurple[800],
                  child: Center(
                      child: Text(
                    'Customer Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.heightMultiplier * 4),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OwnerLoginScreen()));
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 10,
                  width: SizeConfig.widthMultiplier * 50,
                  color: Colors.orange[800],
                  child: Center(
                      child: Text(
                    'Owner\n Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.heightMultiplier * 4),
                    textAlign: TextAlign.center,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
