class OnFundation {
  double large;
  double width;
  double height;
  int amount;

  double? perimeter;
  double? area;
  double? volume;

  OnFundation({
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

  double calculateCement() {
    const double a1 = 7.01;
    const double a2 = 1.05;
    double multiconst = a1 * a2;
    double countCement = multiconst * volume!;
    return countCement;
  }

  double calculateConcrete() {
    const double a1 = 0.51;
    const double a2 = 1.05;
    double multiconst = a1 * a2;
    double countConcrete = multiconst * volume!;
    return countConcrete;
  }

  double calculateMediumStone() {
    const double a1 = 0.54;
    const double a2 = 1.05;
    double multiconst = a1 * a2;
    double countMediumStone = multiconst * volume!;
    return countMediumStone;
  }

  double calculateWater() {
    const double a1 = 0.184;
    const double a2 = 1.05;
    double multiconst = a1 * a2 * 1000;
    double countWater = multiconst * volume!;
    return countWater;
  }

  Map<String, dynamic> materials() {
    return {
      'CEMENTO': calculateCement(),
      'HORMIGON': calculateConcrete(),
      'PIEDRA MED.': calculateMediumStone(),
      'AGUAR': calculateWater()
    };
  }
}
