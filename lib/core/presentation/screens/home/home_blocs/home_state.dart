import 'package:akar_app/core/presentation/screens/home/home_models/home_model.dart';
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
  final HomeContainer? homeContainer;

  const HomeState({
    this.status = HomeStateStatus.initial,
    this.homeContainer,
  });

  HomeState copyWith({
    HomeStateStatus? status,
    HomeContainer? homeContainer,
  }){
    return HomeState(
      status: status ?? this.status,
      homeContainer: homeContainer ?? this.homeContainer,
    );
  }

  @override
  List<Object?> get props => [
    status,
    homeContainer,
  ];

}