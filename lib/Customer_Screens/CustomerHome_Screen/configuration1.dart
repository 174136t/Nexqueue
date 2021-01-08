import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Saloon', 'iconPath': 'assets/images/saloon.png'},
  {'name': 'Supermarket', 'iconPath': 'assets/images/supermarket.png'},
  {'name': 'Grocery', 'iconPath': 'assets/images/grocery.png'},
  {'name': 'Fashion', 'iconPath': 'assets/images/fashion.png'},
  {'name': 'Bar', 'iconPath': 'assets/images/bar.png'}
];

List<Map> drawerItems = [
  {'icon': FontAwesomeIcons.edit, 'title': 'Edit Profile'},
  {'icon': FontAwesomeIcons.bell, 'title': 'Notifications'},
  {'icon': FontAwesomeIcons.history, 'title': 'Queue History'},
  {'icon': Icons.favorite, 'title': 'Favourites'},
  {'icon': Icons.mail, 'title': 'Messages'},
  {'icon': Icons.exit_to_app, 'title': 'Exit app'},
];
