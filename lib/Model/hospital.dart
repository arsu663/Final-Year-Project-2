
class Hospital {
  dynamic _id;
  String _hospitalName;
  String _description;
  String _imageURL;
  String _location;
  String _latitude;
  String _longitude;
  // List<dynamic> doctors;
  // final int userId;

  set hospitalName(value) => _hospitalName = value;
  get hospitalName => _hospitalName;
  set description(value) => _description = value;
  get description => _description;
  set imageURL(value) => _imageURL = value;
  get imageURL => _imageURL;
  set location(value) => _location = value;
  get location => _location;
  set id(value) => _id = value;
  get id => _id;

  get latitude => _latitude;
  set latitude(value) => _latitude = value;

  get longitude => _longitude;
  set longitude(value) => _longitude = value;

  Hospital({
    dynamic id,
    String hospitalName = '',
    String description = '',
    String imageURL = '',
    String location = '',
    String latitude = '',
    String longitude = '',
    // this.doctors,
  })  : _id = id,
        _hospitalName = hospitalName,
        _description = description,
        _imageURL = imageURL,
        _location = location,
        _latitude = latitude,
        _longitude = longitude;

  // Hospital.copy(Hospital from)
  //     : this(from.hospitalName, from.description, from.imageURL, from.location,
  //           from.doctors);
  Hospital.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          hospitalName: json["hospitalName"],
          description: json['description'],
          imageURL: json['imageURL'],
          location: json['location'],
          latitude: json['latitude'],
          longitude: json['longitude'],

          // doctors: json['doctors']
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'hospitalName': hospitalName,
        'description': description,
        'imageURL': imageURL,
        'location': location,
        'latitude': latitude,
        'longitude': longitude
        // 'doctors': doctors
      };
}
