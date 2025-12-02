import 'package:brewy_app/api/api_service.dart';
import 'package:brewy_app/constant/string_constant.dart';
import 'package:brewy_app/features/favourite/model/favourite_model.dart';
import 'package:brewy_app/features/home/bloc/brew_bloc.dart';
import 'package:brewy_app/features/splash/splash.dart';
import 'package:brewy_app/helper/internet_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityService().initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(BrewFavouriteModelAdapter());
  await Hive.openBox<BrewFavouriteModel>('favourites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => BrewBloc(ApiService()))],
      child: MaterialApp(
        title: StringConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.nunitoSans().fontFamily,
        ),
        home: const Splash(),
      ),
    );
  }
}
