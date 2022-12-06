import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getAlimento() async{
  List alimento = [];
  CollectionReference colletionReferenceAlimento = db.collection('alimento');

  QuerySnapshot queryAlimento = await colletionReferenceAlimento.get();
  queryAlimento.docs.forEach((documento) {
    alimento.add(documento.data());
  });
  return alimento;
}
