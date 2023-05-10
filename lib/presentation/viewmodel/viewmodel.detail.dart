import 'package:beer_app/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../data/models/beer.dart';
import '../../infrastructure/services/service.storage.dart';

class DetailsViewModel extends ChangeNotifier {
  final StorageService _storageService;
  final Beer beer;
  DetailsViewModel._({required StorageService storageService,
    required this.beer,}) : _storageService = storageService;

  static ChangeNotifierProvider<DetailsViewModel> buildWithProvider({required Widget Function(BuildContext context, Widget? child)? builder,
  Widget? child,
  required Beer beer}) {
    return ChangeNotifierProvider<DetailsViewModel>(
      create: (_) => DetailsViewModel._(
        storageService: getIt<StorageService>(),
        beer: beer,
      ),
      builder: builder,
      lazy: false,
      child: child,
    );
  }

  ValueListenable<Box<String>> get beerListenable => _storageService.favoriteBeerListener;
  ValueListenable<Box<Uint8List>> get imageListenable => _storageService.favoriteImageListener;

  Future<void> handleFavorite() async {
    if (beer.isFavorite != null && beer.isFavorite!){
      await _storageService.removeBeer(beer);
      beer.isFavorite = false;
      notifyListeners();
      return;
    }
    await _storageService.putBeer(beer);
    beer.isFavorite = true;
    notifyListeners();
  }
}