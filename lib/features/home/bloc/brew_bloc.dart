import 'dart:convert';

import 'package:brewy_app/api/api_service.dart';
import 'package:brewy_app/api/api_url.dart';
import 'package:brewy_app/features/favourite/model/favourite_model.dart';
import 'package:brewy_app/features/favourite/view_model/favourite_brew_view_model.dart';
import 'package:brewy_app/features/home/bloc/brew_event.dart';
import 'package:brewy_app/features/home/bloc/brew_state.dart';
import 'package:brewy_app/features/home/model/brew_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrewBloc extends Bloc<BrewEvent, BrewState> {
  final ApiService service;
  BrewBloc(this.service) : super(BrewInitial()) {
    on<LoadBrew>((event, emit) async {
      event.pageNo;
      emit(BrewLoading());
      await Future.delayed(const Duration(seconds: 3));
      try {
        final data = await service.getData("?page=${event.pageNo}&per_page=10");
        final list = brewModelFromJson(jsonEncode(data?.data));
        final favService = FavouriteService();
        for (var brew in list) {
          brew.isFavourite = favService.isFavourite(brew.id ?? '');
        }
        emit(BrewLoaded(list));
      } catch (e) {
        emit(BrewError(e.toString()));
      }
    });
    on<BrewFavourite>((event, emit) {
      if (state is BrewLoaded) {
        final current = state as BrewLoaded;

        final updatedList = current.brewData.map((brew) {
          if (brew.id == event.brewID) {
            FavouriteService().toggleFavourite(
              BrewFavouriteModel(
                id: brew.id,
                isFavourite: !brew.isFavourite,
                name: brew.name,
              ),
            );
            return brew.copyWith(isFavourite: !brew.isFavourite);
          }
          return brew;
        }).toList();

        emit(BrewLoaded(updatedList));
      }
    });
    on<LoadPagination>((event, emit) async {
      try {
        final data = await service.getData("?page=${event.pageNo}&per_page=10");
        final newList = brewModelFromJson(jsonEncode(data?.data));
        final favService = FavouriteService();
        for (var brew in newList) {
          brew.isFavourite = favService.isFavourite(brew.id ?? '');
        }
        if (state is BrewLoaded) {
          final oldList = (state as BrewLoaded).brewData;
          emit(BrewLoaded([...oldList, ...newList]));
        } else {
          emit(BrewLoaded(newList));
        }
      } catch (e) {
        emit(BrewError(e.toString()));
      }
    });
  }
}
