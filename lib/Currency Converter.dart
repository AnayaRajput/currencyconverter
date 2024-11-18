import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController usdController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  double result = 0.0;

  void convertCurrency() {
    double? usd = double.tryParse(usdController.text);
    double? price = double.tryParse(priceController.text);

    if (usd != null && price != null) {
      setState(() {
        result = usd * price;
      });
    } else {
      setState(() {
        result = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Colors.teal[900],
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.teal[700],
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal, width: 3),
          ),
          labelStyle: TextStyle(color: Colors.teal, fontSize: 16),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Currency Converter (USD to PKR)',
            style: TextStyle(
                color: Colors.green.shade200,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade100, Colors.teal.shade50],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Container 1: Price of 1 USD
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Price of 1 USD in PKR',
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Container 2: USD to convert
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: usdController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount in USD',
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Button to convert currency
              Center(
                child: ElevatedButton(
                  onPressed: convertCurrency,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Convert',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Container 3: Result
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Result: ${result.toStringAsFixed(2)} PKR',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
