import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sophis/app/home/domain/philosopher_entity.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

part 'philosophers_state.dart';

class PhilosophersCubit extends Cubit<PhilosopherEntity> {
  PhilosophersCubit() : super(Philosophers.values.first.info());

  void onPageChange(int pageIndex) =>
      emit(Philosophers.values[pageIndex].info());
}
