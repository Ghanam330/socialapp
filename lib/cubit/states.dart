
abstract class SocialStates {}
class SocialInitialState extends SocialStates{}
class SocialLoginLoadingState extends SocialStates{}
class SocialLoginSuccessState extends SocialStates{
}
class SocialLoginErrorState extends SocialStates {
  final String error;

  SocialLoginErrorState(this.error);
}
class SocialChangePasswordState extends SocialStates{}

