import 'package:cep_retrofit/model/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cep_retrofit/repository/repository.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();

  bool isLoading = false;

  Future<Locate> catchCep() async =>
      await Repository(Dio()).getCep(_controller.text);

  Locate? locate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() => AppBar(
        title: Text("retrofit"),
      );

  _body() => Center(
        child: isLoading ? CircularProgressIndicator() : _column(),
      );

  _column() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 110,
            child: TextField(
              maxLength: 8,
              controller: _controller,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () async {
              setState(() => isLoading = true);
              locate = await catchCep();
              isLoading = false;
              setState(() {});
            },
            child: Icon(Icons.adb_outlined),
          ),
          SizedBox(
            height: 10,
          ),
          Text(locate?.location ?? '', style: TextStyle(fontSize: 18)),
        ],
      );
}
