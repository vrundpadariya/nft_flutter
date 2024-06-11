import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/getnftmodel.dart';

class APIHelper {
  APIHelper._(); //private named constructor
  static final APIHelper apiHelper = APIHelper._();

  Future<Result?> fetchNFT() async {
    String baseUrl =
        'https://deep-index.moralis.io/api/v2.2/nft/0xb47e3cd837dDF8e4c57F05d70Ab865de6e193BBB?chain=eth&format=decimal';

    Map<String, String> headers = {
      'Accept': 'application/json',
      'X-API-Key': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub25jZSI6Ijg4YjM2YTFhLWE5YWEtNDI3Ny05ZmQ4LTk4Y2VhZDEyMWYwYiIsIm9yZ0lkIjoiMzkzMDkxIiwidXNlcklkIjoiNDAzOTE2IiwidHlwZUlkIjoiN2IxNjUzZTUtZWJhOS00NGVjLWJiYzctNmNhNzY1ZWUyNzJlIiwidHlwZSI6IlBST0pFQ1QiLCJpYXQiOjE3MTYyNjc5MzMsImV4cCI6NDg3MjAyNzkzM30.go5dZ4ms02HbaNTi9IN3yIlC3vDaUJWC2sw3zSwtY6g',
    };

    http.Response res = await http.get(Uri.parse(baseUrl).replace(queryParameters: headers));

    if (res.statusCode == 200) {
      String data = res.body;
      Map<String, dynamic> decoddata = jsonDecode(data);
      Result resultdata = Result.fromJson(decoddata);
      return resultdata;
    }
  }
}