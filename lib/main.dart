import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wheather_app/screens/wheather_homscreen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'provider/wheather_provider.dart';

void main() {
  runApp(const WheatherApp());
}

class WheatherApp extends StatelessWidget {
  const WheatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 1123),
        minTextAdapt: true,
        builder: (context, widget) {
          return ChangeNotifierProvider(
            create: (context) => WheatherProvider(),
            child: const MaterialApp(
                title: 'Wheather App',
                debugShowCheckedModeBanner: false,
                home: WheatherHome()),
          );
        });
  }
}