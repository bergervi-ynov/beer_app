import 'package:beer_app/data/models/beer.dart';
import 'package:beer_app/presentation/widgets/widget.appbar.dart';
import 'package:flutter/material.dart';

class DetailsBeerWidget extends StatelessWidget{

  final Beer beer;

  const DetailsBeerWidget({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: AppBarBeer(title: beer.name),
      body: Image.network(beer.imageUrl),
    );
  }

}