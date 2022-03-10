//import '../events/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
// abstract class CounterEvent {}
// class Increment extends CounterEvent {}
// class Decrement extends CounterEvent {}
// class CounterBloc extends Bloc<CounterEvent, int> {
//   //CounterBloc(int initialState) : super(initialState);
//    CounterBloc() : super(0) {
//     on<Increment>((event, emit) => emit(state + 1));
//     on<Decrement>((event, emit) => emit(state + 1));
//   }
// }

class CounterCubit extends Cubit<CubitState> {
  CounterCubit() : super(CubitState(0,''));
  final textEditingController = TextEditingController();
  void increment() => emit(CubitState(state.counter+ 1, state.name));
  void decrement() => emit(CubitState(state.counter- 1, state.name));
  void addText()=>emit(CubitState(state.counter, textEditingController.text));
}

class CubitState{
  final int counter;
  final String name;
  CubitState(this.counter,this.name);
}


