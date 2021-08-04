import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:socialapp/moules/login_screen/login.dart';
import 'package:socialapp/moules/register_screen/cubit/cubit_register.dart';
import 'package:socialapp/moules/register_screen/cubit/states_register.dart';

import '../../component.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) =>SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
        listener: (context, state) {
          // if(state is SocialLoginSuccessState){
          //   if(state.loginModel.status){
          //     print(state.loginModel.message);
          //     print(state.loginModel.date.token);
          //   }else{
          //     print(state.loginModel.message);
          //     Fluttertoast.showToast(
          //         msg: "This is Center Short Toast",
          //         toastLength: Toast.LENGTH_LONG,
          //         gravity: ToastGravity.BOTTOM,
          //         timeInSecForIosWeb: 5,
          //         backgroundColor: Colors.red,
          //         textColor: Colors.white,
          //         fontSize: 16.0
          //     );
          //   }
          // }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () =>navigateTo(context, LoginScreen()) ,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline5,
                        ),
                        Text(
                          'Register now to browse our hot offer',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                            controller: null,
                            type: TextInputType.name,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter your name';
                              }
                            },
                            label: 'Name',
                            prefix: Icons.person),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter your email address';
                              }
                            },
                            label: 'Email Address',
                            prefix: Icons.email),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter your Password';
                            }
                          },
                          onSubmit: (v) {
                            if (formKey.currentState.validate()) {
                              // SocialCubit.get(context).userLogin(
                              //     email: emailController.text,
                              //     password: passwordController.text
                              // );
                            }
                          },
                          suffix: SocialRegisterCubit.get(context).suffix,
                          isPassword:SocialRegisterCubit.get(context).isPasswordShown,
                          suffixPressed: () {
                            SocialRegisterCubit.get(context).changeRegisterPasswordVisablity();
                          },
                          label: 'Password',
                          prefix: Icons.lock,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                            type: TextInputType.phone,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter your Phone';
                              }
                            },
                            label: 'Phone',
                            prefix: Icons.phone,
                            controller: null
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        // defaultButton(
                        //     function: () {
                        //
                        //       ShopCubit.get(context).userLogin(
                        //           email: emailController.text,
                        //           password: passwordController.text);
                        //
                        //     },
                        //     text: 'Login',
                        //     isUpperCase: true),

                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>state is! SocialRegisterLoadingState,
                          widgetBuilder: (context) =>
                              defaultButton(
                                  function: () {
                                    if (formKey.currentState.validate()) {
                                      // SocialCubit.get(context).userLogin(
                                      //     email: emailController.text,
                                      //     password: passwordController.text
                                      // );
                                    }
                                  },
                                  text: 'Register',
                                  isUpperCase: true
                              ),
                          fallbackBuilder: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
