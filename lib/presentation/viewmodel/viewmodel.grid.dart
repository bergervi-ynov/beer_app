
import 'package:beer_app/data/endpoints/beers_endpoint.dart';
import 'package:beer_app/data/models/beer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../infrastructure/services/service.storage.dart';

class GridViewModel extends ChangeNotifier{
  final BeersEndpoint beersEndpoint;
  final StorageService storageService;

  List<Beer> beers = <Beer>[];


  int page = 1;
  bool loading = true;
  bool isFinalPage = false;

  GridViewModel(this.beersEndpoint, this.storageService){
    beers.addAll(storageService.getFavoriteBeers());
    loadBeers();
    initScrollListener();
  }
  ValueListenable<Box<Uint8List>> get imageListenable => storageService.favoriteImageListener;


  final ScrollController scrollController = ScrollController();

  void initScrollListener() {
    scrollController.addListener(() {
      notifyListeners();
      if (scrollController.position.pixels <=  (scrollController.position.maxScrollExtent * 0.9) && !isFinalPage) {
        loadMoreBeers();
      }
    });
  }

  List<Beer> _mergeLists(List<Beer> list1, List<Beer> list2) {
    List<Beer> mergedList = List.from(list1);

    for (Beer beer in list2) {
      if (!mergedList.any((element) => element.id == beer.id)) {
        mergedList.add(beer);
      }
    }
    return mergedList;
  }

  Future<void> loadBeers() async {
    final response = await beersEndpoint.getBeers(page: page);
    beers = _mergeLists(beers, response);
    page++;
    loading = false;
    notifyListeners();
  }

  Future<void> loadMoreBeers() async {
    if (!loading && page <= 3){
      loading = true;
      await loadBeers();
      notifyListeners();
      return;
    }
    isFinalPage = true;
  }




}