abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsBottonNavState extends NewsStates{}

class NewsLoadingState extends NewsStates{}

class NewsBusinessSuccessState extends NewsStates{}

class NewsBusinessErrorState extends NewsStates
{
  final String error;
  NewsBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}

class NewsSportsSuccessState extends NewsStates{}

class NewsSportsErrorState extends NewsStates
{
  final String error;
  NewsSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates{}

class NewsScienceSuccessState extends NewsStates{}

class NewsScienceErrorState extends NewsStates
{
  final String error;
  NewsScienceErrorState(this.error);
}

class NewsModeChange extends NewsStates{}