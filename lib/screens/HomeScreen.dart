import 'package:apis_integrations/Apis/Api_services.dart';
import 'package:apis_integrations/models/SinglePostWithModel.dart';
import 'package:flutter/material.dart';


class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  SinglePost singlePost=SinglePost();
  bool isReady=false;

  _getSinglePost(){
    isReady=true;
    ApiServices().getSinglePostWithModel().then((value){
      setState(() {
        singlePost=value!;
        isReady=false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSinglePost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Post'),
      ),
      body: isReady?Center(child: CircularProgressIndicator(),):Column(children: [
        Text(singlePost.userId.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Text(singlePost.id.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Text(singlePost.body.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Text(singlePost.title.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Text(singlePost.userId.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ],)
    );
  }
}
