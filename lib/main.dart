import 'package:bytebank2/http/webclient.dart';
import 'package:bytebank2/http/webclients/transactions_webclient.dart';
import 'package:bytebank2/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bytebank2());
 // save(Contact(0, 'Alessandro', 2000));
 // findAll().then((contacts) => debugPrint(contacts.toString()));
  //});
  final TransactionWebClient _webclient = TransactionWebClient();
  _webclient.findAll().then((transactions) => print('novas transações $transactions'));
}

class Bytebank2 extends StatelessWidget {
  const Bytebank2 ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
          colorScheme:  ColorScheme.fromSwatch().copyWith
            (
            primary: Colors.green.shade900,
            secondary: Colors.blueAccent[700],
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent[700],
          ),
          ),
      ),
      home: Dashboard (),
    );
  }
}


