import 'dart:convert';

class PrecificationGroup {
  PrecificationGroup({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  PrecificationGroup copyWith({
    int? id,
    String? name,
  }) {
    return PrecificationGroup(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory PrecificationGroup.fromMap(Map<String, dynamic> map) {
    return PrecificationGroup(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PrecificationGroup.fromJson(String source) => PrecificationGroup.fromMap(json.decode(source));

  @override
  String toString() => 'PrecificationGroup(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PrecificationGroup &&
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
