import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states_register.dart';





class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  // void userLogin({@required String email, @required String password}) {
  //   emit(SocialLoginLoadingState());
  //
  //   DioHelper.postData(url: LOGIN, date: {'email': email, 'password': password})
  //       .then((value) {
  //     print(value.data);
  //     loginModel = LoginModel.fromJson(value.data);
  //     print(loginModel.status);
  //     print(loginModel.message);
  //
  //     emit(SocialLoginSuccessState(loginModel));
  //   }).catchError((onError) {
  //     print(onError.toString());
  //     emit(SocialLoginErrorState(onError.toString()));
  //   });
  // }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changeRegisterPasswordVisablity() {
    isPasswordShown = !isPasswordShown;
    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordState());
  }
}
