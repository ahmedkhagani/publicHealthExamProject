import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fetp_form/services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_fetp_form/views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FETP Iraq',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF324161),
          primaryColor: const Color(0xFF324161),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: false,
            titleTextStyle: TextStyle(color: Colors.white),
          ),
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: Colors.white,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            },
          ),
        ),
        home: const Home(),
      ),
    );
  }
}
