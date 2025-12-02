abstract class BrewEvent {}

class LoadBrew extends BrewEvent {
  final int pageNo;
  LoadBrew({this.pageNo = 1});
}

class LoadPagination extends BrewEvent {
  final int pageNo;
  LoadPagination({this.pageNo = 1});
}

class BrewFavourite extends BrewEvent {
  final String brewID;
  BrewFavourite(this.brewID);
}
