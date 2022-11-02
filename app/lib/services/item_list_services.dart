import 'package:app/constants.dart';
import 'package:dio/dio.dart';

class ItemListServices {
  Dio dio = Dio();
  String apiUrl = "${AppConstants().url}/item";

  getAllItems() async {
    try {
      return (await dio.get(
        '$apiUrl/getAll',
      ));
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
