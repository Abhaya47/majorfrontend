import 'package:http/http.dart';

class api
{

  static Authentication(Map<String,String> headers) {
    String token = "Bearer 14|lcR0nLxFoUQ2FjuJeFadl4OVMynzZUEByr0ieyRV";

    if (token != "") {
      headers['Authorization'] = token;
    }
  }
  /**
   * URL String
   * Body JSON String
   * Headers array
   */
  static Post(String url,String body) async{
    /*
    Check if logged in
     */
    //write the response of /login to a file
    //read the file and get the token
    Map<String,String> headers = {
      "Content-Type":"application/json",
      "Accept":"application/json"
    };

    Authentication(headers);

    Response response=await post(
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
  static Get(String url) async{
    Map<String,String> headers = {
      "Content-Type":"application/json",
    };
    Authentication(headers);

    Response response=await post(
        Uri.parse(url),
        headers: headers,
    );
    print(response.body);
    return (response);
  }
}