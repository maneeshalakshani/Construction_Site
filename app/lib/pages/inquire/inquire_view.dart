import 'package:app/common_data.dart';
import 'package:app/common_widgets/appBar.dart';
import 'package:app/common_widgets/buttons/normal_button.dart';
import 'package:app/common_widgets/text_field/text_field_widget.dart';
import 'package:app/common_widgets/title.dart';
import 'package:app/constants.dart';
import 'package:app/pages/order/order_description.dart';
import 'package:app/routes/routes.gr.dart';
import 'package:app/services/inquiry_services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InquireView extends StatefulWidget {
  InquireView({Key? key, required this.appCommonData, required this.orderID}) : super(key: key);
  AppCommonData appCommonData;
  String orderID;

  @override
  _InquireViewState createState() => _InquireViewState();
}

class _InquireViewState extends State<InquireView> {
  final _formKey = GlobalKey<FormState>(); //For form
  var message;
  var title;

  void addInquiry({required String orderID, required String title, required String message}){
    InquiryServices().addInquiry(orderID, title, message).then((val){
      if(val.data['message'] == 'Inquiry Added'){
        Fluttertoast.showToast(
          msg: 'Inquiry Added',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.black
        );
        context.router.push(BottomNavRoute(appCommonData: widget.appCommonData));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(context: context, appCommonData: widget.appCommonData),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderTitle(
                  title: 'Your Inquiry',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: OrderDescription(
                    description: 'This inquiry is about order which holds order ID '
                        'as ${widget.orderID}. The staff will review these orders and '
                        'contact you as soon as possible for further clarifications if '
                        'required',
                  ),
                ),
                textField(
                  initialValue: '',
                  label: 'Inquire Title',
                  hintText: 'Please enter inquire title',
                  labelColor: Colors.black,
                  context: context,
                  validator: true,
                  errMsg: 'Please Enter Title',
                  onChanged: (val){
                    title = val;
                  },
                ),
                textField(
                  initialValue: '',
                  label: 'Inquire Message',
                  hintText: 'Please enter inquire message',
                  labelColor: Colors.black,
                  maxLines: 10,
                  context: context,
                  validator: true,
                  errMsg: 'Please Enter Message',
                  onChanged: (val){
                    message = val;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    normalButton(
                        width: 50,
                        title: 'Add Inquiry',
                        textColor: Colors.white,
                        btnColor: AppConstants().cardTitleColor,
                        onPressed: (){
                          if (_formKey.currentState!.validate()){
                            addInquiry(orderID: widget.orderID, title: title, message: message);
                          }
                        }
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
