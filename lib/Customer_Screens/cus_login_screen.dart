import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexqueue/Animation/Fade_animation.dart';
import 'package:nexqueue/Customer_Screens/CustomerHome_Screen/customer_home.dart';
import 'package:nexqueue/utils/size_config.dart';

class CustomerLoginScreen extends StatefulWidget {
  @override
  _CustomerLoginScreenState createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  String userType;
  // FirebaseUser user;
  String uid;

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Ne',
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: SizeConfig.heightMultiplier * 5.8,
            fontWeight: FontWeight.w900,
            color: Colors.orange[800],
          ),
          children: [
            TextSpan(
              text: 'x',
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontSize: SizeConfig.heightMultiplier * 5.8,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'Q',
              style: TextStyle(
                color: Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier * 5.8,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'ue',
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontSize: SizeConfig.heightMultiplier * 5.8,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'ue',
              style: TextStyle(
                color: Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier * 5.8,
                fontWeight: FontWeight.w900,
              ),
            ),
          ]),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2.2),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(
                fontSize: SizeConfig.heightMultiplier * 2,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => UserTypeRegisterScreen()));
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: SizeConfig.heightMultiplier * 2,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _licenseLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: 'By using our services you are agreeing to our',
                  style: TextStyle(
                      fontSize: SizeConfig.heightMultiplier * 1.8,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Terms',
                    style: GoogleFonts.varelaRound(
                      fontSize: SizeConfig.heightMultiplier * 1.8,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                    children: [
                      TextSpan(
                        text: ' and ',
                        style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontSize: SizeConfig.heightMultiplier * 1.8,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Statement',
                        style: GoogleFonts.varelaRound(
                            color: Colors.black,
                            fontSize: SizeConfig.heightMultiplier * 1.8),
                      ),
                    ]),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _emailButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => LoginPage(
        //       type: widget.type,
        //     ),
        //   ),
        // );
      },
      child: Container(
        height: SizeConfig.heightMultiplier * 6,
        margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.email_outlined,
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Sign in with email',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.heightMultiplier * 2.5,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _googleButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
        // signInWithGoogle(widget.type).whenComplete(() async {
        //   try {

        //       Firestore.instance
        //           .collection('users')
        //           .document((await FirebaseAuth.instance.currentUser()).uid)
        //           .get()
        //           .then((value) {
        //         setState(() {
        //           print(value.data['userType']);
        //           userType = value.data['userType'];
        //                 if (userType != null && userType == 'user') {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => PlacesPage(),
        //           ),
        //         );
        //       } else if (userType != null && userType == 'owner') {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => OwnerHomeScreen(),
        //           ),
        //         );
        //       }
        //         });
        //       });

        //     } catch (e) {
        //       showErrorDialog(context);
        //       print('eeeeeeeeeeeeeee$e');
        //     }
        // });
      },
      child: Container(
        height: SizeConfig.heightMultiplier * 6,
        margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/google_logo.png",
                    // height: MediaQuery.of(context).size.height * 0.35,
                    // width: double.infinity,
                    // it cover the 25% of total height
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Sign in with Google',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.heightMultiplier * 2.5,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _facebookButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CustomerHomeScreen()));
        // Authenticate auth = Authenticate();
        // auth.signInFB(widget.type).whenComplete(
        //   () async {
        //     try {

        //       Firestore.instance
        //           .collection('users')
        //           .document((await FirebaseAuth.instance.currentUser()).uid)
        //           .get()
        //           .then((value) {
        //         setState(() {
        //           print(value.data['userType']);
        //           userType = value.data['userType'];
        //                 if (userType != null && userType == 'user') {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (context) => PlacesPage(),
        //         //   ),
        //         // );
        //       } else if (userType != null && userType == 'owner') {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (context) => OwnerHomeScreen(),
        //         //   ),
        //         // );
        //       }
        //         });
        //       });

        //     } catch (e) {
        //       showErrorDialog(context);
        //       print('eeeeeeeeeeeeeee$e');
        //     }
        //   },
        // );
      },
      child: Container(
        height: SizeConfig.heightMultiplier * 6,
        margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1959a9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('f',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2872ba),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Sign in with Facebook',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.heightMultiplier * 2.5,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1.7),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Container(
        // width: SizeConfig.widthMultiplier * 90,
        child: new AlertDialog(
          // contentPadding: EdgeInsets.all(13),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          title: Center(
            child: Text(
              'Login error!',
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.red, Colors.red]),
                      borderRadius: BorderRadius.circular(5.0)),
                  width: MediaQuery.of(context).size.width * 0.90,
                  // height: SizeConfig.heightMultiplier*10,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      // side: BorderSide(color: Colors.indigo)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ok',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              // padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.keyboard_arrow_left,
                    color: Colors.deepPurple[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[50],
        body: FadeAnimation(
          1.2,
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                _backButton(),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          //  Expanded(
                          //         flex: 3,
                          //         child: SizedBox(),
                          //       ),

                          _title(),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 5,
                          ),
                          Image.asset(
                            'assets/images/loginn.png',
                            height: SizeConfig.heightMultiplier * 20,
                          ),
                          // _emailPasswordWidget(),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 1,
                          ),
                          _emailButton(),
                          _divider(),
                          _facebookButton(),
                          _googleButton(),

                          _licenseLabel(),
                          _createAccountLabel(),
                          // Expanded(
                          //   flex: 2,
                          //   child: SizedBox(),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
