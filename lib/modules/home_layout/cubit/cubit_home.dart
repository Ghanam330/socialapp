import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/models/user_model.dart';
import 'package:socialapp/modules/chats/chats_screen.dart';
import 'package:socialapp/modules/feeds/feeds_screen.dart';
import 'package:socialapp/modules/new_post/new_post_screen.dart';
import 'package:socialapp/modules/settings/setting_screen.dart';
import 'package:socialapp/modules/user_screen/user_screen.dart';
import 'package:socialapp/shard/components/constants.dart';
import 'states_home.dart';

class SocialHomeCubit extends Cubit<SocialHomeStates> {
  SocialHomeCubit() : super(SocialHomeInitialState());

  static SocialHomeCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

  void getUserDate() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) => {
              userModel = UserModel.fromJson(value.data()),
              emit(SocialGetUserSuccessState()),
            })
        .catchError((error) {});
  }

  handleScroll() {}

  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    NewPostsScreen(),
    UserScreen(),
    SettingScreen(),
  ];

  List<String>title=[
    'Home',
    'Chats',
    'Users',
    'post',
    'Setting'
  ];
  void changeBottomNav(int index){

    if(index ==2){
      emit(SocialNewPostStates());
    }else{
      currentIndex =index;
      emit(SocialChangeBottomNavStates());
    }

  }


  File profileImage;
  final picker = ImagePicker();
  Future<Void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No image select');
      emit(SocialSocialProfileImagePickedErrorState());
    }
  }
}
