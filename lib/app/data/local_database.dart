
import 'package:nb_utils/nb_utils.dart';
import 'package:what_we_eat/app/models/UserModel.dart';

class LocalDatabase {

  LocalDatabase._();

  static const userName = 'UserName';
  static const isLogged = 'IsLogged';
  static const isFirsTime = 'IsFirstTime';
  static const userEmail = 'UserEmail';
  static const userCreated = 'UserCreated';
  static const userToken = 'Token';

static void saveUser(UserModel user) async{
   await setValue(userName, user.user!.name);
   await setValue(isLogged, true);
    await setValue(userEmail, user.user!.email);
    await setValue(userCreated, user.user!.createdAt);
    await setValue(userToken, user.token);


 }

 static Future<UserModel> getUser() async {
    String name = getStringAsync(userName);
    String email = getStringAsync(userEmail);
    String created = getStringAsync(userCreated);
    String token = getStringAsync(userToken);
    return UserModel(user: User(name: name, email: email, createdAt: created), token: token);

 }

  static void deleteUser() async {
        await removeKey(userName);
        await setValue(isLogged, false);
        await removeKey(userEmail);
        await removeKey(userCreated);
        await removeKey(userToken);

  }


}