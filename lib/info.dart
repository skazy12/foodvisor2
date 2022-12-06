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
      body:FutureBuilder(
          future: getAlimento(),
          builder: ((context, snapshot){
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context,index){
                  Comida comida = Comida();
                  comida.setNombre(snapshot.data[index]['nombre']);
                  comida.setAgua(double.parse(snapshot.data[index]['agua'].toString()));
                  comida.setAzucar(double.parse(snapshot.data[index]['azucar'].toString()));
                  String nomb=" ";
                  // Comparacion
                  if(comida.getNombre().compareTo(nom.toString())==0){
                    nomb = comida.getNombre();
                    print("si");
                  }
                  return Text(nomb);
                }
            );
          }) ),
    );
  }
}
