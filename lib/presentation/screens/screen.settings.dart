import "package:beer_app/presentation/widgets/widget.appbar.dart";
import "package:flutter/material.dart";

import "../widgets/widget.rolling_switch_theme.dart";

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: const AppBarBeer(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: const [
            Expanded(
              child :Text("Change Theme", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
             RollingSwitchThemeWidget(),
          ],
        ),
      ),
    );
  }
}