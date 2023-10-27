import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:personal_website/screen_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/menu_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ZoomDrawerController zoomDrawerController;
  late final ScrollController scrollController;

  @override
  void initState() {
    zoomDrawerController = ZoomDrawerController();
    scrollController = ScrollController();
    super.initState();
  }


  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Darkinowls',
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
          scaffoldBackgroundColor: const Color.fromRGBO(40, 44, 52, 1),
          primaryColor: Colors.teal,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: ScreenController(
          zoomDrawerController: zoomDrawerController,
          scrollController: scrollController,
          child: ZoomDrawer(
            showShadow: true,
            duration: const Duration(milliseconds: 500),
            angle: 0,
            mainScreen: const HomeScreen(),
            menuScreen: const MenuScreen(),
            controller: zoomDrawerController,
            mainScreenTapClose: true,
          ),
        ));
  }
}
