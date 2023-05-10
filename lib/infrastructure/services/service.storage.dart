import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/beer.dart';

@singleton
class StorageService{
  final Box<Uint8List> _favoriteImage;
  final Box<String> _favoriteBeer;


  StorageService(this._favoriteImage, this._favoriteBeer);

  @factoryMethod
  static Future<StorageService> inject() async {
    await Hive.initFlutter();
    final imageBox = await Hive.openBox<Uint8List>("favoriteImage");
    final beerBox = await Hive.openBox<String>("favoriteBeer");
    return StorageService(imageBox, beerBox);
  }

  ValueListenable<Box<Uint8List>> get favoriteImageListener => _favoriteImage.listenable();
  ValueListenable<Box<String>> get favoriteBeerListener => _favoriteBeer.listenable();

  bool containsFavorite(String id) => _favoriteBeer.containsKey(id);

  Future<void> putBeer(Beer beer) async {

    await _favoriteBeer.put(beer.id.toString(), jsonEncode(beer.toJson()));
    final result = (await NetworkAssetBundle(Uri.parse(beer.imageUrl)).load(beer.imageUrl)).buffer.asUint8List();
    await _favoriteImage.put(beer.id.toString(), result);
  }

  Future<void> removeBeer(Beer beer) async {

    await _favoriteBeer.delete(beer.id.toString());
    await _favoriteImage.delete(beer.id.toString());
  }

  List<Beer> getFavoriteBeers() {
    final beers = <Beer>[];
    _favoriteBeer.values.forEach((element) {
      final beer = Beer.fromJson(jsonDecode(element));
      beer.isFavorite = true;
      beers.add(beer);
    });
    return beers;
  }

}