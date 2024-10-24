part of 'tabs_cubit.dart';

class TabsState extends Equatable {
  int index;
  TabsState(this.index);

  TabsState copyWidth({
    int? index
}){
    return TabsState(index ?? this.index);
}

  @override
  List<Object?> get props => [index];
}
