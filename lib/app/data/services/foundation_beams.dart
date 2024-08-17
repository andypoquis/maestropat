class FoundationFeams {
  double large;
  double width;
  double height;
  // cant
  int amount;

  int numberIrons;

  int ammountStirups;
  double widthStirups;
  double largeStirups;

  double? perimeter;
  double? area;
  double? volume;

  FoundationFeams(
      {required this.large,
      required this.width,
      required this.height,
      required this.amount,
      required this.numberIrons,
      required this.ammountStirups,
      required this.largeStirups,
      required this.widthStirups});

  void calculateDimension() {
    perimeter = (large * width) * 2 * height;
    area = large * width * height;
    volume = large * width * height * amount;
  }

  double calculateCement() {
    const double a1 = 9.73;
    const double a2 = 1.05;
    double multiconst = a1 * a2;
    double countCement = multiconst * volume!;
    return countCement;
  }

  double calculateConcrete() {
    const double a1 = 0.52;
    const double a2 = 1.05;
    double multiconst = a1 * a2;
    double countConcrete = multiconst * volume!;
    return countConcrete;
  }

  double calculateMediumStone() {
    const double a1 = 0.53;
    const double a2 = 1.05;
    double multiconst = a1 * a2;
    double countMediumStone = multiconst * volume!;
    return countMediumStone;
  }

  double calculateWater() {
    const double a1 = 0.186;
    const double a2 = 1.05;
    double multiconst = a1 * a2 * 1000;
    double countWater = multiconst * volume!;
    return countWater;
  }

  double iron38() {
    double _largeStirups = largeStirups - 0.015;
    double _widthStirups = widthStirups - 0.015;
    double totalLargeStirups = (_largeStirups + _widthStirups) * 2 + 0.12;
    double totalStirups = ammountStirups * totalLargeStirups;
    double ammountFeStirups = totalStirups / 9;
    return ammountFeStirups;
  }

  double wire16() {
    double pointsCalculated = amount.toDouble() * numberIrons * ammountStirups;
    double x = pointsCalculated * 0.3;
    double calculatedWire = pointsCalculated / 59;
    return calculatedWire;
  }
}
