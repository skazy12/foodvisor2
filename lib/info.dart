import 'package:flutter/material.dart';
import 'package:transfer_learning_fruit_veggies/dto/comida.dart';
import 'dto/comidaController.dart';
import 'firebase_service.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class Info extends StatefulWidget {
  const Info({key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String snom="";
  double agua,azucar=0.0,carb=0.0,energ=0.0,fibra=0.0,porcion=0.0,proteina=0.0,sum=0.0;
  get nom => null;
  @override
  Widget build(BuildContext context) {
    ComidaController comidaController = Get.put(ComidaController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('DATOS NUTRICIONALES'),
        backgroundColor: Colors.blueGrey[600],
      ),
      body: FutureBuilder(
          future: getAlimento(),
          builder: ((context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    print("SSSSSSSSSS"+comidaController.getNombre());
                    print("RRRRRRRRR"+snapshot.data[index]['name'].toString());
                    if (comidaController.getNombre().toUpperCase() == snapshot.data[index]['nombre'].toString().toUpperCase()){
                      print("jjjjjjjj"+comidaController.getNombre());
                      print("yyyyyyyy"+snapshot.data[index]['name'].toString());
                      snom=snapshot.data[index]['nombre'];
                      agua=double.parse(snapshot.data[index]['agua'].toString());
                      azucar=double.parse(snapshot.data[index]['azucar'].toString());
                      carb=double.parse(snapshot.data[index]['carbohidrato'].toString());
                      energ=double.parse(snapshot.data[index]['energia'].toString());
                      fibra=double.parse(snapshot.data[index]['fibra'].toString());
                      porcion=double.parse(snapshot.data[index]['porcion'].toString());
                      proteina=double.parse(snapshot.data[index]['proteina'].toString());
                      sum=agua+azucar+carb+energ+fibra+proteina;
                      List<PieChartSectionData> sectionsChart = [
                        PieChartSectionData(
                          value: (agua/sum)*100,
                          title: "${((agua/sum)*100).round()} %",
                          showTitle: true,
                          color: Colors.orange,
                          radius: 100,
                        ),
                        PieChartSectionData(
                          value: (azucar/sum)*100,
                          title: "${((azucar/sum)*100).round()} %",
                          showTitle: true,
                          color: Colors.blue,
                          radius: 100,
                        ),
                        PieChartSectionData(
                          value: (carb/sum)*100,
                          title: "${((carb/sum)*100).round()} %",
                          showTitle: true,
                          color: Colors.purpleAccent,
                          radius: 100,
                        ),
                        PieChartSectionData(
                          value: (energ/sum)*100,
                          title: "${((energ/sum)*100).round()} %",
                          showTitle: true,
                          color: Colors.redAccent,
                          radius: 100,
                        ),
                        PieChartSectionData(
                          value: (fibra/sum)*100,
                          title: "${((fibra/sum)*100).round()} %",
                          showTitle: true,
                          color: Colors.green,
                          radius: 100,
                        ),
                        PieChartSectionData(
                          value: (proteina/sum)*100,
                          title: "${((proteina/sum)*100).round()} %",
                          showTitle: true,
                          color: Colors.yellow,
                          radius: 100,
                        ),
                      ];
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${snom.toUpperCase()}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 25),
                            Container(
                              height: 200,
                              width: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.file(
                                    comidaController.getImage()
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                        Column(
                                children: [
                                  Column(
                                      children:<Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            'DETALLE NUTRITIVO',
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Porción comestible: ${porcion} %',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Table(
                                            textDirection: TextDirection.rtl,
                                            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                            children: [
                                              TableRow(
                                                  children: [
                                                    Padding(padding: const EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.circle_rounded,
                                                            color: Colors.green,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            'Fibra: ${fibra} g',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(padding: const EdgeInsets.all(10),
                                                      child:Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.circle_rounded,
                                                            color: Colors.orange,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            'Grasa: ${agua} g',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    Padding(padding: const EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.circle_rounded,
                                                            color: Colors.blue,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            'Azúcar: ${azucar} g',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(padding: const EdgeInsets.all(10),
                                                      child:Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.circle_rounded,
                                                            color: Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            'Proteína: ${proteina} g',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    Padding(padding: const EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.circle_rounded,
                                                            color: Colors.purpleAccent,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            'Hidrato: ${carb} g',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(padding: const EdgeInsets.all(10),
                                                      child:Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.circle_rounded,
                                                            color: Colors.redAccent,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            'Energía: ${energ} g',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ]
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]
                                  ),
                                  Text(
                                    'COMPOSICIÓN',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                child: PieChart(
                                  PieChartData(
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      sectionsSpace: 0,
                                      centerSpaceRadius: 0,
                                      sections: sectionsChart),
                                ),
                              ),
                                ],
                              ),
                          ],
                        ),
                      );
                    }
                    else{
                      return Container();
                    }
                  });
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}
