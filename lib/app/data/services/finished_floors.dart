class FinishedFloors {
  //Dimensiones
  double large;
  double width;
  double height;
  // cant
  int amount;
  //values

  //Dimensiones Ceramica
  double largeCeramic;
  double widthCeramic;
  double? areaCeramic;

  // cantidad de pegamento
  double? ammountGlue;

  //Piso para enchapar
  double largeFloor;
  double widthFloor;

  double? ceramNec;
  double? plinth;

  double? perimeter;
  double? area;
  double? volume;

  FinishedFloors(
      {required this.large,
      required this.width,
      required this.height,
      required this.amount,
      required this.largeCeramic,
      required this.widthCeramic,
      required this.ammountGlue,
      required this.largeFloor,
      required this.widthFloor});

  void calculateDimension() {
    perimeter = (large * width) * 2 * height;
    area = large * width * height;
    volume = large * width * height * amount;
    areaCeramic = largeCeramic * widthCeramic;
    ceramNec = (areaCeramic!) / (largeFloor * widthFloor);
    ammountGlue = areaCeramic! / 4;
  }

  double calculateCement() {
    const double a1 = 8.43;
    const double a2 = 1.05;
    double multiconst = a1 * a2;
    double countCement = multiconst * volume!;
    return countCement;
  }

  double calculateConcrete() {
    const double a1 = 0.54;
    const double a2 = 1.05;
    double multiconst = a1 * a2;
    double countConcrete = multiconst * volume!;
    return countConcrete;
  }

  double calculateMediumStone() {
    const double a1 = 0.55;
    const double a2 = 1.05;
    double multiconst = a1 * a2;
    double countMediumStone = multiconst * volume!;
    return countMediumStone;
  }

  double calculateWater() {
    const double a1 = 0.185;
    const double a2 = 1.05;
    double multiconst = a1 * a2 * 1000;
    double countWater = multiconst * volume!;
    return countWater;
  }
}
