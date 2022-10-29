import 'package:app/common_widgets/buttons/round_button.dart';
import 'package:app/common_widgets/text_field/text_field_widget.dart';
import 'package:app/constants.dart';
import 'package:app/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppConstants().backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        context.router.push(SignUpRoute());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppConstants().linkColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 55),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.black
                    ),
                  ),
                ),
                textField(
                    label: 'User Name',
                    onChanged: (String val){},
                    initialValue: '',
                    validator: (String? val){},
                    hintText: 'Enter username',
                    context: context
                ),
                textField(
                    initialValue: '',
                    onChanged: (String val){},
                    validator: (String? val){},
                    label: 'Password',
                    hintText: 'Enter password',
                    context: context
                ),
                roundButton(
                    width: width,
                    onPressed: (){
                      //context.router.push(AdminTabControllerRoute());
                    },
                    title: 'Login',
                    topMargin: 30.0
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
