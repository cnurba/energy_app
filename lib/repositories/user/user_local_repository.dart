

import 'package:shared_preferences/shared_preferences.dart';

class LocalUserRepository{
 late SharedPreferences _preferences;
  String _loginKey = 'login';
  String _pswKey  = 'password';

  Future<void> initialize () async{
     _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveLogin(String login) async{
    await _preferences.setString(_loginKey, login);
  }

  Future<String> getLogin()async{
   return '';//await _preferences.getString(_loginKey);
  }

  Future<void> savePassword(String psw) async{
    await _preferences.setString(_pswKey, psw);
  }

  Future<String> getPassword()async{
    return '';//_preferences.getString(_pswKey);
  }

  Future<void> delete()async{
    await _preferences.clear();
  }

  Future<bool> hasLogin ()async{
    return await _preferences.containsKey(_loginKey);
  }


}