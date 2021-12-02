import 'dart:convert';
import 'package:dignizant_example/model/movieData.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';

class HomeController extends GetxController {
  List<Movies> movieData = [];

  Future<dynamic> callAPI() async {
    String strURL = "http://165.22.75.82/v1/movies";
    Uri requestedURL = Uri.parse(strURL);

    Response response = await get(requestedURL);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      dynamic responseData = jsonResponse['data'];
      List<dynamic> listData = responseData['movies'];
      listData.forEach((element) {
        movieData.add(new Movies.fromJson(element));
      });
    } else {
      print("ERROR");
    }
    update();
  }
}
