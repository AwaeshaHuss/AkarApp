abstract class HomeEvent{}

class GetSomeListEvent extends HomeEvent{
  final int id;
  GetSomeListEvent({required this.id});
}