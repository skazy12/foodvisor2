import 'package:flutter/material.dart';

class Comida {
  String nombre;
  double calorias;
  double proteinas;
  double carbohidratos;
  double grasas;
  Comida(this.nombre, this.calorias, this.proteinas, this.carbohidratos,
      this.grasas);
  double calcularCalorias() {
    return calorias;
  }

  double calcularProteinas() {
    return proteinas;
  }

  double calcularCarbohidratos() {
    return carbohidratos;
  }

  double calcularGrasas() {
    return grasas;
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

  @override
  String toString() {
    return 'Comida{nombre: $nombre, calorias: $calorias, proteinas: $proteinas, carbohidratos: $carbohidratos, grasas: $grasas}';
  }
}
