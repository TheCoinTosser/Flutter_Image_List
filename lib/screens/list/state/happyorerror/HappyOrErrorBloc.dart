import 'package:bloc/bloc.dart';
import 'package:flutterpresentation/screens/list/state/happyorerror/HappyOrErrorEvent.dart';

import 'HappyOrErrorState.dart';

class HappyOrErrorBloc extends Bloc<HappyOrErrorEvent, int>{

  @override
  int get initialState => HappyOrErrorState.HAPPY_FACE_INDEX;

  @override
  Stream<int> mapEventToState(HappyOrErrorEvent event) async*{
    switch(event){
      case HappyOrErrorEvent.ON_HAPPY_FACE_TAPPED:
        yield HappyOrErrorState.HAPPY_FACE_INDEX;
        break;
      case HappyOrErrorEvent.ON_SKULL_TAPPED:
        yield HappyOrErrorState.SKULL_INDEX;
        break;
    }
  }
}