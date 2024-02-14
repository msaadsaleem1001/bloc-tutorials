
import '../../App Models/Fav Model/fav_model.dart';

class FavRepository {

  Future<List<FavItemModel>> fetchItem() async{
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(20));
  }

  List<FavItemModel> _generateList(int length){
    return List.generate(length, (index) => FavItemModel(id: index, value: 'Item $index'));
  }

}