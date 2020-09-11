import 'dart:io';

enum EDonationType {
  OnceDonation,
  RegularDonation,
}

enum EDonFinishWhen {
  WhenRich,
  Date,
}

class OnceDonation {
  EDonationType type;
  File image;
  String name;
  int summa;
  String goal;
  String description;
  String post;
  String author;
  int alreadyRiched;

  double get percent => alreadyRiched / summa;

  EDonFinishWhen whenFinished;
  DateTime finishedWhen;

  OnceDonation(
      {this.whenFinished,
      this.finishedWhen,
      this.type,
      this.image,
      this.name,
      this.summa,
      this.goal,
      this.description,
      this.post,
      this.author,
      this.alreadyRiched});

  String get date {
    if (whenFinished == EDonFinishWhen.WhenRich) {
      return this.alreadyRiched >= this.summa ? "Собрано" : "Активно";
    }

    int days = (finishedWhen.difference(DateTime.now()).inDays).abs();

    if (days >= 365) return (days / 365).floor().toString();
    if (days >= 212) return "Осталось больше 6 месяцев";
    if (days >= 182) return "Осталось 6 месяцев";
    if (days >= 120) return "Осталось больше 3 месяцев";
    if (days >= 90) return "Осталось 3 месяца";
    if (days >= 60) return "Осталось 2 месяца";
    if (days >= 30) return "Остался 1 месяц";

    if (days == 0) return "Отсутствует";

    const fEnding = [1, 21];
    const sEnding = [2, 3, 4, 22, 23, 24];
    if (fEnding.contains(days)) return "Закончиться через $days день";
    if (sEnding.contains(days)) return "Закончиться через $days дня";
    return "Закончиться $days дней";
  }
}

class RegularDonation {
  EDonationType type;
  File image;
  String name;
  int summa;
  String goal;
  String description;
  String post;
  String author;
  int alreadyRiched;

  RegularDonation(
      {this.type,
      this.image,
      this.name,
      this.summa,
      this.goal,
      this.description,
      this.post,
      this.author,
      this.alreadyRiched});

  double get percent => alreadyRiched / summa;

  String get date {
    List<String> month = [
      'Январь',
      'Февраль',
      "Март",
      "Апрель",
      "Май",
      "Июнь",
      "Июль",
      "Август",
      "Сентябрь",
      "Октябрь",
      "Ноябрь",
      "Декабрь"
    ];

    return "Нужно собрать за ${month[DateTime.now().month - 1]}";
  }
}
