import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

@singleton
class StorageService{
  final Box<Uint8List> _favoriteImage;

  StorageService(this._favoriteImage);

  @factoryMethod
  static Future<StorageService> inject() async {
    await Hive.initFlutter();
    final imageBox = await Hive.openBox<Uint8List>("favoriteImage");
    return StorageService(imageBox);
  }

  ValueListenable<Box<Uint8List>> get favoriteImageListener => _favoriteImage.listenable();

}