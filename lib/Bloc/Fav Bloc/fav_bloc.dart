
import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/Bloc/Fav%20Bloc/fav_event.dart';
import 'package:bloc_tutorials/Bloc/Fav%20Bloc/fav_state.dart';
import '../../App Models/Fav Model/fav_model.dart';
import '../../Repositories/Fav Repository/fav_repo.dart';

class FavBloc extends Bloc<FavEvent, FavState> {

  List<FavItemModel> favList = [];
  List<FavItemModel> tempCheckList = [];
  FavRepository favRepository;

  FavBloc(this.favRepository) : super(const FavState()) {
    on<FetchItemsList>(fetchList);
    on<FavItem>(_favItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItems>(_deleteItems);
  }

  void fetchList(FetchItemsList event, Emitter<FavState> emit) async{
    favList = await favRepository.fetchItem();
    emit(state.copyWith(favList: List.from(favList), listStatus: ListStatus.complete));
  }

  void _favItem(FavItem event, Emitter<FavState> emit) {
    final index = favList.indexWhere((element) => element.id == event.item.id);
    if(event.item.isFav){
      if(tempCheckList.contains(favList[index])){
        tempCheckList.remove(favList[index]);
        tempCheckList.add(event.item);
      }
    }
    else{
      if(tempCheckList.contains(favList[index])){
        tempCheckList.remove(favList[index]);
        tempCheckList.add(event.item);
      }
    }
    favList[index] = event.item;
    emit(state.copyWith(favList: List.from(favList), tempCheckList: List.from(tempCheckList)));
  }

  void _selectItem(SelectItem event, Emitter<FavState> emit) {
    tempCheckList.add(event.item);
    emit(state.copyWith(tempCheckList: List.from(tempCheckList)));
  }

  void _unSelectItem(UnSelectItem event, Emitter<FavState> emit) {
    tempCheckList.remove(event.item);
    emit(state.copyWith(tempCheckList: List.from(tempCheckList)));
  }

  void _deleteItems(DeleteItems event, Emitter<FavState> emit) {
    for(int i = 0; i < tempCheckList.length; i++){
      favList.remove(tempCheckList[i]);
    }
    tempCheckList.clear();
    emit(state.copyWith(
      favList: List.from(favList),
      tempCheckList: List.from(tempCheckList)
    ));
  }

}
