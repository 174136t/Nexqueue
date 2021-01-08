import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blocHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static double fontConstant;
  static double screenHeightConstant;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blocHeight = _screenHeight / 100;

    textMultiplier = _blocHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blocHeight;
    widthMultiplier = _blockWidth;

    screenHeightConstant = _screenWidth* 0.031;
    fontConstant = screenHeightConstant / 12.5;


    print("heightMultiplier :${_blocHeight}");
    print("widthMultiplier :${_blockWidth}");

    print(SizeConfig.screenHeightConstant);
  }
}


class AppSize {



  static get s1 => 1.0; //~1.0

  static get s2 => 2.0; //~2.0

  static get extraSmall => SizeConfig.screenHeightConstant / 2; //~5.0

  static get small => SizeConfig.screenHeightConstant; //~10.0

  static get smallMedium => (SizeConfig.screenHeightConstant * 3) / 2; //~15.0

  static get medium => SizeConfig.screenHeightConstant * 2; //~20.0

  static get mediumLarge => (SizeConfig.screenHeightConstant * 5) / 2; //~25.0

  static get large => SizeConfig.screenHeightConstant * 3; //~30.0

  static get extraLarge => SizeConfig.screenHeightConstant * 4; //~40.0

  static get xxL => SizeConfig.screenHeightConstant * 5; //~50.0

  static get s60 => SizeConfig.screenHeightConstant * 6; //~60.0

  static get s70 => SizeConfig.screenHeightConstant * 7; //~70.0

  static get s80 => SizeConfig.screenHeightConstant * 8; //~80.0
  static get s90 => SizeConfig.screenHeightConstant * 9; //~80.0
  static get s100 => SizeConfig.screenHeightConstant * 10; //~80.0
}

class AppFontSize {

  static get textIcon => 5.0*SizeConfig.imageSizeMultiplier;
  static get textHint => SizeConfig.fontConstant * 14;

  static get s5 => SizeConfig.fontConstant * 5;

  static get s6 => SizeConfig.fontConstant * 6;

  static get s7 => SizeConfig.fontConstant * 7;

  static get s8 => SizeConfig.fontConstant * 8;

  static get s9 => SizeConfig.fontConstant * 9;

  static get s10 => SizeConfig.fontConstant * 10;

  static get s11 => SizeConfig.fontConstant * 11;

  static get s12 => SizeConfig.fontConstant * 12;

  static get s13 => SizeConfig.fontConstant * 12;

  static get s14 => SizeConfig.fontConstant * 14;

  static get s15 => SizeConfig.fontConstant * 15;

  static get s16 => SizeConfig.fontConstant * 16;

  static get s17 =>SizeConfig. fontConstant * 17;

  static get s18 => SizeConfig.fontConstant * 18;

  static get s19 => SizeConfig.fontConstant * 19;

  static get s20 => SizeConfig.fontConstant * 20;

  static get s21 =>SizeConfig. fontConstant * 21;

  static get s22 => SizeConfig.fontConstant * 22;

  static get s23 => SizeConfig.fontConstant * 23;

  static get s24 => SizeConfig.fontConstant * 24;

  static get s25 => SizeConfig.fontConstant * 25;

  static get s26 => SizeConfig.fontConstant * 26;

  static get s27 => SizeConfig.fontConstant * 27;

  static get s28 => SizeConfig.fontConstant * 28;

  static get s29 => SizeConfig.fontConstant * 29;

  static get s30 => SizeConfig.fontConstant * 30;

  static get s31 =>SizeConfig. fontConstant * 31;

  static get s32 =>SizeConfig. fontConstant * 32;
}