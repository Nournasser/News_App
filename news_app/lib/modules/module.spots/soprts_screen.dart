import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../shared/componants/componants.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit , NewsStates>(listener: (context, state) {},
      builder: (context, state) {

        var list = NewsCubit.get(context).Sports;

        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticleItem(list[index], context),
            separatorBuilder: (context, index) => MyDivier(),
            itemCount: 10);
      },);
  }
}
