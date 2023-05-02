import "package:flutter/material.dart";
import "package:lite_rolling_switch/lite_rolling_switch.dart";
import "package:provider/provider.dart";

import "../viewmodel/viewmodel.theme.dart";

class RollingSwitchThemeWidget extends StatelessWidget {
  const RollingSwitchThemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LiteRollingSwitch(
      textOn: "",
      textOff: "",
      colorOn: Theme.of(context).colorScheme.primary,
      colorOff: Theme.of(context).colorScheme.primary,
      iconOn: Icons.nightlight,
      iconOff: Icons.light_mode,
      textSize: 12.0,
      textOnColor: Colors.white,
      onChanged: (bool state) {
        Provider.of<ThemeViewModel>(context, listen: false).changeTheme(context);
      },
      onTap: (){},
      onDoubleTap: (){},
      onSwipe: (){},
    );
  }
}