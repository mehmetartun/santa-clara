import 'package:csen268_f24_g0/pages/generic/generic_page.dart';
import 'package:csen268_f24_g0/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class RouteName {
  static Route home = Route(name: 'home', path: '/');
  static Route signIn = Route(name: 'signIn', path: '/signIn');
  static Route verifyEmail = Route(name: 'verifyEmail', path: '/verifyEmail');
}

class IndexedRoutes {
  final List<Route> routes = [
    Route(
        name: 'images',
        path: 'images',
        label: 'Images',
        icon: Icons.image,
        child: GenericPage(title: "Images")),
    Route(
        name: 'articles',
        path: 'articles',
        label: 'Articles',
        icon: Icons.text_snippet,
        child: GenericPage(title: "Articles")),
    Route(
        name: 'chat',
        path: 'chat',
        label: 'Chat',
        icon: Icons.chat,
        child: GenericPage(title: "Chat")),
    Route(
        name: 'profile',
        path: 'profile',
        label: 'Profile',
        icon: Icons.person,
        child: ProfilePage()),
  ];

  int getIndex(String path) {
    return routes.indexWhere((route) {
      return route.path == path;
    });
  }

  String getName(int index) {
    return routes[index].name;
  }
}

class Route {
  final String name;
  final String path;
  String? label;
  IconData? icon;
  Widget? child;

  Route(
      {required this.name,
      required this.path,
      this.icon,
      this.child,
      this.label});
}
