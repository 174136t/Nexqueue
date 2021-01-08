import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nexqueue/Animation/Fade_animation.dart';
import 'package:nexqueue/Owner_Screens/OwnerHome_Screens/owner_home.dart';
import 'package:nexqueue/utils/size_config.dart';

class ServiceTypeSelectScreen extends StatefulWidget {
  @override
  _ServiceTypeSelectScreenState createState() =>
      _ServiceTypeSelectScreenState();
}

class _ServiceTypeSelectScreenState extends State<ServiceTypeSelectScreen> {
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  List items = ["Saloon", "Supermarket", "Grocery", "Fashion", "Bar"];
  String valueChoose;
  String _setStartTime, _setEndTime;

  String _startHour, _startMinute, _startTime;
  String _endHour, _endMinute, _endTime;

  // String dateTime;
  TimeOfDay selectedStartTime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedEndTime = TimeOfDay(hour: 00, minute: 00);

  Future<Null> _selectstartTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedStartTime,
        initialEntryMode: TimePickerEntryMode.dial);
    if (picked != null)
      setState(() {
        selectedStartTime = picked;
        _startHour = selectedStartTime.hour.toString();
        _startMinute = selectedStartTime.minute.toString();
        _startTime = _startHour + ' : ' + _startMinute;
        _startTimeController.text = _startTime;
        _startTimeController.text = formatDate(
            DateTime(
                2019, 08, 1, selectedStartTime.hour, selectedStartTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  Future<Null> _selectEndTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedEndTime,
        initialEntryMode: TimePickerEntryMode.dial);
    if (picked != null)
      setState(() {
        selectedEndTime = picked;
        _endHour = selectedEndTime.hour.toString();
        _endMinute = selectedEndTime.minute.toString();
        _endTime = _endHour + ' : ' + _endMinute;
        _endTimeController.text = _endTime;
        _endTimeController.text = formatDate(
            DateTime(2019, 08, 1, selectedEndTime.hour, selectedEndTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Cho',
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: SizeConfig.heightMultiplier * 4.5,
            fontWeight: FontWeight.w900,
            color: Colors.orange[800],
          ),
          children: [
            TextSpan(
              text: 'os',
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontSize: SizeConfig.heightMultiplier * 4.5,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'e',
              style: TextStyle(
                color: Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier * 4.5,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: ' Se',
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontSize: SizeConfig.heightMultiplier * 4.5,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'rvi',
              style: TextStyle(
                color: Colors.orange[800],
                fontSize: SizeConfig.heightMultiplier * 4.5,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: 'ce',
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontSize: SizeConfig.heightMultiplier * 4.5,
                fontWeight: FontWeight.w900,
              ),
            ),
          ]),
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

  LocationResult _pickedLocation;

  String fullName;
  String phone;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Widget fullnameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Service center name',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.heightMultiplier * 2,
              color: Colors.deepPurple),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            height: SizeConfig.heightMultiplier * 6,
            width: SizeConfig.widthMultiplier * 90,
            decoration: BoxDecoration(
                // color: skyblue,
                // borderRadius: BorderRadius.circular(15)
                ),
            child: TextFormField(
              cursorColor: Colors.deepPurple,
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
              controller: fullNameController,
              autofocus: false,
              focusNode: focusNode,
              decoration: InputDecoration(
                  fillColor: Colors.deepPurple.withOpacity(0.3),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(15.0),
                  // ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: Icon(
                    Icons.design_services,
                    color: Colors.deepPurple,
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.deepPurple),
                  hintText: 'Fashion bug'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Username can\'t be empty';
                }
              },
              onSaved: (String value) {
                this.fullName = value;
              },
            )),
      ],
    );
  }

  Widget phoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone number',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.deepPurple),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            height: SizeConfig.heightMultiplier * 6,
            width: SizeConfig.widthMultiplier * 90,
            decoration: BoxDecoration(
                // color: skyblue,
                // borderRadius: BorderRadius.circular(15)
                ),
            child: TextFormField(
              cursorColor: Colors.deepPurple,
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
              controller: phoneController,
              autofocus: false,
              focusNode: focusNode1,
              decoration: InputDecoration(
                  fillColor: Colors.deepPurple.withOpacity(0.3),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(15.0),
                  // ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: Icon(
                    Icons.smartphone,
                    color: Colors.deepPurple,
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.deepPurple),
                  hintText: '0761234567'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Phone number can\'t be empty';
                } else if (value.length != 10) {
                  return 'Please check your Phone number';
                }
              },
              onSaved: (String value) {
                this.phone = value;
              },
            )),
      ],
    );
  }

  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  File _image;
  _imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
               
              ),
              child: new Wrap(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/boy.png',
                        filterQuality: FilterQuality.high,
                        height: SizeConfig.heightMultiplier * 15,
                      ),
                      Expanded(
                        child: Text(
                          'Select a option',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.heightMultiplier * 2.5),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color: Colors.black,),
                      trailing:new Icon(Icons.arrow_forward_ios,color: Colors.black,),
                      title: new Text('Gallery',style: TextStyle(fontWeight: FontWeight.bold),),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color: Colors.black,),
                     trailing:new Icon(Icons.arrow_forward_ios,color: Colors.black,),
                    title: new Text('Camera',style: TextStyle(fontWeight: FontWeight.bold),),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    _startTimeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();

    _endTimeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[50],
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              FadeAnimation(1.2, _backButton()),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FadeAnimation(
                  1.2,
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          // CustomDropdown(text: 'Select Service Type')

                          _title(),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 1,
                          ),

                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              _showPicker(context);
                            },
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: SizeConfig.heightMultiplier * 20,
                                    child: _image != null
                                        ? Container(
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.file(
                                                _image,
                                                // width: SizeConfig.heightMultiplier *
                                                //     16,
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    20,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(50)),

                                            // width: SizeConfig.heightMultiplier * 20,

                                            height:
                                                SizeConfig.heightMultiplier *
                                                    20,

                                            child: Image.asset(
                                              'assets/images/service1.png',
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      16,
                                              filterQuality: FilterQuality.high,
                                            ),
                                          ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    // alignment: Alignment.bottomCenter,
                                    margin: EdgeInsets.only(
                                      top: SizeConfig.heightMultiplier * 16,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple[800],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: SizeConfig.heightMultiplier * 8,
                                    height: SizeConfig.heightMultiplier * 8,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 1,
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: Colors.orange[200],
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Text(
                          //       "Name of Service center",
                          //       style: TextStyle(
                          //           fontSize: SizeConfig.heightMultiplier * 2.2,
                          //           color: Colors.orange[800],
                          //           fontWeight: FontWeight.bold),
                          //       textAlign: TextAlign.justify,
                          //     ),
                          //   ),
                          // ),
                          fullnameField(),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 1,
                          ),
                          phoneField(),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 1,
                          ),
                          Center(
                            child: Container(
                              height: SizeConfig.heightMultiplier * 6,
                              width: SizeConfig.widthMultiplier * 90,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple.withOpacity(0.3),
                                  // border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  underline: Container(),
                                  isExpanded: true,
                                  hint: Center(
                                    child: Text(
                                      'Select your Service type',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple,
                                          fontSize:
                                              SizeConfig.heightMultiplier * 2),
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.deepPurple,
                                  ),
                                  value: valueChoose,
                                  dropdownColor: Colors.deepPurple[100],
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                  onTap: () {
                                    setState(() {
                                      FocusScope.of(context).unfocus();
                                    });
                                  },
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueChoose = newValue;
                                    });
                                  },
                                  items: items.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 2,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          color: Colors.deepPurple,
                                          size: SizeConfig.heightMultiplier * 2,
                                        ),
                                        Text(
                                          'Start Time',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  SizeConfig.heightMultiplier *
                                                      2,
                                              color: Colors.deepPurple),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _selectstartTime(context);
                                        FocusScope.of(context).unfocus();
                                      },
                                      child: Container(
                                        width: SizeConfig.widthMultiplier * 40,
                                        height: SizeConfig.heightMultiplier * 5,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.deepPurple,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: TextFormField(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          controller: _startTimeController,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              // borderRadius:
                                              //     BorderRadius.circular(15.0),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              // borderRadius:
                                              //     BorderRadius.circular(15.0),
                                            ),
                                            // hintText: '10.00',
                                            // suffix: Text(
                                            //   'a.m.',
                                            //   style: TextStyle(
                                            //       color: Colors.black),
                                            // ),
                                          ),
                                          onSaved: (String val) {
                                            _setStartTime = val;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.timer_off,
                                          color: Colors.deepPurple,
                                          size: SizeConfig.heightMultiplier * 2,
                                        ),
                                        Text(
                                          'End Time',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  SizeConfig.heightMultiplier *
                                                      2,
                                              color: Colors.deepPurple),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _selectEndTime(context);
                                        FocusScope.of(context).unfocus();
                                      },
                                      child: Container(
                                        width: SizeConfig.widthMultiplier * 40,
                                        height: SizeConfig.heightMultiplier * 5,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.deepPurple,
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: TextFormField(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          enabled: false,
                                          keyboardType: TextInputType.text,
                                          controller: _endTimeController,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              // borderRadius:
                                              //     BorderRadius.circular(15.0),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              // borderRadius:
                                              //     BorderRadius.circular(15.0),
                                            ),
                                            // hintText: '10.00',
                                            // suffix: Text(
                                            //   'a.m.',
                                            //   style: TextStyle(
                                            //       color: Colors.black),
                                            // ),
                                          ),
                                          onSaved: (String val) {
                                            _setEndTime = val;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 1,
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                _pickedLocation == null
                                    ? GestureDetector(
                                        onTap: () async {
                                          FocusScope.of(context).unfocus();
                                          LocationResult result =
                                              await showLocationPicker(
                                            context,
                                            // 'AIzaSyCTrW4ZJ1ojJ5VyOkOAVZjpWzY389IxFhU',
                                            'AIzaSyBUILBxCa5yyQZawAAOpD6HII48R3haimM',
                                            initialCenter:
                                                LatLng(6.927079, 79.861244),

//                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                                            myLocationButtonEnabled: true,
                                            // requiredGPS: true,
                                            layersButtonEnabled: true,
                                            countries: ['LK'],

//                      resultCardAlignment: Alignment.bottomCenter,
                                            desiredAccuracy:
                                                LocationAccuracy.best,
                                          );
                                          print("result = $result");
                                          setState(
                                              () => _pickedLocation = result);
                                        },
                                        child: Container(
                                          height:
                                              SizeConfig.heightMultiplier * 5,
                                          width:
                                              SizeConfig.widthMultiplier * 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.green[800],
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          // child: RaisedButton(
                                          //   color: Colors.transparent,
                                          //   onPressed: () async {},
                                          child: Center(
                                              child: Text(
                                            'Pick location',
                                            style: TextStyle(
                                                color: Colors.green[800],
                                                fontWeight: FontWeight.bold),
                                          )),
                                          // ),
                                        ),
                                      )
                                    : Text(
                                        'Picked location:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                Text(_pickedLocation != null
                                    ? _pickedLocation.address.toString()
                                    : ''),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: SizeConfig.heightMultiplier * 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OwnerHomeScreen()));
                            },
                            child: Container(
                              width: SizeConfig.widthMultiplier * 60,
                              height: SizeConfig.heightMultiplier * 6.5,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.orange[800]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.heightMultiplier * 3,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
