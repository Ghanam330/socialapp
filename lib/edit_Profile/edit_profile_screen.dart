
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/home_layout/cubit/cubit_home.dart';
import 'package:socialapp/modules/home_layout/cubit/states_home.dart';
import 'package:socialapp/shard/components/component.dart';
import 'package:socialapp/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialHomeCubit, SocialHomeStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var userModel = SocialHomeCubit.get(context).userModel;
        var profileImage = SocialHomeCubit.get(context).profileImage;


        nameController.text=userModel.name;
        bioController.text=userModel.bio;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Post',
            actions: [
              defaultTextButton(function: () {}, text: 'Update'),
              SizedBox(
                width: 15.0,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 140.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0)),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage('${userModel.cover}'))),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16.0,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 64.0,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage:
                                 profileImage == null ? NetworkImage('${userModel.image}') : 
                              FileImage(profileImage),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                SocialHomeCubit.get(context).getProfileImage();
                              },
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 16.0,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'name must not be emty';
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: IconBroken.User),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormField(
                    controller: bioController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Bio must not be emty';
                      }
                      return null;
                    },
                    label: 'Bio',
                    prefix: IconBroken.Info_Square),
              ],
            ),
          ),
        );
      },
    );
  }
}
