import 'package:flutter/material.dart';
import 'package:quoteweb/quote.dart';
import 'package:quoteweb/quote_service.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late Future<Quote> futureQuote;

  @override
  void initState() {
    super.initState();
    futureQuote = QuoteService().fetchRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Quote')),
      body: FutureBuilder<Quote>(
        future: futureQuote,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final quote = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      quote.content,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text("-${quote.author}"),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
