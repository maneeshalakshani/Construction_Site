import 'package:app/constants.dart';
import 'package:dio/dio.dart';

class SupplierServices {
  Dio dio = Dio();
  String apiUrl = "${AppConstants().url}/supplier";

  getSuppliers() async {
    try {
      return await dio.get('$apiUrl/getAll');
    } on DioError catch (e) {
      print(e);
    }
  }
}
