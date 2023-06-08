import 'package:app/models/userModel.dart';

class AppointmentHistory {
  int vendorId;
  int id;
  String serviceDate;
  String serviceTime;
  String totalPrice;
  int status;
  String statustext;
  User user;

  AppointmentHistory();
  AppointmentHistory.fromJson(Map<String, dynamic> json) {
    try {
      vendorId = json['vendor_id'] != null ? int.parse('${json['vendor_id']}') : null;
      serviceDate = json['service_date'] != null ? json['service_date'] : null;
      id = json['id'] != null ? int.parse('${json['id']}') : null;
      status = json['status']!=null?int.parse('${json['status']}'):null;
      statustext = json['statustext'] != null ? json['statustext'] : null;
      user = (json['user'] != null) ? User.fromJson(json['user']) : null;
      totalPrice = json['total_price'] != null ? json['total_price'] : null;
      serviceTime = json['service_time'] != null ? json['service_time'] : null;
    } catch (e) {
      print("Exception - appointmentHistoryModel.dart - AppointmentHistory.fromJson():" + e.toString());
    }
  }

  Map<String, dynamic> toJson() => {
        'vendor_id': vendorId != null ? vendorId : null,
        'service_date': serviceDate != null ? serviceDate : null,
        'service_time': serviceTime != null ? serviceTime : null,
      };
}
