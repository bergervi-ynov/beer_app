import "package:json_annotation/json_annotation.dart";

part "beer.g.dart";

@JsonSerializable()
class Beer {
  final int id;
  final String name;
  final String tagline;
  @JsonKey(name: "first_brewed")
  final String firstBrewed;
  final String description;
  @JsonKey(name: "image_url")
  final String imageUrl;
  final double abv;
  final double ibu;
  @JsonKey(name: "target_fg")
  final double targetFg;
  @JsonKey(name: "target_og")
  final double targetOg;
  final double ebc;
  final double srm;
  final double ph;
  @JsonKey(name: "attenuation_level")
  final double attenuationLevel;
  final Volume volume;
  @JsonKey(name: "boil_volume")
  final Volume boilVolume;
  final Method method;
  final Ingredients ingredients;
  @JsonKey(name: "food_pairing")
  final List<String> foodPairing;
  @JsonKey(name: "brewers_tips")
  final String brewersTips;
  @JsonKey(name: "contributed_by")
  final String contributedBy;

  Beer(
      {required this.id,
        required this.name,
        required this.tagline,
        required this.firstBrewed,
        required this.description,
        required this.imageUrl,
        required this.abv,
        required this.ibu,
        required this.targetFg,
        required this.targetOg,
        required this.ebc,
        required this.srm,
        required this.ph,
        required this.attenuationLevel,
        required this.volume,
        required this.boilVolume,
        required this.method,
        required this.ingredients,
        required this.foodPairing,
        required this.brewersTips,
        required this.contributedBy
      });

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);
  Map<String, dynamic> toJson() => _$BeerToJson(this);
}

@JsonSerializable()
class Ingredients {
final List<Malt> malt;
  final List<Hop> hops;
  @JsonKey(name: "yeast")
  final String yeast;

  Ingredients({required this.malt, required this.hops, required this.yeast});

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientsToJson(this);
}
@JsonSerializable()
class Hop {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "amount")
  final Amount amount;
  @JsonKey(name: "add")
  final String add;
  @JsonKey(name: "attribute")
  final String attribute;

  Hop(
      {required this.name,
        required this.amount,
        required this.add,
        required this.attribute});

  factory Hop.fromJson(Map<String, dynamic> json) => _$HopFromJson(json);
  Map<String, dynamic> toJson() => _$HopToJson(this);
}
@JsonSerializable()
class Amount {
  final double value;
  final String unit;

  Amount({required this.value, required this.unit});

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);
  Map<String, dynamic> toJson() => _$AmountToJson(this);
}


@JsonSerializable()
class Malt {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "amount")
  final Amount amount;

  Malt({required this.name, required this.amount});

  factory Malt.fromJson(Map<String, dynamic> json) => _$MaltFromJson(json);
  Map<String, dynamic> toJson() => _$MaltToJson(this);
}

@JsonSerializable()
class Volume {
  final double value;
  final String unit;

  Volume({required this.value, required this.unit});

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeToJson(this);
}

@JsonSerializable()
class Method {
  @JsonKey(name: "mash_temp")
  final List<MashTemp> mashTemp;
  final Fermentation fermentation;
  final dynamic twist;

  Method(
      {required this.mashTemp, required this.fermentation, required this.twist});

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);
  Map<String, dynamic> toJson() => _$MethodToJson(this);
}

@JsonSerializable()
class MashTemp {
  final Temperature temp;
  final int duration;

  MashTemp({required this.temp, required this.duration});

  factory MashTemp.fromJson(Map<String, dynamic> json) =>
      _$MashTempFromJson(json);
  Map<String, dynamic> toJson() => _$MashTempToJson(this);
}

@JsonSerializable()
class Fermentation {
  final Temperature temp;

  Fermentation({required this.temp});

  factory Fermentation.fromJson(Map<String, dynamic> json) =>
      _$FermentationFromJson(json);
  Map<String, dynamic> toJson() => _$FermentationToJson(this);
}

@JsonSerializable()
class Temperature {
  final double value;
  final String unit;

  Temperature({required this.value, required this.unit});

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
  Map<String,dynamic> toJson() => _$TemperatureToJson(this);
}

