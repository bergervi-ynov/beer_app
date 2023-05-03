import 'package:beer_app/data/endpoints/beers_endpoint.dart';
import 'package:beer_app/data/models/beer.dart';
import 'package:flutter/material.dart';

class GridViewModel extends ChangeNotifier{
  final BeersEndpoint beersEndpoint;

  GridViewModel(this.beersEndpoint){
    loadBeers();
  }

  List<Beer> beers = <Beer>[];

  Future<void> loadBeers() async {
    final response = await beersEndpoint.getBeers();
    beers.addAll(response);
    notifyListeners();
  }

}