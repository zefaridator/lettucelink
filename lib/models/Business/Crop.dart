class Crop {
  late String name;
  late double irrigationNeed = 0;
  late double kIni = 0;
  late double kMid = 0;
  late double kEnd = 0;

  late double kIniDuration = 0;
  late double kMidDuration = 0;
  late double kEndDuration = 0;
  int _hydricState = 0; // Attribut privé pour le stockage de l'état hydrique 0 : Green , 1 : Orange  2 : Red

  // Getter pour hydricState
  int get hydricState => _hydricState;

  // Setter pour hydricState
  set hydricState(int newState) {
    if (newState >= 0 && newState <= 2) {
      _hydricState = newState;
    } else {
      throw ArgumentError('L\'état hydrique doit être compris entre 0 et 2.');
    }
  }
  DateTime _plantingDate = DateTime(2024, 01, 01);

  Crop({required this.name, required int hydricState}): _hydricState = hydricState;

  // Getter pour le coefficient de culture (Kc)
  double get kc => calculateKc(_calculateDaysFromPlanting());

  // Setter pour la date de plantation
  set plantingDate(DateTime date) {
    _plantingDate = date;
  }

  // Fonction pour calculer le coefficient de culture (Kc) en fonction de la date de plantation et du nombre de jours passés
  double calculateKc(int days) {
    double kc = kIni;

    if (days <= kIniDuration) {
      // Pendant la période kIniDuration, Kc reste constant à la valeur kIni
      kc = kIni;
    } else if (days <= kIniDuration + kMidDuration && days > kIniDuration) {
      // Pendant la période kMidDuration, Kc augmente linéairement de kIni à kMid
      double growthRate = (kMid - kIni) / kMidDuration;
      kc = kIni + growthRate * (days - kIniDuration);
    } else if (days <= kIniDuration + kMidDuration + kEndDuration && days > kIniDuration + kMidDuration) {
      // Pendant la période kEndDuration, Kc augmente linéairement de kMid à kEnd
      double growthRate = (kEnd - kMid) / kEndDuration;
      kc = kMid + growthRate * (days - kIniDuration - kMidDuration);
    } else {
      // Après la période kEndDuration, Kc reste constant à la valeur kEnd
      kc = kEnd;
    }
    return kc;
  }

  // Fonction pour calculer le nombre de jours écoulés depuis la plantation
  int _calculateDaysFromPlanting() {
    DateTime currentDate = DateTime.now();
    return currentDate.difference(_plantingDate).inDays;
  }
}
