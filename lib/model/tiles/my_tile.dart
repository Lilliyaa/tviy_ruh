class MyTile{
  String title;
  int type;
  int progress;
  List<MyTile> children;

  MyTile(this.title, this.progress, this.type, [this.children = const <MyTile>[]]);
}