import 'package:flutter/material.dart';

//crear una clase comida que tenga como atributos sus proteinas, carbohidratos, grasas, calorias, nombre, etc
//y que tenga un metodo que calcule las calorias
//y que tenga un metodo que calcule las proteinas
//y que tenga un metodo que calcule las grasas
//y que tenga un metodo que calcule los carbohidratos
class Comida {
  String nombre;
  double agua, azucar, carbohidratos, energia, porcion, proteina;

  Comida(
      {this.nombre,
      this.agua,
      this.azucar,
      this.carbohidratos,
      this.energia,
      this.porcion,
      this.proteina});

  void setNombre(String nombre) {
    this.nombre = nombre;
  }

  String getNombre() {
    return this.nombre;
  }

  void setAgua(double agua) {
    this.agua = agua;
  }

  double getAgua() {
    return this.agua;
  }

  void setAzucar(double azucar) {
    this.azucar = azucar;
  }

  double getAzucar() {
    return this.azucar;
  }

  void setCarbohidratos(double carbohidratos) {
    this.carbohidratos = carbohidratos;
  }

  double getCarbohidratos() {
    return this.carbohidratos;
  }

  void setEnergia(double energia) {
    this.energia = energia;
  }

  double getEnergia() {
    return this.energia;
  }

  void setPorcion(double porcion) {
    this.porcion = porcion;
  }

  double getPorcion() {
    return this.porcion;
  }

  void setProteina(double proteina) {
    this.proteina = proteina;
  }

  double getProteina() {
    return this.proteina;
  }
}
