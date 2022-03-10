import 'dart:developer';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_getx_api/events/counter_event.dart';

import '../service/http_service.dart';
import 'counter_bloc.dart';

// class CounterPage extends StatelessWidget {
//   /// {@macro counter_page}
//   const CounterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // return BlocProvider(
//     //   create: (context) => CounterBloc(),
//     //   child: const BlocPage(),
//     // );
//     return BlocProvider(
//       create: (_) => CounterCubit(),
//       child:const CounterView(),
//     );
//   }
// }

class CounterView extends StatelessWidget {
  static String routeName = "/bloc";
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    final CounterCubit counterCubit = context.read<CounterCubit>();
    //final CounterCubit counterCubit=BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CubitState>(
                  builder: (context, state) => Text(
                        'Result:${state.counter}',
                      )),
              TextField(
                  controller: counterCubit.textEditingController,
                  onChanged: (String value) {
                    counterCubit.addText();
                  }),
              BlocBuilder<CounterCubit, CubitState>(
                  builder: (context, state) => Text(
                        state.name,
                      )),
              ElevatedButton(
                  onPressed: () => counterCubit.addText(), child: Text('+')),
                  TextFormField(
  //controller: _controller,
  keyboardType: TextInputType.number,
  inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
    //FilteringTextInputFormatter.allow(RegExp(r'[,]'))
  ],
  decoration: InputDecoration(
    labelText: "whatever you want",
    hintText: "whatever you want",
    icon: Icon(Icons.phone_iphone)
  )
),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => counterCubit.increment(),
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => counterCubit.decrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool isLoading=true;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder<List<Photo>>(
        future: HttpService().fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}
