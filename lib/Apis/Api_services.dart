import 'dart:convert';

import 'package:apis_integrations/models/SinglePostWithModel.dart';
import 'package:http/http.dart'as http;

class ApiServices{
  Future<SinglePost?>getSinglePostWithModel()async{
    try{
      var response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),);
      if(response.statusCode==200){
        SinglePost model=SinglePost.fromJson(json.decode(response.body),);
        return model;
      }
    }
        catch(e){
      print(e.toString(),);
        }
}




}