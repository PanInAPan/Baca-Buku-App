import 'package:http/http.dart' as http;
import 'dart:convert';

class BookApiService {
  Future getBuku() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/buku'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class BorrowedBookApiService {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/booksOnBorrow'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class ReturnedBookApiService {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/booksOnReturn'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class CategoryApiService {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/categories'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
