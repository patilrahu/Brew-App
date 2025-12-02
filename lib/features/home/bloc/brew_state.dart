import 'package:brewy_app/features/home/model/brew_model.dart';

abstract class BrewState {}

class BrewInitial extends BrewState {}

class BrewLoading extends BrewState {}

class BrewLoaded extends BrewState {
  final List<BrewModel> brewData;
  BrewLoaded(this.brewData);
}

class BrewError extends BrewState {
  final String message;
  BrewError(this.message);
}
