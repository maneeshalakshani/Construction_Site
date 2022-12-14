import 'package:app/constants.dart';
import 'package:dio/dio.dart';

class OrderServices {
  Dio dio = Dio();
  String apiUrl = "${AppConstants().url}/order";

  addOrder(int quantity, String userID, String itemID, int totPrice,
      String deliveryAddress) async {
    try {
      return await dio.post('$apiUrl/add', data: {
        'quantity': quantity,
        'userID': userID,
        'itemID': itemID,
        'totPrice': totPrice,
        'deliveryAddress': deliveryAddress
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  deletePendingOrder(String orderID) async {
    try{
      return await dio.delete('$apiUrl/delete/${orderID}');
    }on DioError catch (e){
      print(e);
    }
  }

  getPendingOrders() async {
    try {
      return await dio.get('$apiUrl/getAllPendingOrders');
    } on DioError catch (e) {
      print(e);
    }
  }

  getAcceptedOrders() async {
    try {
      return await dio.get('$apiUrl/getAllAcceptedOrders');
    } on DioError catch (e) {
      print(e);
    }
  }

  getRejectedOrders() async {
    try {
      return await dio.get('$apiUrl/getAllRejecedOrders');
    } on DioError catch (e) {
      print(e);
    }
  }
}
