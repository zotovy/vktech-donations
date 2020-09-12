class FormatServices {
  String formatDate(DateTime date) {
    String day = date.day.toString();
    String month = date.month.toString();

    if (day.length == 1) {
      day = "0" + day;
    }

    if (month.length == 1) {
      month = "0" + month;
    }

    return "$day.$month.${date.year}";
  }

  String getMonth(int index) {
    List<String> month = [
      "Январе",
      "Феврале",
      "Марте",
      "Апреле",
      "Мае",
      "Июне",
      "Июле",
      "Августе",
      "Сентябре",
      "Октябре",
      "Ноябре",
      "Декабре"
    ];

    return month[index];
  }
}
