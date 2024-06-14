import 'package:contigo_pecuario/features/animalControl/data/models/animal_control_entity_model.dart';

abstract class AnimalControlEntityRemoteDatasource {
  Future<List<AnimalControlEntityModel>> getEntities();
}

