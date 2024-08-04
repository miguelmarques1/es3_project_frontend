import 'dart:convert';

class Dimensions {
  Dimensions({
    required this.width,
    required this.height,
    required this.weight,
    required this.depth,
  });

  final double width;
  final double height;
  final double weight;
  final double depth;

  Dimensions copyWith({
    double? width,
    double? height,
    double? weight,
    double? depth,
  }) {
    return Dimensions(
      width: width ?? this.width,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      depth: depth ?? this.depth,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'width': width,
      'height': height,
      'weight': weight,
      'depth': depth,
    };
  }

  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      width: map['width']?.toDouble() ?? 0.0,
      height: map['height']?.toDouble() ?? 0.0,
      weight: map['weight']?.toDouble() ?? 0.0,
      depth: map['depth']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dimensions.fromJson(String source) => Dimensions.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dimensions(width: $width, height: $height, weight: $weight, depth: $depth)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Dimensions &&
      other.width == width &&
      other.height == height &&
      other.weight == weight &&
      other.depth == depth;
  }

  @override
  int get hashCode {
    return width.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      depth.hashCode;
  }
}
