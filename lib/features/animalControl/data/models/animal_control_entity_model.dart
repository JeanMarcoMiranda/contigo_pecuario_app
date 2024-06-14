import 'package:contigo_pecuario/features/animalControl/domain/entities/animal_control_entity.dart';

class AnimalControlEntityModel extends AnimalControlEntity {
  AnimalControlEntityModel(
      {required super.id, required super.name, required super.active});

  factory AnimalControlEntityModel.fromJson(Map<String, dynamic> json) {
    return AnimalControlEntityModel(
      id: json["_id"],
      name: json["name"],
      active: json["active"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "active": active,
    };
  }
}
