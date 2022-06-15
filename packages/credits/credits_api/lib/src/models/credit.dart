import 'package:credits_api/src/models/json_map.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credit.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
// ignore: must_be_immutable
class Credit extends Equatable {
  int? id;
  List<Cast>? cast;
  Credit({
    this.id,
    this.cast,
  });

  /// Deserializes the given [JsonMap] into a [Movie].
  static Credit fromJson(JsonMap json) => _$CreditFromJson(json);

  /// Converts this [Movie] into a [JsonMap].
  JsonMap toJson() => _$CreditToJson(this);

  @override
  List<Object?> get props => [id, cast];
}

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Cast extends Equatable {
  int? id;
  String? name;
  String? character;
  Cast({
    this.id,
    this.name,
    this.character,
  });

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    character = json['character'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['character'] = character;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        character,
      ];
}
