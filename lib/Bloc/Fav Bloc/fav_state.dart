
import 'package:bloc_tutorials/App%20Models/Fav%20Model/fav_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus {loading, complete, error}

class FavState extends Equatable{

  final List<FavItemModel> favList;
  final List<FavItemModel> tempCheckList;
  final ListStatus listStatus;

  const FavState({
    this.favList = const [],
    this.tempCheckList = const [],
    this.listStatus = ListStatus.loading
  });

  FavState copyWith({List<FavItemModel>? favList, List<FavItemModel>? tempCheckList, ListStatus? listStatus}){
    return FavState(
      favList: favList ?? this.favList,
      tempCheckList: tempCheckList ?? this.tempCheckList,
      listStatus: listStatus ?? this.listStatus
    );
  }


  @override
  List<Object?> get props => [favList, tempCheckList, listStatus];
}
