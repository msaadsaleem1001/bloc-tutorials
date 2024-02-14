
import 'dart:async';
import 'dart:convert';
import 'package:bloc_tutorials/Utils/App%20Urls/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_tutorials/App%20Models/Post%20Model/post_model.dart';

class PostRepository {

  Future<List<PostModel>> fetchPosts () async{
    try{
      final response = await http.get(Uri.parse(AppUrls.postUrl));
      if(response.statusCode == 200){
        final postList = jsonDecode(response.body) as List;
        return postList.map((e) {
          return PostModel(
            userId: e['userId'] as int,
            id: e['id'] as int,
            title: e['title'] as String,
            body: e['body'] as String
          );
        }).toList();
      }
      else{
        throw jsonDecode(response.body);
      }
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

}