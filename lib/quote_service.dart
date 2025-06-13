import 'dart:convert';
import 'package:http/http.dart' as http;
import 'quote.dart';

class QuoteService{
  final String _baseUri = 'http://api.quotable.io/random';

  Future<Quote> fetchRandomQuote() async {
    final response = await http.get(Uri.parse(_baseUri));
    if( response.statusCode == 200)
      {
        final data = jsonDecode(response.body);
        return Quote.fromJson(data);

      }
    else {
      throw Exception('failed to connect and load');
    }

  }
}