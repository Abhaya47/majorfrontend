import 'dart:convert';
import 'package:http/http.dart';
import 'package:majorproject/Profile/user_info.dart';
import 'package:majorproject/model/user_food.dart';

class api {

  static Authentication(Map<String, String> headers) {
    String token = "Bearer 35|lkx0tZNCazVWTZmabtVk4blgp9dY5UZCssMJ2xgo";

    if (token != "") {
      headers['Authorization'] = token;
    }
  }

  /**
   * URL String
   * Body JSON String
   * Headers array
   */
  static Post(String url, String body) async {
    /*
    Check if logged in
     */
    //write the response of /login to a file
    //read the file and get the token
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Authentication(headers);

    Response response = await post(
        Uri.parse(url),
        headers: headers,
        body: body
    );
    // print(response.body);
    return (response);
  }

  static Put(String url, String body) async {
    /*
    Check if logged in
     */
    //write the response of /login to a file
    //read the file and get the token
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    Authentication(headers);

    Response response = await put(
        Uri.parse(url),
        headers: headers,
        body: body
    );
    // print(response.body);
    return (response);
  }

  /**
   * URL String
   * Body JSON String
   * Headers array
   */
  static Get(String url) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    Authentication(headers);

    Response response = await get(
      Uri.parse(url),
      headers: headers,
    );
    return response;
  }

  Future<List<FoodPost>> GetFood(String url)
  async {
     Response response = await Get(url);

     if(response.statusCode == 200)
       {
         List<dynamic> body=jsonDecode(response.body);

         List<FoodPost> posts= body
             .map(
             (dynamic item)=>FoodPost.fromJson(item),
         ).toList();
         return posts;
       }
        else{
          throw "Unable to retrieve post";
     }
  }
  Future<List<MyInfo>> Getufeature(String url)
  async {
    Response response = await Get(url);

    if(response.statusCode == 200)
    {
      List<dynamic> body=jsonDecode(response.body);
  print(response.body);
      List<MyInfo> posts= body
          .map(
            (dynamic item)=>MyInfo.fromJson(item),
      ).toList();
      return posts;

    }

    else{
      throw "Unable to retrieve data";
    }
  }
}
