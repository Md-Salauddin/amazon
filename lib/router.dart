import 'package:flutter/material.dart';

import 'features/auth/screens/auth_screen.dart';

/// onGenerateRoute# dynamically generate routes when a named route
/// that is not directly defined in the routes parameter
/// of the MaterialApp widget. Instead of pre-defining
/// all possible routes in the routes parameter,
/// use `onGenerateRoute` to handle route generation dynamically
/// based on the provided settings.

/// (1) Routes require dynamic parameters.
/// (2) Handling Unknown Routes.
/// (3) Custom Transition Animations.
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    // If the requested route is not recognized,
    // return a default(error) route.
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
