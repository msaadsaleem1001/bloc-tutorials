

import 'package:equatable/equatable.dart';

class FavItemModel extends Equatable{

  final int id;
  final String value;
  final bool isDeleting;
  final bool isFav;

  const FavItemModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFav = false
  });

  FavItemModel copyWith({int? id, String? value, bool? isDeleting, bool? isFav}){
    return FavItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFav: isFav ?? this.isFav
    );
  }

  @override
  List<Object?> get props => [id, value, isDeleting, isFav];

}