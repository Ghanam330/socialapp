
abstract class SocialHomeStates {}
class SocialHomeInitialState extends SocialHomeStates{}
class SocialGetUserLoadingState extends SocialHomeStates{}
class SocialGetUserSuccessState extends SocialHomeStates{}

class SocialGetUserErrorState extends SocialHomeStates {
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavStates extends SocialHomeStates{}


