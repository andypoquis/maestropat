class FlatBeams {
  //Dimensiones
  double large;
  double width;
  double height;
  // cant
  int amount;
  //values
  double? perimeter;
  double? area;
  double? volume;
  FlatBeams({
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
