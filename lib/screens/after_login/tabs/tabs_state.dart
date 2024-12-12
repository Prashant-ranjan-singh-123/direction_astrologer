part of 'tabs_cubit.dart';

class TabsState extends Equatable {
  int index;
  bool loading;
  int counterModelIndex;
  TabsState(this.index, this.loading, this.counterModelIndex);

  TabsState copyWidth({int? index, bool? loading, int? counterModelIndex}) {
    return TabsState(index ?? this.index, loading ?? this.loading,
        counterModelIndex ?? this.counterModelIndex);
  }

  @override
  List<Object?> get props => [index, loading, counterModelIndex];
}
