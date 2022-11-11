// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionModel {
  final String name;
  final String category;
  final double value;
  final String tipo;
  TransactionModel({
    required this.name,
    required this.category,
    required this.value,
    required this.tipo,
  });

  TransactionModel copyWith({
    String? name,
    String? category,
    double? value,
    String? tipo,
  }) {
    return TransactionModel(
      name: name ?? this.name,
      category: category ?? this.category,
      value: value ?? this.value,
      tipo: tipo ?? this.tipo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category,
      'value': value,
      'tipo': tipo,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      name: map['name'] as String,
      category: map['category'] as String,
      value: map['value'] as double,
      tipo: map['tipo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(name: $name, category: $category, value: $value, tipo: $tipo)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.category == category &&
        other.value == value &&
        other.tipo == tipo;
  }

  @override
  int get hashCode {
    return name.hashCode ^ category.hashCode ^ value.hashCode ^ tipo.hashCode;
  }
}
