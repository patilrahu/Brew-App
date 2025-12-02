import 'package:brewy_app/features/favourite/view_model/favourite_brew_view_model.dart';
import 'package:brewy_app/features/home/bloc/brew_bloc.dart';
import 'package:brewy_app/features/home/bloc/brew_event.dart';
import 'package:brewy_app/features/home/model/brew_model.dart';
import 'package:brewy_app/features/home/ui/brew_detail.dart';
import 'package:brewy_app/helper/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrewListItem extends StatelessWidget {
  final BrewModel item;

  const BrewListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationHelper().pushNavigation(context, BrewDetail(brewData: item));
      },

      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.name ?? "",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<BrewBloc>().add(BrewFavourite(item.id ?? ''));
                },
                icon: Icon(
                  item.isFavourite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
