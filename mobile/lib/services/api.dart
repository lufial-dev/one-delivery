import 'package:http/http.dart' as http;
import 'package:mobile/utils/messages.dart';

abstract class API{
  static const String URL = "http://192.168.1.114:3000/";

  static Future get(dir) async {
      try{
        return await http.get(URL + dir);
      }catch(e){
        return (Message.ERROR_CONECTION);
      }
  }

  static Future post(dir, body) async {
      try{
        return await http.post(
          URL + dir,
          body: body
        );
      }catch(e){
        return (Message.ERROR_CONECTION);
      }
  }

  static Future put(dir, body) async {
      try{
        return await http.post(
          URL + dir,
          body: body
        );
      }catch(e){
        return (Message.ERROR_CONECTION);
      }
  }
}
