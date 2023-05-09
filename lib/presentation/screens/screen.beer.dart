import 'package:beer_app/presentation/widgets/widget.appbar.dart';
import 'package:beer_app/presentation/widgets/widget.masonry_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/viewmodel.grid.dart';

class BeerScreen extends StatelessWidget{
  const BeerScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context){
    final gridViewModel = Provider.of<GridViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: const AppBarBeer(title: "Browse"),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: BeerMasonryLayout(
          beers: gridViewModel.beers,
          controller: gridViewModel.scrollController, imageListenable: gridViewModel.imageListenable, isFinalPage: gridViewModel.isFinalPage,
        ),
      )),
    );
  }
}