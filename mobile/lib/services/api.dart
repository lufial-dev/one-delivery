import 'package:http/http.dart' as http;
import 'package:mobile/utils/messages.dart';

abstract class API{
  static Future fetchArray(dir) async {
      try{
        return await http.get("http://192.168.1.121:3000/" + dir);
       
      }catch(e){
        return (Message.ERROR_CONECTION);
      }
  }
}
