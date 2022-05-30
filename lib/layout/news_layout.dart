// ignore_for_file: prefer_const_constructors
import 'package:final_news_application/cubit/cubit.dart';
import 'package:final_news_application/cubit/states.dart';
import 'package:final_news_application/modules/search_screen.dart';
import 'package:final_news_application/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(onPressed: () {
                navigateTo(context, SearchScreen());
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: () {
                NewsCubit.get(context).changeAppMode();
              }
                  , icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          body: NewsCubit.get(context)
              .screens[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            currentIndex: NewsCubit.get(context).currentIndex,
            onTap: (value) {
              NewsCubit.get(context).changeBottomNavBar(value);
            },
          ),
        );
      },
    );
  }
}
