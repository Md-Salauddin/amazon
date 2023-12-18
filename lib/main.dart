import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

import 'Router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        /** If we want to change the app bar color and have
         * it affect buttons and other elements, we need
         * to specify it accordingly.
         * */
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          /** Regardless of the icon used in the app bar,
           * it will appear in black
           * */
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
