
import 'package:bloc/bloc.dart';
import 'package:bloc_tutorials/Bloc/posts_bloc/post_event.dart';
import 'package:bloc_tutorials/Bloc/posts_bloc/post_state.dart';
import 'package:bloc_tutorials/Repositories/Status/status.dart';
import '../../App Models/Post Model/post_model.dart';
import '../../Repositories/Post Repo/post_repo.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  final PostRepository postRepository = PostRepository();
  List<PostModel> tempPostModel = [];

  PostBloc() : super(const PostState()) {
    on<FetchPosts>(fetchPosts);
    on<SearchPosts>(filterPosts);
  }

  void filterPosts(SearchPosts event, Emitter<PostState> emit){
    if(event.searchedId.isNotEmpty){
      tempPostModel = state.postList.where((element) => element.id.toString() == event.searchedId.toString()).toList();
      if(tempPostModel.isEmpty){
        emit(state.copyWith(tempPostList: [], searchMessage: 'No data found'));
      }
      else{
        emit(state.copyWith(tempPostList: tempPostModel, searchMessage: ''));
      }
    }
    else{
      emit(state.copyWith(tempPostList: [], searchMessage: ''));
    }
  }

  void fetchPosts(FetchPosts event, Emitter<PostState> emit) async{
    await postRepository.fetchPosts().then((value) {
      emit(state.copyWith(
        message: 'Success',
        postList: value,
        status: Status.complete
      ));
    }).onError((error, stackTrace){
      emit(state.copyWith(
        message: error.toString(),
        status: Status.error
      ));
    });
  }

}
