import 'package:bloc_tutorials/App%20Models/Fav%20Model/fav_model.dart';
import 'package:bloc_tutorials/Bloc/Fav%20Bloc/fav_bloc.dart';
import 'package:bloc_tutorials/Bloc/Fav%20Bloc/fav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/Fav Bloc/fav_event.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavBloc>().add(FetchItemsList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text(
          'Fav. Screen',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<FavBloc, FavState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempCheckList.isNotEmpty? true : false,
                child: IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      context.read<FavBloc>().add(DeleteItems());
                    },
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                    )),
              );
            },
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: BlocBuilder<FavBloc, FavState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(color: Colors.cyan),
                );
              case ListStatus.complete:
                return ListView.builder(
                    itemCount: state.favList.length,
                    itemBuilder: (context, index) {
                      final item = state.favList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Card(
                          color: Colors.black26,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Checkbox(
                                checkColor: Colors.cyan,
                                activeColor: Colors.white,
                                value: state.tempCheckList.contains(item)
                                    ? true
                                    : false,
                                onChanged: (val) {
                                  if (val!) {
                                    context
                                        .read<FavBloc>()
                                        .add(SelectItem(item: item));
                                  } else {
                                    context
                                        .read<FavBloc>()
                                        .add(UnSelectItem(item: item));
                                  }
                                }),
                            title: Text(
                              state.favList[index].value,
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: IconButton(
                                enableFeedback: false,
                                onPressed: () {
                                  FavItemModel favItemModel = FavItemModel(
                                    id: item.id,
                                    value: item.value,
                                    isFav: item.isFav ? false : true,
                                  );
                                  context
                                      .read<FavBloc>()
                                      .add(FavItem(item: favItemModel));
                                },
                                icon: state.favList[index].isFav
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.redAccent,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_rounded)),
                          ),
                        ),
                      );
                    });
              default:
                return const Center(
                  child: Text(
                    'Internal Server Error',
                    style: TextStyle(color: Colors.white),
                  ),
                );
            }
          },
        ),
      )),
    );
  }
}
