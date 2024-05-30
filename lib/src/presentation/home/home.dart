import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myhero/src/presentation/home/cubit/home_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Websocket'),
              centerTitle: true,
            ),
            body: ListView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'wss://',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check),
                      enableFeedback: true,
                      isSelected: true,
                    )
                  ],
                ),
                Slider(
                  min: state.red.toDouble(),
                  max: 255,
                  thumbColor: Colors.red,
                  value: 0, onChanged: (value) {
                  
                },)
              ],
            ),
          );
        },
      ),
    );
  }
}
