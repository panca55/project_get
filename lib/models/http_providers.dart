import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project_get/models/products.dart';

class HttpProvider with ChangeNotifier {
  List<Product> _data = [];
  List<Product> get data => _data;

  int get jumlahData => _data.length;


  void getData(int idSatu, int idDua) async {

    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products?offset=$idSatu&limit=$idDua");

      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          List<dynamic> jsonResponse = json.decode(response.body);
          _data = jsonResponse.map((data) => Product.fromJson(data)).toList();
          log('Data berhasil diambil: ${response.statusCode}');
        } else {
          throw Exception('Gagal mengambil data dari API: ${response.statusCode}');
        }
      } catch (e) {
        throw Exception('Terjadi kesalahan saat mengambil data: $e');
      }
      notifyListeners();

  }
}
