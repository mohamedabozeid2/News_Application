// ignore_for_file: prefer_const_constructors
import 'package:final_news_application/cubit/states.dart';
import 'package:final_news_application/modules/business_screen.dart';
import 'package:final_news_application/modules/science_screen.dart';
import 'package:final_news_application/modules/settings_screen.dart';
import 'package:final_news_application/modules/sports_screen.dart';
import 'package:final_news_application/shared/network/local/cache_helper.dart';
import 'package:final_news_application/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "science",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];

  void changeBottomNavBar(index) {
    currentIndex = index;
    /*if(index == 1)
      getsports();
    else
      getScience();*/
    emit(NewsChangeBotNavBar());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getBusiness() {
    emit(NewsLoadingBusinessState());

    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "business",
      "apiKey": "630419e429614eeba4a862f027042e42",
    }).then((value) {
      //print(value.data['articles'][0]['title'].toString());
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getsports() {
    emit(NewsLoadingSportsState());

    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "Sports",
      "apiKey": "630419e429614eeba4a862f027042e42",
    }).then((value) {
      //print(value.data['articles'][0]['title'].toString());
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  void getScience() {
    emit(NewsLoadingScienceState());

    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category": "science",
      "apiKey": "630419e429614eeba4a862f027042e42",
    }).then((value) {
      //print(value.data['articles'][0]['title'].toString());
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }

    CacheHelper.putData(key: "isDark", value: isDark).then((value) {
      emit(AppChangeModeState());
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsLoadingSearchState());

    DioHelper.getData(url: "v2/everything", query: {
      "q": "$value",
      "apiKey": "630419e429614eeba4a862f027042e42"
    }).then((value) {
      search = value.data['articles'];
      print(search);
      emit(NewsGetSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState());
    });
  }
}
