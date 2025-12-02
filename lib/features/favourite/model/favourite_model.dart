import 'package:hive/hive.dart';

part 'favourite_model.g.dart';

@HiveType(typeId: 1)
class BrewFavouriteModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  bool isFavourite;

  BrewFavouriteModel({this.id, this.name, this.isFavourite = false});
}
