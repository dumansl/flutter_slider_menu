import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slider_menu/menu_dashboard_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const Color backgroundColor = Color(0xFF343442);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: backgroundColor,
    statusBarIconBrightness: Brightness.light,
    //systemNavigationBarColor: Colors.pink,
    //systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Menu Dashboard",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuDashboard(),
    );
  }
}
