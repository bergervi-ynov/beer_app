
import 'package:flutter/material.dart';


class AppBarBeer extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool isNavigation;
  const AppBarBeer({
    super.key, required this.title, this.isNavigation = false
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      shadowColor: Colors.transparent,
      leading: isNavigation ? IconButton(
        icon: Icon(Icons.arrow_back,color: Theme.of(context).colorScheme.onSurfaceVariant,),
        onPressed: () => Navigator.of(context).pop(),
      ): null,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            decoration: TextDecoration.underline,
            decorationColor: Theme.of(context).colorScheme.onSurfaceVariant,
            decorationThickness: 2,
            shadows: [Shadow(color: Theme.of(context).colorScheme.onSurfaceVariant,offset: const Offset(0, -5))],
          ),
        ),
      ),
    );
  }
}