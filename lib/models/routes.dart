

import 'package:flutter/material.dart';
import 'package:info_app/views/ListofUsersPage.dart';
import 'package:info_app/views/loginPage.dart';
import 'package:info_app/views/userDetailsPage.dart';

// class MyAppRoute {
//   GoRouter router = GoRouter(routes: [
//     GoRoute(
//         path: '/',
//         name: MyAppRouteConstants.splashRoute,
//         pageBuilder: (context, state) {
//           return MaterialPage(
//             child: SplashScreen(),
//           );
//         }),    GoRoute(
//         path: '/login',
//         name: MyAppRouteConstants.loginRoute,
//         pageBuilder: (context, state) {
//           return MaterialPage(
//             child: LoginPage(),
//           );
//         })
// ,    GoRoute(
//         path: '/usersList',
//         name: MyAppRouteConstants.userListRoute,
//         pageBuilder: (context, state) {
//           return MaterialPage(
//             child: UsersList(),
//           );
//         })
// ,    GoRoute(
//         path: '/userDetails',
//         name: MyAppRouteConstants.userDetailsRoute,
//         pageBuilder: (context, state) {
//           return MaterialPage(
//             child: UserDetails(),
//           );
//         })
//
//   ]);
// }
class Routes{
  Route loginRoute=MaterialPageRoute(builder: (context)=>LoginPage());
  Route userListRoute=MaterialPageRoute(builder: (context)=>UsersList());
  // Route userDetailsRoute=MaterialPageRoute(builder: (context)=>UserDetails());

}