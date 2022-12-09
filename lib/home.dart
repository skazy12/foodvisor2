import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:transfer_learning_fruit_veggies/dto/comida.dart';
import 'package:transfer_learning_fruit_veggies/dto/comidaController.dart';
import 'package:transfer_learning_fruit_veggies/info.dart';
import 'firebase_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  Future classifyImage(File image) async {
    try{
      var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 36,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5,
      );
      print('output : $output');
      if(!output.isEmpty){
        setState(() {
          _output = output;
          _loading = false;
          print("DETECTADO: ${_output[0]['label']}");
        });
      }else{
        setState(() {
          _output[0]['label']=" NO DETECTADO ";
          _loading = false;
        });
      }
    }catch(e){
      print(e);
    }
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  Future pickImage() async {
    try {
      var image = await picker.getImage(source: ImageSource.camera);
      if (image == null) return null;
      setState(() {
        _image = File(image.path);
      });
      classifyImage(_image);
    } catch (e) {
      print(e+"*******");
    }
  }

  pickGalleryImage() async {
    try{
      var image = await picker.getImage(source: ImageSource.gallery);
      if (image == null) return null;
      setState(() {
        _image = File(image.path);
      });
      classifyImage(_image);
    }catch(e){
      print(e+"-*-");
    }
  }

  @override
  Widget build(BuildContext context) {
    ComidaController comidaController = Get.put(ComidaController());
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.9),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Color(0xFF2A363B),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Container(
                  child: _loading == true
                      ? null //show nothing if no picture selected
                      : Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Text("FOOD VISOR",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                      )
                                  ),
                                ]
                              ),
                              SizedBox(height: 45),
                              Container(
                                height: 250,
                                width: 250,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Divider(
                                height: 25,
                                thickness: 1,
                              ),
                              _output != null
                                  ? Text(
                                      'ALIMENTO: ¡${(_output[0]['label']).toString().toUpperCase()}!',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    )
                                  : Container(),
                              Divider(
                                height: 25,
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[600],
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'TOMAR FOTO',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: pickGalleryImage,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[600],
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'SELECCIONAR IMAGEN',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _output != null
                        ? GestureDetector(
                            onTap: () {
                              comidaController.setNombre(_output[0]['label'].toString());
                              comidaController.setImage(_image);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return Info();
                                  }));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 200,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 17),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey[600],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                'DATOS NUTRICIONALES',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                    )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _alerta() {
    return AlertDialog(
      title: Text('Alerta'),
      content: Text('No se ha seleccionado ninguna imagen'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Aceptar'),
        )
      ],
    );
  }
}
