import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myhero/src/data/datasource/conection_datasource.dart';
import 'package:myhero/src/data/repositories/data_repository_impl.dart';
import 'package:myhero/src/presentation/home/cubit/home_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
          repository: IDataRepository(
        datasource: ConectionDatasource(),
      )),
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
                        controller: _controller,
                        onChanged: context.read<HomeCubit>().setUrl ,
                        decoration: InputDecoration(
                          labelText: 'wss://',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => BlocProvider.of<HomeCubit>(context).connect() ,
                      icon: const Icon(Icons.check),
                      enableFeedback: true,
                      isSelected: true,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Material(
                    color: Color.fromARGB(
                      255,
                      state.red,
                      state.green,
                      state.blue,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    child: const SizedBox(
                      width: double.infinity,
                      height: 220,
                    ),
                  ),
                ),
                Slider(
                  min: 0,
                  max: 255,
                  label: 'red',
                  thumbColor: Colors.red,
                  activeColor: Colors.red,
                  value: state.red.toDouble(),
                  onChanged: (value) =>
                      BlocProvider.of<HomeCubit>(context).setRedColor(
                    red: value,
                  ),
                ),
                Slider(
                  min: 0,
                  max: 255,
                  label: 'green',
                  thumbColor: Colors.green,
                  activeColor: Colors.green,
                  value: state.green.toDouble(),
                  onChanged: (value) =>
                      BlocProvider.of<HomeCubit>(context).setGreenColor(
                    green: value,
                  ),
                ),
                Slider(
                  min: 0,
                  max: 255,
                  label: 'blue',
                  thumbColor: Colors.blue,
                  activeColor: Colors.blue,
                  value: state.blue.toDouble(),
                  onChanged: (value) =>
                      BlocProvider.of<HomeCubit>(context).setBlueColor(
                    blue: value,
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
