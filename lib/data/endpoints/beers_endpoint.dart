import 'package:beer_app/data/client/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../models/beer.dart';

part 'beers_endpoint.g.dart';

@RestApi(parser: Parser.JsonSerializable)
@injectable
abstract class BeersEndpoint {
  @factoryMethod
  factory BeersEndpoint(DioClient dio) {
    return _BeersEndpoint(dio);
  }

  @GET("/beers")
  Future<List<Beer>> getBeers();
}