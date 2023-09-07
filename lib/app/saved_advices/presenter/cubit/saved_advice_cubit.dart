import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';

part 'saved_advice_state.dart';

class SavedAdviceCubit extends Cubit<SavedAdviceState> {
  SavedAdviceCubit() : super(SavedAdviceInitial());
}
