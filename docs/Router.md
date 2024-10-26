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
  ...
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
    ...    
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
```
This way we can use the `getIndex()` and `getName` methods of this class to return the corresponding bottom navigation index.


