// import 'package:expert_properties/components/foldables_sidebar.dart';
import 'package:expert_properties/bloc/estates/cubit/estate_cubit.dart';
import 'package:expert_properties/bloc/estates/repository/estate_repository.dart';
import 'package:expert_properties/bloc/properties/cubit/property_cubit.dart';
import 'package:expert_properties/bloc/properties/repository/property_repository.dart';
import 'package:expert_properties/bloc/user/cubit/user_cubit.dart';
import 'package:expert_properties/bloc/user/repository/user_repository.dart';
import 'package:expert_properties/bloc/userfavorites/cubit/userfavorites_cubit.dart';
import 'package:expert_properties/bloc/userfavorites/repository/userfavorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expert_properties/routes.dart';

void main() => runApp(Properties());

class Properties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserCubit(UserRepository()),
        ),
        BlocProvider(
          create: (_) => PropertyCubit(PropertyRepo()),
        ),
        BlocProvider(
          create: (_) => EstateCubit(EstateRepository()),
        ),
        BlocProvider(
          create: (_) => UserfavoritesCubit(UserFavRepository()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0a0a0a),
          scaffoldBackgroundColor: Color(0xFF0a0a0a),
        ),
        initialRoute: '/splash',
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
