import 'package:app/constants.dart';
import 'package:dio/dio.dart';

class InquiryServices {
  Dio dio = Dio();
  String apiUrl = "${AppConstants().url}/inquiry";

  addInquiry(String orderID, String title, String message) async {
    try {
      return await dio.post(
        '$apiUrl/add',
        data: {
          'orderID': orderID,
          'title': title,
          'message': message
        }
      );
    } on DioError catch (e) {
      print(e);
    }
  }

  getItem(String itemID) async {
    try {
      return await dio.get('$apiUrl/get/$itemID');
    } on DioError catch (e) {
      print(e);
    }
  }
}
