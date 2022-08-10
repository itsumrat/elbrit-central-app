import 'dart:convert';
import 'dart:io';
import 'package:elbrit_central/models/price_info.dart';
import 'package:elbrit_central/models/product_info.dart';
import 'package:elbrit_central/models/employee_info.dart';
import 'package:elbrit_central/models/wall_info.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import '../main.dart';

class Api {
  Future<EmployeeModel?> getEmployeeData({required String mobileNo}) async {
    var client = http.Client();
    var uri =
        Uri.parse('http://admin.elbrit.org/api/employee-info/$mobileNo');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["employee"].toString());
      return EmployeeModel.fromJson(json["employee"]);
    } else {
      return null;
    }
  }

  Future<List<WallModel>> getWallData() async {

    //var response = await client.get(uri);
    var response = await http.get(Uri.parse('http://admin.elbrit.org/api/walls/160'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["data"].toString());
      return ((json["data"] ?? []) as List)
          .map<WallModel>((i) => WallModel.fromJson(i))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Data>> getPriceData() async {
    var client = http.Client();
    print(datosusuario);
    //var uri = Uri.parse('https://admin.elbrit.org/api/prices');
    var uri = Uri.parse('http://admin.elbrit.org/api/prices/${datosusuario}');
    bool trustSelfSigned = true;
    HttpClient httpClient = HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => trustSelfSigned);
    IOClient ioClient = IOClient(httpClient);

    //var response = await client.get(uri);
    var response = await ioClient.get(uri);
    //var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["data"].toString());
      PriceModel priceModel=PriceModel.fromJson(json);
      // return (json["data"] as List)
      //     .map<PriceModel>((i) => PriceModel.fromJson(i))
      //     .toList();
      return priceModel.data!;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ProductModel> getProductData({required String id}) async {
    var client = http.Client();
    var uri = Uri.parse('https://elbrit.devcorn.live/api/products/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["data"].toString());
      return ProductModel.fromJson(json["data"][0]);

      //  (json["data"] as List)
      //     .map<ProductModel>((i) => ProductModel.fromJson(i))
      //     .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<ProductModel>> getProducts() async {
    var client = http.Client();
    var uri = Uri.parse('http://admin.elbrit.org/api/products/${datosusuario}');
  bool trustSelfSigned = true;
  HttpClient httpClient = HttpClient()
    ..badCertificateCallback =
    ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = IOClient(httpClient);

  //var response = await client.get(uri);
  var response = await ioClient.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json["data"].toString());
      return (json["data"] as List)
          .map<ProductModel>((i) => ProductModel.fromJson(i))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
