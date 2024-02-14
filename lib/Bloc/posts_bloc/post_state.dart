import 'package:bloc_tutorials/Repositories/Status/status.dart';
import 'package:equatable/equatable.dart';
import '../../App Models/Post Model/post_model.dart';

class PostState extends Equatable {
  final Status status;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;
  final String searchMessage;

  const PostState(
      {this.status = Status.loading,
      this.postList = const [],
      this.tempPostList = const [],
      this.message = '',
      this.searchMessage = ''});

  PostState copyWith(
      {Status? status,
      List<PostModel>? postList,
      List<PostModel>? tempPostList,
      String? message,
      String? searchMessage}) {
    return PostState(
        status: status ?? this.status,
        postList: postList ?? this.postList,
        tempPostList: tempPostList ?? this.tempPostList,
        message: message ?? this.message,
        searchMessage: searchMessage ?? this.searchMessage);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [status, postList, tempPostList, message, searchMessage];
}
