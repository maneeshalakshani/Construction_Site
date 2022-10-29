import 'package:app/common_widgets/buttons/round_button.dart';
import 'package:app/common_widgets/text_field/text_field_widget.dart';
import 'package:app/constants.dart';
import 'package:app/routes/routes.gr.dart';
import 'package:app/services/auth_services.dart';
import 'package:app/services/item_list_services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late String email;
  late String password;
  final _formKey = GlobalKey<FormState>(); //For form

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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      textField(
                          label: 'Email',
                          onChanged: (String val){
                            email = val;
                          },
                          initialValue: '',
                          validator: (String? val){},
                          hintText: 'Enter email',
                          context: context
                      ),
                      textField(
                          initialValue: '',
                          onChanged: (String val){
                            password = val;
                          },
                          validator: (String? val){},
                          label: 'Password',
                          hintText: 'Enter password',
                          context: context
                      ),
                      roundButton(
                          width: width,
                          onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              AuthenticationServices().login(email, password).then((val){
                                if (val.data['status'] == 'OK') {
                                  context.router.push(ItemListRoute());
                                }else{
                                  Fluttertoast.showToast(
                                    msg: val.data['error'],
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red[900],
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                }
                              });
                            }
                          },
                          title: 'Login',
                          topMargin: 30.0
                      ),
                    ],
                  ),
                ),
                // textField(
                //     label: 'User Name',
                //     onChanged: (String val){
                //
                //     },
                //     initialValue: '',
                //     validator: (String? val){},
                //     hintText: 'Enter username',
                //     context: context
                // ),
                // textField(
                //     initialValue: '',
                //     onChanged: (String val){},
                //     validator: (String? val){},
                //     label: 'Password',
                //     hintText: 'Enter password',
                //     context: context
                // ),
                // roundButton(
                //     width: width,
                //     onPressed: (){
                //       //context.router.push(AdminTabControllerRoute());
                //     },
                //     title: 'Login',
                //     topMargin: 30.0
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
