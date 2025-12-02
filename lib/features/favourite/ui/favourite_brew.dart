import 'package:brewy_app/features/favourite/view_model/favourite_brew_view_model.dart';
import 'package:brewy_app/features/home/bloc/brew_bloc.dart';
import 'package:brewy_app/features/home/bloc/brew_state.dart';
import 'package:brewy_app/features/home/model/brew_model.dart';
import 'package:brewy_app/features/home/ui/brew_item.dart';
import 'package:brewy_app/widgets/app_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBrew extends StatefulWidget {
  const FavouriteBrew({super.key});

  @override
  State<FavouriteBrew> createState() => _FavouriteBrewState();
}

class _FavouriteBrewState extends State<FavouriteBrew> {
  final favourites = FavouriteService().getFavouriteList();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<BrewBloc>().state;
    List<BrewModel> favourites = [];
    if (state is BrewLoaded) {
      favourites = FavouriteService().getFavouriteBrews(state.brewData);
    }
    return AppSafeArea(
      child: Scaffold(
        body: favourites.isEmpty
            ? const Center(
                child: Text(
                  "No favourites yet!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: favourites.length,
                itemBuilder: (context, index) {
                  final item = favourites[index];

                  return BrewListItem(item: item);
                },
              ),
      ),
    );
  }
}
