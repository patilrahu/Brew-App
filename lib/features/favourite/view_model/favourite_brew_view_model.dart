import 'package:brewy_app/features/favourite/model/favourite_model.dart';
import 'package:brewy_app/features/home/model/brew_model.dart';
import 'package:hive/hive.dart';

class FavouriteService {
  final Box<BrewFavouriteModel> favBox = Hive.box<BrewFavouriteModel>(
    'favourites',
  );

  void toggleFavourite(BrewFavouriteModel brew) {
    if (favBox.containsKey(brew.id)) {
      favBox.delete(brew.id);
    } else {
      favBox.put(brew.id, brew);
    }
  }

  bool isFavourite(String id) {
    return favBox.containsKey(id);
  }

  List<BrewFavouriteModel> getFavouriteList() {
    return favBox.values.toList();
  }

  List<BrewModel> getFavouriteBrews(List<BrewModel> allBrews) {
    final favouriteIds = getFavouriteList().map((f) => f.id).toList();

    return allBrews.where((brew) => favouriteIds.contains(brew.id)).toList();
  }
}
