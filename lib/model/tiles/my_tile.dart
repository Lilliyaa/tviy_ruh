class MyTile{
  String title;
  int type;
  List<MyTile> children;

  MyTile(this.title, this.type, [this.children = const <MyTile>[]]);
}