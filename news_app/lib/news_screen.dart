import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class news_screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {} ,
        builder: (context, state) {

          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'News App'
              ),
              actions: [
                IconButton(onPressed: (){},
                    icon: Icon(
                      Icons.search
                    )),
                IconButton(onPressed: ()
                {
                  NewsCubit.get(context).changeTheme();
                },
                    icon: Icon(
                        Icons.brightness_4
                    ))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeButtomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
