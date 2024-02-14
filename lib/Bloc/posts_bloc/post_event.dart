
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {

  const PostEvent();

  @override
  List<Object?> get props => [];
}

class FetchPosts extends PostEvent{}


class SearchPosts extends PostEvent{
  final String searchedId;
  const SearchPosts({required this.searchedId});
}
