//crear una clase comida que tenga como atributos sus proteinas, carbohidratos, grasas, calorias, nombre, etc
//y que tenga un metodo que calcule las calorias
//y que tenga un metodo que calcule las proteinas
//y que tenga un metodo que calcule las grasas
//y que tenga un metodo que calcule los carbohidratos
class Comida {
  String nombre;
  int calorias;
  int proteinas;
  int carbohidratos;
  int grasas;
  Comida(this.nombre, this.calorias, this.proteinas, this.carbohidratos,
      this.grasas);
  int calcularCalorias() {
    return calorias;
  }

  int calcularProteinas() {
    return proteinas;
  }

  int calcularCarbohidratos() {
    return carbohidratos;
  }

  int calcularGrasas() {
    return grasas;
  }

  String getNombre() {
    return nombre;
  }

  int getCalorias() {
    return calorias;
  }

  int getProteinas() {
    return proteinas;
  }

  int getCarbohidratos() {
    return carbohidratos;
  }

  int getGrasas() {
    return grasas;
  }

  void setNombre(String nombre) {
    this.nombre = nombre;
  }

  void setCalorias(int calorias) {
    this.calorias = calorias;
  }

  void setProteinas(int proteinas) {
    this.proteinas = proteinas;
  }

  void setCarbohidratos(int carbohidratos) {
    this.carbohidratos = carbohidratos;
  }

  void setGrasas(int grasas) {
    this.grasas = grasas;
  }

  @override
  String toString() {
    return 'Comida{nombre: $nombre, calorias: $calorias, proteinas: $proteinas, carbohidratos: $carbohidratos, grasas: $grasas}';
  }
}
