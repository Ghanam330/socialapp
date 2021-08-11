import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/home_layout/cubit/cubit_home.dart';
import 'package:socialapp/modules/home_layout/cubit/states_home.dart';
import 'package:socialapp/modules/new_post/new_post_screen.dart';
import 'package:socialapp/shard/components/component.dart';
import 'package:socialapp/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialHomeCubit, SocialHomeStates>(
      listener: (context, state) {
        if (state is SocialNewPostStates) {
          navigateTo(context, NewPostsScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialHomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: Icon(IconBroken.Notification)),
              IconButton(onPressed: () {}, icon: Icon(IconBroken.Search))
            ],
            title: Text(
              cubit.title[cubit.currentIndex],
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(IconBroken.Home),
              ),
              BottomNavigationBarItem(
                label: 'Chat',
                icon: Icon(IconBroken.Chat),
              ),
              BottomNavigationBarItem(
                label: 'Posts',
                icon: Icon(IconBroken.Paper_Upload),
              ),
              BottomNavigationBarItem(
                label: 'User',
                icon: Icon(IconBroken.Location),
              ),
              BottomNavigationBarItem(
                label: 'Setting',
                icon: Icon(IconBroken.Setting),
              ),
            ],
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }
}
