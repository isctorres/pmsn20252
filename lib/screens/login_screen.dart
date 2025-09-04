import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController conUser = TextEditingController();
  TextEditingController conPwd = TextEditingController();
  bool isValidating = false;

  @override
  Widget build(BuildContext context) {

    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: InputDecoration(
        hintText: 'Correo electrónico'
      ),
    );

    final txtPwd = TextField(
      obscureText: true,
      controller: conPwd,
      decoration: InputDecoration(
        hintText: 'Contraseña'
      ),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/fondo2.jpg")
          ) 
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 200,
              child: Text('Mandalorian',
                style: TextStyle(color: Colors.white, fontSize: 35, fontFamily: 'Jedi'),
              ),
            ),
            Positioned(
              bottom: 80,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    txtUser,
                    txtPwd,
                    IconButton(
                      onPressed: (){
                        isValidating = true;
                        setState(() {});
                        Future.delayed(Duration(milliseconds: 3000)).then(
                          (value) => Navigator.pushNamed(context, '/home'),
                        );
                      }, 
                      icon: Icon(Icons.login, size: 40,)
                    )
                  ],
                ),
              )
            ),
            Positioned(
              top: 300,
              child: isValidating 
                ? Lottie.asset('assets/loading2.json',height: 200)
                : Container()
            )
          ],
        ),
      ),
    );
  }
}