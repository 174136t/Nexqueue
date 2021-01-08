import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nexqueue/Customer_Screens/CustomerHome_Screen/customer_drawer.dart';
import 'package:nexqueue/Customer_Screens/CustomerHome_Screen/customer_home_tab.dart';

class CustomerHomeScreen extends StatefulWidget {
  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
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
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: _onWillPop,
          child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [CustomerDrawerScreen(), CustomerHomeTab()],
          ),
        ),
      ),
    );
  }
}
