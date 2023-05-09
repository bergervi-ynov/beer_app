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
    return BeerMasonryLayout(beers: gridViewModel.beers);
  }
}