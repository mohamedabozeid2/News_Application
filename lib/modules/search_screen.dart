import 'package:final_news_application/cubit/cubit.dart';
import 'package:final_news_application/cubit/states.dart';
import 'package:final_news_application/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchScreen extends StatelessWidget{
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state){
        var list = NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(
            title: Text("Search"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    type: TextInputType.text,
                    controller: searchController,
                    validator: (value){
                      if(value.isEmpty)
                      {
                        return "Search must not be emptu";
                      }
                      else
                        return null;
                    },
                    label: "Search",
                    prefix: Icon(Icons.search),
                    onChanged: (value){
                      print("$value");
                      NewsCubit.get(context).getSearch(value);
                    }
                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true)),
            ],
          ),
        );
      },
      listener: (context, state){},
    );
  }

}