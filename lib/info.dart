import 'package:flutter/material.dart';
import 'package:transfer_learning_fruit_veggies/dto/comida.dart';
import 'dto/comidaController.dart';
import 'firebase_service.dart';
import 'package:get/get.dart';

class Info extends StatefulWidget {
  const Info({key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  get nom => null;

  @override
  Widget build(BuildContext context) {
    ComidaController comidaController = Get.put(ComidaController());
    String snom="";
    double agua=0.0,azucar=0.0,carb=0.0,energ=0.0,fibra=0.0,porcion=0.0,proteina=0.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información del alimento'),
      ),
      body: FutureBuilder(
          future: getAlimento(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  if (comidaController.getNombre()==snapshot.data[index]['nombre'].toString()){
                    snom=snapshot.data[index]['nombre'];
                    print(snom+"**");
                    agua=double.parse(snapshot.data[index]['agua'].toString());
                    print(agua.toString()+"**");
                    azucar=double.parse(snapshot.data[index]['azucar'].toString());
                    print(azucar.toString()+"**");
                    carb=double.parse(snapshot.data[index]['carbohidrato'].toString());
                    print(carb.toString()+"**");
                    energ=double.parse(snapshot.data[index]['energia'].toString());
                    print(energ.toString()+"**");
                    fibra=double.parse(snapshot.data[index]['fibra'].toString());
                    print(fibra.toString()+"**");
                    porcion=double.parse(snapshot.data[index]['porcion'].toString());
                    print(porcion.toString()+"**");
                    proteina=double.parse(snapshot.data[index]['proteina'].toString());
                    print(proteina.toString()+"**");
                    return Text(snom+" "+agua.toString()+" "+azucar.toString());
                  }
                  else{
                    return Container();
                  }
                });
          })),
    );
  }
}
