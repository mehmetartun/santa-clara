import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_clara/theme/cubit/theme_cubit.dart';

class BrightnessSelector extends StatelessWidget {
  const BrightnessSelector({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit cubit = BlocProvider.of<ThemeCubit>(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Container(
            child: Row(mainAxisSize: MainAxisSize.min, children: [
          state.themeMode == ThemeMode.light
              ? IconButton.filled(
                  icon: Icon(
                    Icons.light_mode,
                  ),
                  onPressed: () {},
                )
              : IconButton.filledTonal(
                  icon: Icon(
                    Icons.light_mode,
                  ),
                  onPressed: () {
                    cubit.changeThemeMode(ThemeMode.light);
                    Navigator.of(context).pop();
                  },

                  // isSelected: true,
                ),
          SizedBox(width: 10),
          state.themeMode == ThemeMode.dark
              ? IconButton.filled(
                  icon: Icon(
                    Icons.dark_mode,
                  ),
                  onPressed: () {},
                )
              : IconButton.filledTonal(
                  icon: Icon(
                    Icons.dark_mode,
                  ),
                  onPressed: () {
                    cubit.changeThemeMode(ThemeMode.dark);
                    Navigator.of(context).pop();
                  },

                  // isSelected: true,
                ),
          SizedBox(width: 10),
          state.themeMode == ThemeMode.system
              ? IconButton.filled(
                  icon: Icon(
                    Icons.smartphone,
                  ),
                  onPressed: () {},
                )
              : IconButton.filledTonal(
                  icon: Icon(
                    Icons.smartphone,
                  ),
                  onPressed: () {
                    cubit.changeThemeMode(ThemeMode.system);
                    Navigator.of(context).pop();
                  },

                  // isSelected: true,
                ),
        ]));
      },
    );
  }
}
