class ChartRevenueResponse {
  DaysRevenue? daysRevenue;
  WeekRevenue? weekRevenue;
  MonthlyRevenue? monthlyRevenue;

  ChartRevenueResponse(
      {this.daysRevenue, this.weekRevenue, this.monthlyRevenue});

  ChartRevenueResponse.fromJson(Map<String, dynamic> json) {
    daysRevenue = json['days_revenue'] != null
        ? new DaysRevenue.fromJson(json['days_revenue'])
        : null;
    weekRevenue = json['week_revenue'] != null
        ? new WeekRevenue.fromJson(json['week_revenue'])
        : null;
    monthlyRevenue = json['monthly_revenue'] != null
        ? new MonthlyRevenue.fromJson(json['monthly_revenue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.daysRevenue != null) {
      data['days_revenue'] = this.daysRevenue!.toJson();
    }
    if (this.weekRevenue != null) {
      data['week_revenue'] = this.weekRevenue!.toJson();
    }
    if (this.monthlyRevenue != null) {
      data['monthly_revenue'] = this.monthlyRevenue!.toJson();
    }
    return data;
  }
}

class DaysRevenue {
  int? wednesday;
  int? thursday;
  int? friday;
  int? saturday;
  int? sunday;
  int? monday;
  int? tuesday;

  DaysRevenue(
      {this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sunday,
        this.monday,
        this.tuesday});

  DaysRevenue.fromJson(Map<String, dynamic> json) {
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
    sunday = json['sunday'];
    monday = json['monday'];
    tuesday = json['tuesday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    data['sunday'] = this.sunday;
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    return data;
  }
}

class WeekRevenue {
  int? week1;
  int? week2;
  int? week3;
  int? week4;

  WeekRevenue({this.week1, this.week2, this.week3, this.week4});

  WeekRevenue.fromJson(Map<String, dynamic> json) {
    week1 = json['week1'];
    week2 = json['week2'];
    week3 = json['week3'];
    week4 = json['week4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['week1'] = this.week1;
    data['week2'] = this.week2;
    data['week3'] = this.week3;
    data['week4'] = this.week4;
    return data;
  }
}

class MonthlyRevenue {
  int? january;
  int? february;
  int? march;
  int? april;
  int? may;
  int? june;
  int? july;
  int? august;
  int? september;
  int? october;
  int? november;
  int? december;

  MonthlyRevenue(
      {this.january,
        this.february,
        this.march,
        this.april,
        this.may,
        this.june,
        this.july,
        this.august,
        this.september,
        this.october,
        this.november,
        this.december});

  MonthlyRevenue.fromJson(Map<String, dynamic> json) {
    january = json['january'];
    february = json['february'];
    march = json['march'];
    april = json['april'];
    may = json['may'];
    june = json['june'];
    july = json['july'];
    august = json['august'];
    september = json['september'];
    october = json['october'];
    november = json['november'];
    december = json['december'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['january'] = this.january;
    data['february'] = this.february;
    data['march'] = this.march;
    data['april'] = this.april;
    data['may'] = this.may;
    data['june'] = this.june;
    data['july'] = this.july;
    data['august'] = this.august;
    data['september'] = this.september;
    data['october'] = this.october;
    data['november'] = this.november;
    data['december'] = this.december;
    return data;
  }
}
