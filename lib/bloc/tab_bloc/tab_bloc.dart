import 'package:bloc/bloc.dart';

import 'tab_state.dart';

class TabBloc extends Cubit<TabState> {
  TabBloc({int index = 0}) : super(TabChanged(index));

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    emit(TabChanged(_selectedIndex));
  }
}
