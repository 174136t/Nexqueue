import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexqueue/OnBoarding_Screens/login_main_screen.dart';
import 'package:nexqueue/utils/size_config.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_map_location_picker/generated/l10n.dart'
    as location_picker;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          localizationsDelegates: const [
            location_picker.S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[
            Locale('en', ''),
            Locale('lk', ''),
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme:
                GoogleFonts.varelaRoundTextTheme(Theme.of(context).textTheme),
          ),
          home: AnimatedSplashScreen(
              duration: 2500,
              splash: Image.asset(
                'assets/images/nex.png',
                // height: 300,
                filterQuality: FilterQuality.high,
              ),
              nextScreen: LoginMainScreen(),
              splashTransition: SplashTransition.scaleTransition,
              pageTransitionType: PageTransitionType.scale,
              backgroundColor: Colors.white),
        );
      });
    });
  }
}
