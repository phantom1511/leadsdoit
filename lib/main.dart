import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'services/web_service.dart';
import 'view/home_page.dart';
// @dart=2.9
void main() {
  runApp(const MyApp());
  GetIt.I.registerSingleton<Dio>(_dio);
  GetIt.I.registerSingleton<WebService>(WebService());
}

final Dio _dio = Dio()
  ..options.baseUrl = 'https://www.thesportsdb.com/api'
  ..options.headers = {'Accept': 'application/json'}
  ..options.followRedirects = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
