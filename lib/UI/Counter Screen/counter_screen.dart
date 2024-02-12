
import 'package:bloc_tutorials/Bloc/Counter%20Bloc/counter_bloc.dart';
import 'package:bloc_tutorials/Bloc/Counter%20Bloc/counter_event.dart';
import 'package:bloc_tutorials/Bloc/Counter%20Bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Bloc Counter Example',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state){
                        return Text(
                          state.counter.toString(),
                          style: const TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: 60
                          ),
                        );
                      }
                  )
                ],
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    child: const Text('Increment')
                  ),
                  ElevatedButton(
                    onPressed: (){
                      context.read<CounterBloc>().add(DecrementCounter());
                    },
                    child: const Text('Decrement')
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
