class PostModelPractice {
  final String firstName;
  final String lastName;
  final int totalPrice;
  final bool despositpaid;
  final BookingDate bookingDate;
  final String additionalneeds;

  PostModelPractice({
    required this.firstName,
    required this.lastName,
    required this.totalPrice,
    required this.despositpaid,
    required this.bookingDate,
    required this.additionalneeds,
  });
  Map<String,dynamic>tojosn(){
    return {
      'firstname':firstName,
      "lastname": lastName,
      'totalprice':totalPrice,
      'depositpaid':true,
      'bookingdates':bookingDate.toJson(),
      'additionalneeds':additionalneeds
    };
  }
}




class BookingDate{
  final String checkIn;
  final String checkOut;
  BookingDate({
    required this.checkIn,
    required this.checkOut
});
  Map<String,dynamic>toJson(){
    return {
      "checkin": checkIn,
      'checkout':checkOut
    };
  }
}
