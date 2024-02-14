
import 'package:bloc_tutorials/App%20Models/Fav%20Model/fav_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavEvent extends Equatable{

  const FavEvent();

  @override
  List<Object?> get props => [];
}

class FetchItemsList extends FavEvent{}

class FavItem extends FavEvent{
  final FavItemModel item;
  const FavItem({required this.item});
}

class SelectItem extends FavEvent{
  final FavItemModel item;
  const SelectItem({required this.item});
}

class UnSelectItem extends FavEvent{
  final FavItemModel item;
  const UnSelectItem({required this.item});
}

class DeleteItems extends FavEvent{}
