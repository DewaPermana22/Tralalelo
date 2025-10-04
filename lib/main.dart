import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FButton(
                onPress: () {
                  print('Button pressed!');
                },
                child: Text('Klik Saya!'), // Add the required child parameter
              ),
              SizedBox(height: 20),
              // Contoh ForUI Card
              FCard(
                title: Text('Card Title'),
                subtitle: Text('Card subtitle'),
                child: Text('Ini adalah ForUI Card'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
