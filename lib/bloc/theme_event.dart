part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable{
  const ThemeEvent();
}

class Changetheme extends ThemeEvent{
  final ThemeData themeData;

  const Changetheme(this.themeData);

  @override
  List<Object> get props => [themeData];
}