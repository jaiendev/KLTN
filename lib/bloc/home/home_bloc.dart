import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/app_state/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(index: 0));

  int currentIndex = 0;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OnChangeIndexEvent) {
      _handleChangeIndex(event);
      yield _homeDone;
    }
    // if (event is RefreshHomeEvent) {
    //   AppBloc.categoryHomeBloc.add(RefreshCategoryHomeEvent());
    //   AppBloc.categoryBloc.add(RefreshCategoriesEvent());
    //   AppBloc.discoverBloc.add(RefreshDiscoverEvent());
    //   AppBloc.hotExpertHomeBloc.add(RefreshHotExpertEvent());
    //   event.handleFinished();
    // }
  }

  // MARK: Private methods
  HomeDone get _homeDone => HomeDone(index: currentIndex);

  _handleChangeIndex(OnChangeIndexEvent event) {
    currentIndex = event.index;

    if (currentIndex == 0) {
      AppBloc.appStateBloc.add(OnStartApp());
    }
  }
}
