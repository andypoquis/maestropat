class PaintPlasteringWall {
  double large;
  double width;
  double height;
  // cant
  int amount;
  //values
  double? perimeter;
  double? area;
  double? volume;
  PaintPlasteringWall({
    required this.large,
    required this.width,
    required this.height,
    required this.amount,
  });

  void calculateDimension() {
    perimeter = (large * width) * 2 * height;
    area = large * width * height;
    volume = large * width * height * amount;
  }
}
