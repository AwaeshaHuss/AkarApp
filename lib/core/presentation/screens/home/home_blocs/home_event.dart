abstract class HomeEvent{}

class GetHomeListEvent extends HomeEvent{
  final int id;
  GetHomeListEvent({this.id = 1});
}