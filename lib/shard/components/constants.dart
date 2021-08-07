import 'package:socialapp/modules/login_screen/login.dart';
import 'package:socialapp/network/local/cache_helper.dart';
import 'component.dart';


void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      navigateAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}


String token = '';

String uId = '';