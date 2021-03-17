import 'package:energy_app/model/user.dart';
import 'package:energy_app/repositories/user/user_local_repository.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _loginController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  LocalUserRepository _localUserRepository = LocalUserRepository();

  _loadLoginPassword(LocalUserRepository _localUserRepository) async {
    await _localUserRepository.initialize();
    final login = await _localUserRepository.getLogin();
    if (login != null) {
      _loginController.text = login;
    }
    final password = await _localUserRepository.getLogin();
    if (password != null) {
      _passwordController.text = password;
    }
  }

  @override
  void initState() {
     super.initState();

     _loadLoginPassword(_localUserRepository);
  }

  void _onPressLogin(User user) async{
    final hasLogin = await _localUserRepository.hasLogin() as bool;
    if(hasLogin){
      await _localUserRepository.delete();
    }
    await _localUserRepository.saveLogin(_loginController.text);
    await _localUserRepository.savePassword(_passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
           children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('assets/logo.png').image,
                  scale: 2.0,
                )
              ),
              height: 150,
            ),
            Container(
              height: size.height/2,
              color: Colors.greenAccent,
              child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          onSubmitted: (value) {
                            _loginController.text = value;
                          },
                          controller: _loginController,
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                          decoration: InputDecoration(
                            hintText: "Login",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blueAccent,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          onSubmitted: (value) {
                            _passwordController.text = value;
                          },
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                          decoration: InputDecoration(
                            hintText: "Сыр соз",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blueAccent,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: ()  {
                          User user = new User(
                            login: _loginController.text,
                            password: _passwordController.text,
                          );

                          _onPressLogin(user);
                        },
                        style: ButtonStyle(
                          elevation:
                              MaterialStateProperty.resolveWith((getElevation)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(150.0, 40.0),
                          ),
                        ),
                        child: Text(
                          'Кируу',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation:
                              MaterialStateProperty.resolveWith((getElevation)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          minimumSize: MaterialStateProperty.all<Size>(
                            Size(150.0, 40.0),
                          ),
                        ),
                        child: Text(
                          'Артка',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            )
          ],
        ),
      ),
    );
  }

  double getElevation(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = {
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return 10;
    }
    return 40;
  }
}
