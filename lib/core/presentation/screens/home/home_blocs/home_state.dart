import 'package:equatable/equatable.dart';

enum HomeStateStatus { initial, success, error, loading, selected }

extension HomeStateStatusX on HomeStateStatus {
  bool get isInitial => this == HomeStateStatus.initial;
  bool get isSuccess => this == HomeStateStatus.success;
  bool get isError => this == HomeStateStatus.error;
  bool get isLoading => this == HomeStateStatus.loading;
  bool get isSelected => this == HomeStateStatus.selected;
}

class HomeState extends Equatable{
  final HomeStateStatus status;

  const HomeState({
    this.status = HomeStateStatus.initial,
  });

  HomeState copyWith({
    HomeStateStatus? status
  }){
    return HomeState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];

}