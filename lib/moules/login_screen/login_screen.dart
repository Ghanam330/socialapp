import 'package:flutter/material.dart';

import '../../component.dart';

class LoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'LogIn',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5,
                  ),
                  Text(
                    'Login now to browse our hot offer',
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

                    },
                    label: 'Password',
                    prefix: Icons.lock,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                      function: () {

                      },
                      text: 'Login',
                      isUpperCase: true),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\`t have an account'),
                      defaultTextButton(
                        function: () {

                        },
                        text: 'Register',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
