import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/models/user_model.dart';
import 'package:socialapp/modules/chats/chats_screen.dart';
import 'package:socialapp/modules/feeds/feeds_screen.dart';
import 'package:socialapp/modules/settings/setting_screen.dart';
import 'package:socialapp/modules/user_screen/user_screen.dart';
import 'package:socialapp/shard/components/constants.dart';
import 'states_home.dart';

class SocialHomeCubit extends Cubit<SocialHomeStates> {
  SocialHomeCubit() : super(SocialHomeInitialState());

  static SocialHomeCubit get(context) => BlocProvider.of(context);

  UserModel model;

  void getUserDate() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) => {
              model = UserModel.fromJson(value.data()),
              emit(SocialGetUserSuccessState()),
            })
        .catchError((error) {});
  }

  handleScroll() {}

  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    UserScreen(),
    SettingScreen(),
  ];

  List<String>title=[
    'Home',
    'Chats',
    'Users',
    'Setting'
  ];
  void changeBottomNav(int index){
    currentIndex =index;
    emit(SocialChangeBottomNavStates());
  }
}
