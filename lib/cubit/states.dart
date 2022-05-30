abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsChangeBotNavBar extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{

  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsLoadingBusinessState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsLoadingSportsState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsLoadingScienceState extends NewsStates{}

class NewsLoadingSearchState extends NewsStates{}

class NewsGetSearchState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{}

class AppChangeModeState extends NewsStates{}


