import 'package:bloc_tutorials/Bloc/posts_bloc/post_bloc.dart';
import 'package:bloc_tutorials/Bloc/posts_bloc/post_event.dart';
import 'package:bloc_tutorials/Bloc/posts_bloc/post_state.dart';
import 'package:bloc_tutorials/Repositories/Status/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(FetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text('Posts', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            switch (state.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.complete:
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          context
                              .read<PostBloc>()
                              .add(SearchPosts(searchedId: val));
                        },
                        decoration: InputDecoration(
                          hintText: 'Search with "ID"',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: state.searchMessage.isEmpty
                            ? ListView.builder(
                                itemCount: state.tempPostList.isEmpty? state.postList.length : state.tempPostList.length,
                                itemBuilder: (context, index) {
                                  if(state.tempPostList.isNotEmpty){
                                    return Card(
                                        color: Colors.blueGrey.withOpacity(0.5),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.grey,
                                                radius: 20,
                                                child: Text(
                                                  state.tempPostList[index].id
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(state
                                                    .tempPostList[index].title
                                                    .toString()),
                                              ),
                                            ],
                                          ),
                                        ));
                                  }
                                  else{
                                    return Card(
                                        color: Colors.blueGrey.withOpacity(0.5),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.grey,
                                                radius: 20,
                                                child: Text(
                                                  state.postList[index].id
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(state
                                                    .postList[index].title
                                                    .toString()),
                                              ),
                                            ],
                                          ),
                                        ));
                                  }
                                })
                            : Center(
                                child: Text(state.searchMessage.toString()),
                              ),
                      ),
                    ],
                  ),
                );
              default:
                return Center(
                  child: Text(state.message.toString()),
                );
            }
          }),
        ),
      ),
    );
  }
}
