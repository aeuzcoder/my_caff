import 'package:my_caff/feauture/domain/entites/table_entity.dart';

class TableModel extends TableEntity {
  TableModel({
    required super.number,
    required super.id,
    required super.capacity,
  });

  // From JSON factory
  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      number: json['number'],
      id: json['id'],
      capacity: json['capacity'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'id': id,
      'capacity': capacity,
    };
  }
}
