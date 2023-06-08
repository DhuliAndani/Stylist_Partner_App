import 'package:app/models/userModel.dart';

class UserRequest {
  int vendor_id;
  int id;
  String service_date;
  String service_time;
  String total_price;
  int status;
  String statustext;
  User user;
  int home_service_changes;
  String service_type;
  AddressSelected address;
  UserRequest();

  Map<String, dynamic> toJson() => {
        'vendor_id': vendor_id != null ? vendor_id : null,
        'service_date': service_date != null ? service_date : null,
        'service_time': service_time != null ? service_time : null,
      };

  UserRequest.fromJson(Map<String, dynamic> json) {
    try {
      vendor_id =
          json['vendor_id'] != null ? int.parse('${json['vendor_id']}') : null;
      id = json['id'] != null ? int.parse('${json['id']}') : null;
      status = json['status'] != null ? int.parse('${json['status']}') : null;
      service_date = json['service_date'] != null ? json['service_date'] : null;
      statustext = json['statustext'] != null ? json['statustext'] : null;
      user = (json['user'] != null) ? User.fromJson(json['user']) : null;
      total_price = json['total_price'] != null ? json['total_price'] : null;
      service_time = json['service_time'] != null ? json['service_time'] : null;
      home_service_changes = json['home_service_changes'] != null ? int.parse('${json['home_service_changes']}') : null;
      service_type = json['service_type'] != null ? json['service_type'] : null;
      address = json['address'] != null ? AddressSelected.fromJson(json['address']) : null;
    } catch (e) {
      print("Exception - userRequestModel.dart - UserRequest.fromJson():" +
          e.toString());
    }
  }

  @override
  String toString() {
    return 'UserRequest{vendor_id: $vendor_id, id: $id, service_date: $service_date, service_time: $service_time, total_price: $total_price, status: $status, statustext: $statustext, user: $user, home_service_changes: $home_service_changes, service_type: $service_type, address: $address}';
  }
}

class AddressSelected {
  dynamic addressId;
  dynamic type;
  dynamic userId;
  dynamic receiverName;
  dynamic receiverPhone;
  dynamic city;
  dynamic society;
  dynamic houseNo;
  dynamic landmark;
  dynamic state;
  dynamic pincode;
  dynamic lat;
  dynamic lng;
  dynamic selectStatus;
  dynamic addedAt;
  dynamic updatedAt;
  dynamic deletedAt;
  AddressSelected();
  AddressSelected.fromJson(Map<String, dynamic> json) {
    try {
      addressId = json['address_id'];
      type = json['type'];
      userId = json['user_id'];
      receiverName = json['receiver_name'];
      receiverPhone = json['receiver_phone'];
      city = json['city'];
      society = json['society'];
      houseNo = json['house_no'];
      landmark = json['landmark'];
      state = json['state'];
      pincode = json['pincode'];
      lat = json['lat'];
      lng = json['lng'];
      selectStatus = json['select_status'];
      addedAt = json['added_at'];
      updatedAt = json['updated_at'];
      deletedAt = json['deleted_at'];
    } catch (e) {
      print("Exception - allBookingsModel.dart - ReviewRating.fromJson():" + e.toString());
    }
  }

  @override
  String toString() {
    return 'AddressSelected{addressId: $addressId, type: $type, userId: $userId, receiverName: $receiverName, receiverPhone: $receiverPhone, city: $city, society: $society, houseNo: $houseNo, landmark: $landmark, state: $state, pincode: $pincode, lat: $lat, lng: $lng, selectStatus: $selectStatus, addedAt: $addedAt, updatedAt: $updatedAt, deletedAt: $deletedAt}';
  }
}
