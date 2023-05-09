// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Beer _$BeerFromJson(Map<String, dynamic> json) => Beer(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      firstBrewed: json['first_brewed'] as String?,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      abv: (json['abv'] as num?)?.toDouble(),
      ibu: (json['ibu'] as num?)?.toDouble(),
      targetFg: (json['target_fg'] as num).toDouble(),
      targetOg: (json['target_og'] as num?)?.toDouble(),
      ebc: (json['ebc'] as num?)?.toDouble(),
      srm: (json['srm'] as num?)?.toDouble(),
      ph: (json['ph'] as num?)?.toDouble(),
      attenuationLevel: (json['attenuation_level'] as num?)?.toDouble(),
      volume: Volume.fromJson(json['volume'] as Map<String, dynamic>),
      boilVolume: Volume.fromJson(json['boil_volume'] as Map<String, dynamic>),
      method: Method.fromJson(json['method'] as Map<String, dynamic>),
      ingredients:
          Ingredients.fromJson(json['ingredients'] as Map<String, dynamic>),
      foodPairing: (json['food_pairing'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      brewersTips: json['brewers_tips'] as String,
      contributedBy: json['contributed_by'] as String,
    );

Map<String, dynamic> _$BeerToJson(Beer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'first_brewed': instance.firstBrewed,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'abv': instance.abv,
      'ibu': instance.ibu,
      'target_fg': instance.targetFg,
      'target_og': instance.targetOg,
      'ebc': instance.ebc,
      'srm': instance.srm,
      'ph': instance.ph,
      'attenuation_level': instance.attenuationLevel,
      'volume': instance.volume,
      'boil_volume': instance.boilVolume,
      'method': instance.method,
      'ingredients': instance.ingredients,
      'food_pairing': instance.foodPairing,
      'brewers_tips': instance.brewersTips,
      'contributed_by': instance.contributedBy,
    };

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => Ingredients(
      malt: (json['malt'] as List<dynamic>)
          .map((e) => Malt.fromJson(e as Map<String, dynamic>))
          .toList(),
      hops: (json['hops'] as List<dynamic>)
          .map((e) => Hop.fromJson(e as Map<String, dynamic>))
          .toList(),
      yeast: json['yeast'] as String,
    );

Map<String, dynamic> _$IngredientsToJson(Ingredients instance) =>
    <String, dynamic>{
      'malt': instance.malt,
      'hops': instance.hops,
      'yeast': instance.yeast,
    };

Hop _$HopFromJson(Map<String, dynamic> json) => Hop(
      name: json['name'] as String,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      add: json['add'] as String,
      attribute: json['attribute'] as String,
    );

Map<String, dynamic> _$HopToJson(Hop instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'add': instance.add,
      'attribute': instance.attribute,
    };

Amount _$AmountFromJson(Map<String, dynamic> json) => Amount(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$AmountToJson(Amount instance) => <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };

Malt _$MaltFromJson(Map<String, dynamic> json) => Malt(
      name: json['name'] as String,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaltToJson(Malt instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };

Volume _$VolumeFromJson(Map<String, dynamic> json) => Volume(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$VolumeToJson(Volume instance) => <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
      mashTemp: (json['mash_temp'] as List<dynamic>)
          .map((e) => MashTemp.fromJson(e as Map<String, dynamic>))
          .toList(),
      fermentation:
          Fermentation.fromJson(json['fermentation'] as Map<String, dynamic>),
      twist: json['twist'],
    );

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
      'mash_temp': instance.mashTemp,
      'fermentation': instance.fermentation,
      'twist': instance.twist,
    };

MashTemp _$MashTempFromJson(Map<String, dynamic> json) => MashTemp(
      temp: Temperature.fromJson(json['temp'] as Map<String, dynamic>),
      duration: json['duration'] as int?,
    );

Map<String, dynamic> _$MashTempToJson(MashTemp instance) => <String, dynamic>{
      'temp': instance.temp,
      'duration': instance.duration,
    };

Fermentation _$FermentationFromJson(Map<String, dynamic> json) => Fermentation(
      temp: Temperature.fromJson(json['temp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FermentationToJson(Fermentation instance) =>
    <String, dynamic>{
      'temp': instance.temp,
    };

Temperature _$TemperatureFromJson(Map<String, dynamic> json) => Temperature(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };
