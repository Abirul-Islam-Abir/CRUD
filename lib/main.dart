import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/model/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String baseUrl = 'https://jsonplaceholder.typicode.com';

  deleteData(index) async {
    String url = '$baseUrl/products/$index';
    await http.delete(Uri.parse(url), body: {
      'id': index.toString(),
    });
    if (mounted) {
      setState(() {});
    }
  }

  Future getData() async {
    String url = '$baseUrl/posts';
    final getUrl = Uri.parse(url);
    final response = await http.get(getUrl);
    final data = json.decode(response.body);
    print(data);
    return data;
  }

  List<UserData> userData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            for (var item in snapshot.data) {
              userData.add(UserData.fromJson(item));
            }
          }
          return ListView.separated(
            itemCount: userData.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text('${userData[index].id}'),
                title: Text('${userData[index].title}',maxLines: 1,),
                subtitle: Text('${userData[index]. body}',maxLines: 2,),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 10,
            ),
          );
        },
      ),
    );
  }
}
