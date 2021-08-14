import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/home_layout/cubit/cubit_home.dart';
import 'package:socialapp/modules/home_layout/cubit/states_home.dart';
import 'package:socialapp/shard/components/component.dart';

class EmailVerifcation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialHomeCubit, SocialHomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text('New Feed'),
              shadowColor: Colors.white,
            ),
            body: ConditionalBuilder(
              condition: SocialHomeCubit.get(context).userModel != null,
              builder: (context) {
                var model = SocialHomeCubit.get(context).userModel;

                return Column(
                  children: [
                    // if (model.isEmailVerified)
                    if(!FirebaseAuth.instance.currentUser.emailVerified)
                      Container(
                        color: Colors.amber.withOpacity(.6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: Text('please verify your email ')),
                              SizedBox(
                                width: 15,
                              ),
                              defaultTextButton(
                                  function: () {
                                    FirebaseAuth.instance.currentUser
                                        .sendEmailVerification()
                                        .then((value) {
                                      showToast(
                                          text: 'check your mail',
                                          state: ToastStates.SUCCESS);
                                    }).catchError((onError) {

                                    });
                                  },
                                  text: 'Send')
                            ],
                          ),
                        ),
                      )
                  ],
                );
              },
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }
}
