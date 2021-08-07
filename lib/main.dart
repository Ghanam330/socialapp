import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialapp/shard/blocobserver.dart';
import 'package:socialapp/modules/home_layout/cubit/states_home.dart';
import 'package:socialapp/shard/components/component.dart';

import 'modules/home_layout/cubit/cubit_home.dart';
import 'modules/home_layout/social_layout.dart';
import 'modules/login_screen/login.dart';
import 'network/local/cache_helper.dart';
import 'shard/components/constants.dart';
import 'styles/themes.dart';




void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer=MyBlocObserver();
  SharedPreferences.getInstance();
  await CacheHelper.init();
  Widget widget;

  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = LoginScreen();
  }

  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    // In debug mode, use the normal error widget which shows
    // the error message:
    if (inDebug) return ErrorWidget(details.exception);
    // In release builds, show a yellow-on-blue message instead:
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error! ${details.exception}',
        style: TextStyle(color: Colors.yellow),
        textDirection: TextDirection.ltr,
      ),
    );
  };
  runApp(MyApp(
    startWidget: widget,
  ));

}

class MyApp extends StatelessWidget {

  final Widget startWidget;

  MyApp({
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialHomeCubit()
        ..getUserDate(),
        // ..handleScroll(),
      // create: (BuildContext context) => AppCubit()..getUserData(),
      child: BlocConsumer<SocialHomeCubit,SocialHomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            // themeMode: ThemeMode.light,
            theme: lightTheme,
            home: startWidget,
          );

        },
      ),
    );
  }
}

