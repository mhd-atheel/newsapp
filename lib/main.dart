import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsappnew/models/articleModel.dart';
import 'package:newsappnew/tourch.dart';
import 'package:newsappnew/youtube.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Youtube(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'https://newsapi.org/v2/everything?q=apple&from=2023-01-20&to=2023-01-20&sortBy=popularity&apiKey=3a5bafa353724f9c9b0ac0a194d3a3ce';
  @override
  void initState() {
    // http.get(Uri.parse(url)).then((value) {
    //   if(value.statusCode ==200){
    //     Map result = jsonDecode(value.body);
    //     print(result['articles']);
    //   }
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: FutureBuilder<http.Response>(
        future: http.get(Uri.parse(url)),
        builder: (buildContext,AsyncSnapshot<http.Response> snapshot){
          List<ArticleModel> list = [];
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          else if(snapshot.data == null){
              return Text('Somthing went wrong');
          }
          else if(snapshot.data!.statusCode==200){
            Map result  = jsonDecode(snapshot.data!.body);
            List allNews = result['articles'];
            if(allNews.isNotEmpty){
              allNews.forEach((element) {
                  list.add(ArticleModel.fromMap(element));
              });
              return ListView.builder(
                itemCount: list.length,
                  itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(list[index].urlToImage),
                              Text(list[index].sourceModels.name),
                              Text(list[index].title),
                              Text(list[index].description),
                            ],
                          )),
                    );
                  }
              );
            }
          }
          return const Text("Welcome");
          }
      )

    );
  }
}
