# Bottom Navigation

With bottom navigation we aim to get a behaviour as shown below:

![Bottom Navigation](/docs/images//BottomNavigation.gif)

## Implementation
In the definition of the `router` object, as explained in [Router Docs](/docs/Router.md), we have the `builder` property of the `ShellRoute`. This is a `ScaffoldWithNavBar` object defined in [scaffold_with_nav_bar.dart](/lib/widgets/scaffold_with_nav_bar.dart).
```dart
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        destinations: List.generate(
          IndexedRoutes().routes.length,
          (index) {
            return NavigationDestination(
              icon: Icon(
                  IndexedRoutes().routes[index].icon ?? Icons.question_mark),
              label: IndexedRoutes().routes[index].label ??
                  IndexedRoutes().routes[index].name,
            );
          },
        ),
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }
  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    int index = IndexedRoutes().getIndex(location);
    if (index > -1) {
      return index;
    }
    return 0;
  }
  void _onItemTapped(int index, BuildContext context) {
    GoRouter.of(context).goNamed(IndexedRoutes().getName(index));
  }
}
```