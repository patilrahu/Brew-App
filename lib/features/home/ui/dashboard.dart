import 'package:brewy_app/features/home/bloc/brew_bloc.dart';
import 'package:brewy_app/features/home/bloc/brew_event.dart';
import 'package:brewy_app/features/home/bloc/brew_state.dart';
import 'package:brewy_app/features/home/ui/brew_detail.dart';
import 'package:brewy_app/features/home/ui/brew_item.dart';
import 'package:brewy_app/helper/navigation_helper.dart';
import 'package:brewy_app/widgets/app_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  @override
  void initState() {
    super.initState();
    context.read<BrewBloc>().add(LoadBrew());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        context.read<BrewBloc>().add(LoadPagination(pageNo: page));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        body: BlocConsumer<BrewBloc, BrewState>(
          builder: (context, state) {
            if (state is BrewLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 2,
                ),
              );
            }
            if (state is BrewLoaded) {
              return ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: state.brewData.length,
                itemBuilder: (context, index) {
                  final item = state.brewData[index];

                  return BrewListItem(item: item);
                },
              );
            }
            return Center(
              child: Text(
                "No brew data found!",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            );
          },
          listener: (context, state) {
            if (state is BrewError) {
              Text(state.message);
            }
          },
        ),
      ),
    );
  }
}
