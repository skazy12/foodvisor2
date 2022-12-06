import 'package:flutter/material.dart';
import 'package:transfer_learning_fruit_veggies/dto/comida.dart';
import 'firebase_service.dart';

class Info extends StatefulWidget {
  const Info(nom, {key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  get nom => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vlad'),
      ),
      body: FutureBuilder(
          future: getAlimento(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Text("");
                });
          })),
    );
  }
}
