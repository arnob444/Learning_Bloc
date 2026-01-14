import 'package:blocproject/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material App Bar')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BlocBuilder<CounterBloc, CounterState>(
          //   builder: (context, state) {
          //     return Text(
          //       state.count.toString(),
          //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          //     );
          //   },
          // ),

          // BlocListener<CounterBloc, CounterState>(
          //   listener: (context, state) {
          //   },
          // ),
          
          BlocConsumer<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.count.toString(),
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              );
            },
            listener: (context, state) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Its working')));
            },
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Increment());
                },
                child: Text('Increment'),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(Decrement());
                },
                child: Text('Decrement'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
