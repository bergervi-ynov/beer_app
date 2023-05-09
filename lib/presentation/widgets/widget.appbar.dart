import 'package:flutter/material.dart';

class AppBarBeer extends StatelessWidget with PreferredSizeWidget{
  final String title;
  const AppBarBeer({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      shadowColor: Colors.transparent,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: Theme.of(context).colorScheme.onSurfaceVariant,
            decorationThickness: 2,
            shadows: [Shadow(color: Theme.of(context).colorScheme.onSurfaceVariant,offset: const Offset(0, -5))],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}