import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'firebase_options.dart';
import 'home_page.dart';
import 'menu_screen.dart';

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

  @override
  void initState() {
    zoomDrawerController = ZoomDrawerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Darkinowls',

        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color.fromRGBO(40, 44, 52, 1),
          primaryColor: Colors.teal,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: ZoomDrawer(
          showShadow: true,
          duration: const Duration(milliseconds: 500),
          angle: 0,
          mainScreen: HomePage(zoomDrawerController),
          menuScreen: const MenuScreen(),
          controller: zoomDrawerController,
          mainScreenTapClose: true,
        ));
  }
}
