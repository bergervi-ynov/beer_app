
import 'package:beer_app/data/endpoints/beers_endpoint.dart';
import 'package:beer_app/data/models/beer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../infrastructure/services/service.storage.dart';

class GridViewModel extends ChangeNotifier{
  final BeersEndpoint beersEndpoint;
  final StorageService storageService;



  int page = 1;
  bool loading = true;
  bool isFinalPage = false;

  GridViewModel(this.beersEndpoint, this.storageService){
    loadBeers();
    initScrollListener();
  }
  ValueListenable<Box<Uint8List>> get imageListenable => storageService.favoriteImageListener;

  List<Beer> beers = <Beer>[];
  final ScrollController scrollController = ScrollController();

  void initScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels <=  (scrollController.position.maxScrollExtent * 0.9) && !isFinalPage) {
        print("Loading more beers");
        loadMoreBeers();
      }
    });
  }

  Future<void> loadBeers() async {
    final response = await beersEndpoint.getBeers(page: page);
    beers.addAll(response);
    page++;
    loading = false;
    notifyListeners();
  }

  Future<void> loadMoreBeers() async {
    if (!loading && page <= 2){
      loading = true;
      await loadBeers();
      notifyListeners();
    }
    else {
      isFinalPage = true;
      notifyListeners();
    }
  }

}