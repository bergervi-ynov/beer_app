import 'package:beer_app/presentation/viewmodel/viewmodel.grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/beer.dart';


class AppBarBeer extends StatefulWidget with PreferredSizeWidget{
  final String title;
  final bool isNavigation;
  const AppBarBeer({
    super.key, required this.title, this.isNavigation = false
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarBeer> createState() => _AppBarBeerState();
}

class _AppBarBeerState extends State<AppBarBeer> {
  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      shadowColor: Colors.transparent,
      leading: widget.isNavigation ? IconButton(
        icon: Icon(Icons.arrow_back,color: Theme.of(context).colorScheme.onSurfaceVariant,),
        onPressed: () => Navigator.of(context).pop(),
      ): null,
      title: Center(
        child: Text(
          widget.title,
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


}