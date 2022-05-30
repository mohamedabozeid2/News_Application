// ignore_for_file: prefer_const_constructors
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_news_application/cubit/cubit.dart';
import 'package:final_news_application/cubit/states.dart';
import 'package:final_news_application/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget{
  const ScienceScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){} ,
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return articleBuilder(list, context);
      },
    );
  }

}