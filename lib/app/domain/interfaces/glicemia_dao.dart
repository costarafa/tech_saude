import 'package:saude_tech/app/domain/entities/glicemia.dart';

abstract class QuentinhaDAO{

  save(Glicemia glicemia); 

  remove(int id); 

  Future<List<Glicemia>> find();

}