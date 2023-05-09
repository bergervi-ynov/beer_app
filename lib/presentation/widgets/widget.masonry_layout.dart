import "package:flutter/material.dart";
import "package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart";

import "../../data/models/beer.dart";



class BeerMasonryLayout extends StatefulWidget{
  final List<Beer> beers;

  const BeerMasonryLayout({
    super.key,
    required this.beers,
  });
  @override
  State<BeerMasonryLayout> createState() => _BeerMasonryLayoutState();
}

class _BeerMasonryLayoutState extends State<BeerMasonryLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        shadowColor: Colors.transparent,
        title: Center(
          child: Text(
            "Browse",
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: widget.beers.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 200,
                    child: Image.network(
                      widget.beers[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Flexible(
                     child: Text(
                          widget.beers[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                     ),
                   ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
