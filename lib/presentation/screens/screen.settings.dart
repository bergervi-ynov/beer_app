import "package:flutter/material.dart";

import "../widgets/widget.rolling_switch_theme.dart";

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text(
            "Settings",
            style: TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationColor: Theme.of(context).colorScheme.onBackground,
              decorationThickness: 2,
              shadows: [Shadow(color: Theme.of(context).colorScheme.onBackground,offset: const Offset(0, -5))],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        shadowColor: Colors.transparent,
      ),
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