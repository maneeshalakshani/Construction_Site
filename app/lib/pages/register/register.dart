import 'package:app/common_widgets/buttons/round_button.dart';
import 'package:app/common_widgets/text_field/text_field_widget.dart';
import 'package:app/constants.dart';
import 'package:app/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                        context.router.push(LoginRoute());
                      },
                      child: Text(
                        'Login',
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
                    'Create Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white
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
                textField(
                    initialValue: '',
                    onChanged: (String val){},
                    validator: (String? val){},
                    label: 'Email',
                    hintText: 'Enter email',
                    context: context
                ),
                roundButton(
                    width: width,
                    onPressed: (){},
                    title: 'Register',
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
