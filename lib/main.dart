// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:final_news_application/cubit/cubit.dart';
import 'package:final_news_application/cubit/states.dart';
import 'package:final_news_application/shared/components/constants.dart';
import 'package:final_news_application/shared/network/local/cache_helper.dart';
import 'package:final_news_application/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/news_layout.dart';
import 'shared/bloc_observer/bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  // if(isDark == null){
  //   CacheHelper.putData(key: 'isDark', value: false);
  // }
  isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final dynamic isDark;

  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()
        ..getsports()
        ..getScience()
        ..changeAppMode(
            fromShared: isDark
        ),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                textTheme: TextTheme(
                    bodyText2: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    titleSpacing: 20.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    actionsIconTheme: IconThemeData(color: Colors.deepOrange)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20.0)),
            darkTheme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    elevation: 20.0,
                    backgroundColor: HexColor("333739"),
                    unselectedItemColor: Colors.grey),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor("333739"),
                appBarTheme: AppBarTheme(
                    titleSpacing: 20.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.black,
                        statusBarIconBrightness: Brightness.light),
                    backgroundColor: HexColor("333739"),
                    titleTextStyle: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                    actionsIconTheme: IconThemeData(color: Colors.deepOrange)),
                textTheme: TextTheme(
                    bodyText2: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Directionality(
                textDirection: TextDirection.ltr, child: NewsLayout()),
          );
        },
      ),
    );
  }
}
