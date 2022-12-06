import 'package:get/get.dart';

class ComidaController extends GetxController {
  String nombre;
  double calorias;
  double proteinas;
  double carbohidratos;
  double grasas;

  //getters and setters
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
