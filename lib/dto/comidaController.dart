import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ComidaController extends GetxController {
  File img;
  String nombre;
  double calorias;
  double proteinas;
  double carbohidratos;
  double grasas;
  double porcion;

  File getImage(){
    return img;
  }

  void setImage(File img){
    this.img = img;
  }

  double getPorcion() {
    return porcion;
  }

  void setPorcion(double porcion) {
    this.porcion = porcion;
  }

  String getNombre() {
    return nombre;
  }

  double getCalorias() {
    return calorias;
  }

  double getProteinas() {
    return proteinas;
  }

  double getCarbohidratos() {
    return carbohidratos;
  }

  double getGrasas() {
    return grasas;
  }

  void setNombre(String nombre) {
    this.nombre = nombre;
  }

  void setCalorias(double calorias) {
    this.calorias = calorias;
  }

  void setProteinas(double proteinas) {
    this.proteinas = proteinas;
  }

  void setCarbohidratos(double carbohidratos) {
    this.carbohidratos = carbohidratos;
  }

  void setGrasas(double grasas) {
    this.grasas = grasas;
  }
}
