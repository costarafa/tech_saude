import 'package:saude_tech/app/domain/entities/glicemia.dart';

abstract class GlicemiaDAO{

  save(Glicemia glicemia); 

  remove(int id); 

  Future<List<Glicemia>> find();

}