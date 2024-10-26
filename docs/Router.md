# Router Configuration

## Route
We create a `Route` object with required and optional parameters in [route_name.dart](/lib/navigation/route_name.dart) that will allow us to define named routes and also labels and icons for bottom navigation automatically.
```dart
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
```

## RouteName
The `Route` objects defined above are used in the `RouteName` class in [route_name.dart](/lib/navigation/route_name.dart) which gives us a name and a path for the top level routes.

```dart
class RouteName {
  static Route home = Route(name: 'home', path: '/');
  ... // other top lavel destinations here
}
```
## IndexedRoutes
We also define `IndexedRoutes` class in [route_name.dart](/lib/navigation/route_name.dart) which gives us the routes corresponding to the index in the bottom navigation bar. 
```dart
class IndexedRoutes {
  final List<Route> routes = [
    Route(
        name: 'images',
        path: 'images',
        label: 'Images',
        icon: Icons.image,
        child: GenericPage(title: "Images")),
    ...    // other routes here
  ];

  int getIndex(String path) {
    return routes.indexWhere((route) {
      return path.contains(route.path);
    });
  }
  String getName(int index) {
    return routes[index].name;
  }
}
```
This way we can use the `getIndex()` and `getName` methods of this class to return the corresponding bottom navigation index.

## Shell Routes
The routes which are used in the bottom navigation bar are **shell routes** as they get their own navigator through the [ShellRoute](https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html) construct in [go_router](https://pub.dev/packages/go_router).

Here we define `shellRoutes` in [router.dart](/lib/navigation/router.dart) programmatically from the `IndexedRoutes` object:
```dart
List<GoRoute> shellRoutes =
    List.generate(IndexedRoutes().routes.length, (index) {
  return GoRoute(
    name: IndexedRoutes().routes[index].name,
    path: IndexedRoutes().routes[index].path,
    builder: (context, state) {
      return IndexedRoutes().routes[index].child ?? Container();
    },
  );
});
```

## GoRouter

Finally we define our `GoRouter router` in [router.dart](/lib/navigation/router.dart):
```dart
GoRouter router(AuthenticationBloc authenticationBloc) {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "Root");
  final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "Shell");
  return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: "/images",
      refreshListenable: StreamToListenable([authenticationBloc.stream]),
      redirect: (context, state) {
        ... // redirect logic here
      },
      routes: [
        GoRoute(
          name: RouteName.home.name,
          path: RouteName.home.path,
          builder: (context, state) => HomePage(),
          routes: [
            ShellRoute(
              navigatorKey: shellNavigatorKey,
              routes: shellRoutes,
              builder: (context, state, child) {
                return ScaffoldWithNavBar(
                  child: child,
                );
              },
            )
          ],
        ),
        ... // other routes here
      ]);
}
```



