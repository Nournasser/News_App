import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/module.spots/soprts_screen.dart';
import 'package:news_app/modules/modules.business/business_screen.dart';
import 'package:news_app/modules/modules.science/science_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/network/sharedprefrunce/shared_prefrunce.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business),
        label: 'Business'
    ),
    BottomNavigationBarItem(icon: Icon(Icons.sports),
        label: 'Sports'
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science),
        label: 'Science'
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeButtomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1)
      getSports();
    if(index == 2)
      getScience();
    emit(NewsBottonNavState());
  }

  List<dynamic> Business = [];

  void getBusiness()
  {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
        query: {'country' : 'eg',
        'category' : 'business',
        'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca',},
    ).then((value)
    {
      Business = value.data['articles'];
      emit(NewsBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> Sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    if(Sports.length == 0)
      {
        DioHelper.getData(url: 'v2/top-headlines',
          query: {'country' : 'eg',
            'category' : 'sports',
            'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca',},
        ).then((value)
        {
          Sports = value.data['articles'];
          emit(NewsSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsSportsErrorState(error.toString()));
        });
      }
    else
      {
        emit(NewsSportsSuccessState());
      }

  }


  List<dynamic> Science = [];

  void getScience()
   {
    emit(NewsGetScienceLoadingState());

    if(Science.length == 0)
      {
        DioHelper.getData(url: 'v2/top-headlines',
          query: {'country' : 'eg',
            'category' : 'science',
            'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca',},
        ).then((value)
        {
          Science = value.data['articles'];
          emit(NewsScienceSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsScienceErrorState(error.toString()));
        });
      }
    else
      {
        emit(NewsScienceSuccessState());
      }
  }

  bool isDark = false;

  void changeTheme({bool? sharedPref})
  {
    // ignore: unnecessary_null_comparison
    if(sharedPref == null)
      isDark = sharedPref!;
    else
      isDark = !isDark;
    CashHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(NewsModeChange());
    });
  }
  }
