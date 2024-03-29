// Add collections and their documents to the database
// Setup the data first manually
// To use your own name for the document, specify the id
// property (The id must be of type string).  Otherwise,
// the document name will be auto-generated

const _collectionsJson = {
  users: [{
    id: 'W4jqsQEdKFSQQcnpQgLPqZwW07q2',
    name: 'Ali',
    login: '',
    email: 'ali@gmail.com',
    phoneNumber: '0156456',
    photoUrl: 'assets/mathew.png',
    appointment: null,
    hasAppointment: false,
  },
  {
    id: 'sraA5jPYPxfoRW6lkYuCDjsVhPI3',
    name: 'omar',
    login: '',
    email: 'omar@gmail.com',
    phoneNumber: '0156456',
    photoUrl: 'assets/mathew.png',
    appointment: null,
    hasAppointment: false,
  },
  ],
  hospitals: [{
    id: '1',
    hospitalName: 'KPJ',
    description: 'This hospital is best know for patients who have problems with their heart',
    imageURL: 'https://seeklogo.com/images/K/kpj-healthcare-logo-D0487338D6-seeklogo.com.png',
    location: '34.4',
    longitude: 1.47784,
    latitude: 103.74029,
  },
  {
    id: '2',
    hospitalName: 'Sultan Aminah Hospital',
    description: 'This hospital is best know for patients who have problems with their Kidney',
    imageURL: 'https://upload.wikimedia.org/wikipedia/ms/3/35/Hospital_Sultanah_Aminah.png',
    location: '36.7',
    longitude: 1.50178,
    latitude: 103.76578,
  },
  {
    id: '3',
    hospitalName: 'Columbia Hospital',
    description: 'This hospital is best know for patients who have problems with their heart',
    imageURL: 'https://w7.pngwing.com/pngs/492/423/png-transparent-columbia-asia-hospital-seremban-columbia-asia-hospital-salt-lake-columbia-asia-hospital-taiping-others-blue-text-logo.png',
    location: '36.7',
    longitude: 1.50178,
    latitude: 103.76578,
  },
  {
    id: '4',
    hospitalName: 'HsaRoyal Hospital',
    description: 'This hospital is best know for patients who have problems with their heart',
    imageURL: 'https://www.thermh.org.au/sites/default/files/RMH%20logo_1.png',
    location: '36.7',
    longitude: 1.46008,
    latitude: 103.74656,
  },
  {
    id: '5',
    hospitalName: 'Pental Hospital Kuala Lumpur',
    description: 'This hospital is best know for patients who have problems with their heart',
    imageURL: 'https://tukuz.com/wp-content/uploads/2021/01/pantai-hospital-kuala-lumpur-logo-vector.png',
    location: '34.4',
    longitude: 1.47784,
    latitude: 103.74029,
  },
  {
    id: '6',
    hospitalName: 'Agha Khan Hospital',
    description: 'This hospital is best know for patients who have problems with their heart',
    imageURL: 'https://pbs.twimg.com/profile_images/1075310339707846656/j-AXIX3S.jpg',
    location: '36.7',
    longitude: 1.50178,
    latitude: 103.76578,
  },
  {
    id: '7',
    hospitalName: 'Max Hospital',
    description: 'This hospital is best know for patients who have problems with their heart',
    imageURL: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Max_Healthcare_logo.svg/1280px-Max_Healthcare_logo.svg.png',
    location: '36.7',
    longitude: 1.50178,
    latitude: 103.76578,
  },
  {
    id: '8',
    hospitalName: 'Hospital pakar Skudai',
    description: 'This hospital is best know for patients who have problems with their heart',
    imageURL: 'https://upload.wikimedia.org/wikipedia/ms/6/65/Logo_Hospital_Pakar_Sultanah_Fatimah.jpg',
    location: '36.7',
    longitude: 1.46008,
    latitude: 103.74656,
  },
  {
    id: '9',
    hospitalName: 'Columbia Hospital',
    description: 'This hospital is best know for patients who have problems with their heart',
    imageURL: 'https://seeklogo.com/images/K/kpj-healthcare-logo-D0487338D6-seeklogo.com.png',
    location: '36.7',
    longitude: 1.50178,
    latitude: 103.76578,
  },
  {
    id: '10',
    hospitalName: 'John Hopkins Hospital',
    description: 'This hospital is best know for patients who have problems with their heart',
    imageURL: 'https://cdn2.webdamdb.com/1280_ci3Lmo8LD6A7.jpg?1573763632',
    location: '36.7',
    longitude: 1.46008,
    latitude: 103.74656,
  },
  ],
  doctors: [{
    id: 'FPKf2LGxozVYopXXBRvhn1vA2Te2',
    hsopitalId: '1',
    name: 'dr.John',
    firstName: 'John ',
    lastName: 'John michael',
    gender: 'Male',
    email: 'john@gmail.com',
    password: '123456789',
    specialty: 'specialty',
    imageURL: 'https://w7.pngwing.com/pngs/999/1001/png-transparent-lahore-karachi-hammer-of-thor-in-pakistan-urdu-doctor-smiling-male-doctor-with-arms-cross-service-people-expert-thumbnail.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'clao3Q5oS9PEyaJu8e2KXP7sHV33',
    hospitalId: '1',
    name: 'Arsalan',
    firstName: 'Arsalan mujdadi',
    lastName: 'Ibrahim',
    gender: 'Male',
    email: 'mujaddadi@gmail.com',
    password: '123456789',
    specialty: 'specialty',
    imageURL: 'https://www.freepnglogos.com/uploads/doctor-png/doctor-bulk-billing-doctors-chapel-hill-health-care-medical-3.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'NKGDSCzR2AYFMBna71lMqoKCMPq2',
    hospitalId: '1',
    name: 'Sharukh',
    firstName: 'Sharukh Khan',
    lastName: 'Khan',
    gender: 'Male',
    email: 'sharukh@gmail.com',
    password: '123456789',
    specialty: 'specialty',
    imageURL: 'https://cdn.picpng.com/doctors_and_nurses/doctors-and-nurses-picture-32678.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '5tULIiM5MSay80Qyw7IPeA6PzXg2',
    hospitalId: '1',
    name: 'Ismail',
    firstName: 'Mohamed Ibrahim',
    lastName: 'Ibrahim',
    gender: 'Male',
    email: 'Ismail@gmail.com',
    password: '123456789',
    specialty: 'specialty',
    imageURL: 'https://www.miraldental.com/wp-content/uploads/2018/12/doctor-img2.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'wf97kptqkKYZvSJOdvYaaLijt3Y2',
    hospitalId: '1',
    name: 'Adnan',
    firstName: 'Adnan Mujaddadi',
    lastName: 'Mujaddadi',
    gender: 'Male',
    email: 'adnan@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://cdn.picpng.com/doctors_and_nurses/doctors-and-nurses-picture-32678.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '5ByAgNXdlKYnkdn2JE64XPxFeCC3',
    hospitalId: '2',
    name: 'Israr',
    firstName: 'Israr Khan',
    lastName: 'Khan',
    gender: 'Male',
    email: 'khan@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15988.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.7,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'kfAo6TwXH8WE6pe47Zx721BwpZT2',
    hospitalId: '2',
    name: 'Salim',
    firstName: 'Salim Karimi',
    lastName: 'Karimi',
    gender: 'Male',
    email: 'moahmed@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16038.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'danT32kOxaPS16x3ghkiFR4VgyC3',
    hospitalId: '2',
    name: 'Karim',
    firstName: 'KaruM Janat',
    lastName: 'Janat',
    gender: 'Male',
    email: 'janat@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16027.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'HvKLjvBHl8aGhvinbZEiISjH5Bc2',
    hospitalId: '2',
    name: 'Lana Rhodes',
    firstName: 'Rhodes',
    lastName: 'Rhodes',
    gender: 'Male',
    email: 'rhodes@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16028.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'akMjq7s9vtSJFjoPqwan291CLKx1',
    hospitalId: '2',
    name: 'Mit',
    firstName: 'Mit Bakhai',
    lastName: 'Bakhai',
    gender: 'Male',
    email: 'bakhai@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16018.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '9OCWStnRLcc79MkSfBOPeDVtIQn1',
    hospitalId: '3',
    name: 'Nasitr',
    firstName: 'Nasir Khan',
    lastName: 'khan',
    gender: 'Male',
    email: 'nasirkhan@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16014.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '5mFO4ySLKmcVPVfg4xYpCy6XRp82',
    hospitalId: '3',
    name: 'Shams',
    firstName: 'Shams Agha',
    lastName: 'Agha',
    gender: 'Male',
    email: 'shams@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16000.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'omC98pdKyzUawE2IHwzTUwHc5q72',
    hospitalId: '3',
    name: 'Sarim',
    firstName: 'Sarim Hamed',
    lastName: 'Hamed',
    gender: 'Male',
    email: 'sarim@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15994.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '7BhoWxfcuANNNqvguaggnkrptls2',
    hospitalId: '3',
    name: 'Sharif',
    firstName: 'Sharif Mohamed',
    lastName: 'Eltablawy',
    gender: 'Male',
    email: 'sharif@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://assets.webiconspng.com/uploads/2017/09/Doctors-And-Nurses-PNG-Image-66540.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.7,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'Bvk8AQL8SbYGAnXsjZRPiYAD3yA3',
    hospitalId: '3',
    name: 'Khar SppinStargi',
    firstName: 'SpinStargi Mohamed',
    lastName: 'Eltablawy',
    gender: 'Male',
    email: 'spinStargi@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15997.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'HTVrweoEU7bEqXayhNzzsSmzfWM2',
    hospitalId: '4',
    name: 'Jessica',
    firstName: 'Jammes Jessica',
    lastName: 'Junior',
    gender: 'Male',
    email: 'Jessica@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15986.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'ciUpC0y2XDTx02V3O0Zn1vMVKJN2',
    hospitalId: '4',
    name: 'Jennie',
    firstName: 'Jennie ',
    lastName: 'Jennie',
    gender: 'Male',
    email: 'pogba@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15982.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'P2hjPVLRvpecI0mH1EGha4tLrTq1',
    hospitalId: '4',
    name: 'Khaled',
    firstName: 'Khaled Mohamed',
    lastName: 'Hamed',
    gender: 'Male',
    email: 'khaled@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15979.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.5,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'HFHWBc3n4EVQTPIqdXPVkAnXqeC2',
    hospitalId: '4',
    name: 'abdalla',
    firstName: 'abdalla Mohamed',
    lastName: 'abdalla',
    gender: 'Male',
    email: 'abdalla@gmail.com',
    password: '456',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15968.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.1,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '6SZ4iPGvY9Yjj9xWrrxBlSBe4Pv2',
    hospitalId: '4',
    name: 'Messi',
    firstName: 'Messi 1',
    lastName: 'Messi',
    gender: 'Male',
    email: 'messi@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://www.pngkey.com/png/full/305-3053162_save-money-hiring-physicians-doctor-poses.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.1,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '2FRaQLF7dXZ7MNY1KD3uSzP996O2',
    hospitalId: '5',
    name: 'Talha',
    firstName: 'Talha Sohail',
    lastName: 'Sohail',
    gender: 'Male',
    email: 'sohail@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://www.naukrinama.com/stressbuster/wp-content/uploads/2016/07/Doctor-Consultation.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.1,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'EwQXHFXgIES39XetdOYRWZt7PhD3',
    hospitalId: '5',
    name: 'abdalla',
    firstName: 'Kamran abdullah',
    lastName: 'Kamran',
    gender: 'Male',
    email: 'kamran@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://cdn.picpng.com/doctors_and_nurses/download-doctors-and-nurses-32705.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.7,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '5Wtqtu9AwPNtNsk7Aj0vGUzTaV63',
    hospitalId: '5',
    name: 'Jibran',
    firstName: 'Jibran Mohamed',
    lastName: 'EltablawyJiobran',
    gender: 'Male',
    email: 'jibran@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'http://beryldrugs.com/images/doctor.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'BLSZXVIhANXeVyh2gPHL3ySY3j93',
    hospitalId: '5',
    name: 'Hassam',
    firstName: 'Hsaam Rana',
    lastName: 'Rana',
    gender: 'Male',
    email: 'hassam@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15957.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'FXhC0i8upySTdfIaTqgg6j4eTaI2',
    hospitalId: '5',
    name: 'Tibyan',
    firstName: 'Tibu',
    lastName: 'Tibyan ',
    gender: 'Male',
    email: 'tibu@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15959.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.1,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '4wo252L7LLNzyHT2lCIxfNd8oEz2',
    hospitalId: '6',
    name: 'Yamin',
    firstName: 'Yamin Tisher',
    lastName: 'Tisher',
    gender: 'Male',
    email: 'yamin@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15956.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.1,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'gYscWi2GW1ZikfEFJOSCdQ7YJ902',
    hospitalId: '6',
    name: 'Lotfi',
    firstName: 'Lotfi Arif',
    lastName: 'Arif',
    gender: 'Male',
    email: 'lotfi@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15961.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.1,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'mQVA5DZ0FecyK5F9pk5N0mU55TF3',
    hospitalId: '6',
    name: 'Shaista Gul',
    firstName: 'Shaistas',
    lastName: 'Gul',
    gender: 'Male',
    email: 'gul@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15967.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.1,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'orhWnpC93xN7qBYthGgz5nz9FQu1',
    hospitalId: '6',
    name: 'Serin',
    firstName: 'Serin Jala',
    lastName: 'Jala',
    gender: 'Male',
    email: 'serin@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15981.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'eRcGtyvpIDZZjfVWuJtX50Tv4M72',
    hospitalId: '6',
    name: 'Omar',
    firstName: 'Omar Mohamed',
    lastName: 'Eltablawy',
    gender: 'Male',
    email: 'omar22@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15985.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.7,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'drL6VdKDhnN1NLQWn3SNcPIE4HC2',
    hospitalId: '7',
    name: 'Ed',
    firstName: 'Ed Sherin',
    lastName: 'sherin',
    gender: 'Male',
    email: 'sherin@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15995.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'iwzn2YbLIAWdczbBR7uRAg3OE5F3',
    hospitalId: '7',
    name: 'Ahmad',
    firstName: 'Ahmad Hassan',
    lastName: 'Haassan',
    gender: 'Male',
    email: 'hassann@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://purepng.com/public/uploads/large/purepng.com-doctordoctorsdoctors-and-nursesclinicianmedical-practitionernotepadfemale-14215268571744ntgi.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '3o2SJqKHyI2ToAH9wWfE6RHf4r3C23',
    hospitalId: '7',
    name: 'Saby',
    firstName: 'Saby sheher',
    lastName: 'sheher',
    gender: 'Male',
    email: 'saby@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15989.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '2ZMvGq8MBnO7x5R5OUsxUr3QEhY2',
    hospitalId: '7',
    name: 'Shabir',
    firstName: 'Shabir ',
    lastName: 'Eltablawy',
    gender: 'Male',
    email: 'sahbir@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://cdn.picpng.com/doctors_and_nurses/doctors-and-nurses-web-32700.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'SSU7GhYKVRXEt7ouAUAmA61tkpj1',
    hospitalId: '7',
    name: 'Virat',
    firstName: 'Virat kohli',
    lastName: 'Kohli',
    gender: 'Male',
    email: 'kohnli@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://www.pngkit.com/png/full/263-2638969_practices-doctor-physician.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'ssfPAHk2aGSv4qsFdFUTcLSzH323',
    hospitalId: '8',
    name: 'Prajakta',
    firstName: 'Prajakta PK',
    lastName: 'PK',
    gender: 'Male',
    email: 'pk@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://cdn.picpng.com/doctors_and_nurses/doctors-and-nurses-clipart-32677.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '7GuwYdC0PggB31hFjoJXcmuBvnl2',
    hospitalId: '8',
    name: 'Amir',
    firstName: 'Amir Khan',
    lastName: 'Khan',
    gender: 'Male',
    email: 'amir@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15996.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'REGrNLX3UpPIp0iBoYGSpaFCBZA3',
    hospitalId: '8',
    name: 'Mohamamd',
    firstName: 'Mohammad Shehzad',
    lastName: 'Eltablawy',
    gender: 'Male',
    email: 'shehzad@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16000.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'UFIKsMJfZlf9p48tk3auMXLS1BC2',
    hospitalId: '8',
    name: 'MS Dohni',
    firstName: 'MS',
    lastName: 'Dohni',
    gender: 'Male',
    email: 'ms@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16041.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'vrxCW4FSJ5fXafYL6iO4xm3PtGp2',
    hospitalId: '8',
    name: 'Asses',
    firstName: 'Asses Kaur',
    lastName: 'Kaur',
    gender: 'Male',
    email: 'kaur@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16042.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.7,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'ZWp4Iou5QsMdFBU0WMDiOPKYNgm2',
    hospitalId: '9',
    name: 'Arunita',
    firstName: 'Arunit Kanjilal',
    lastName: 'Kanjilal',
    gender: 'Male',
    email: 'kanjilal@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16030.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'nenMLSznZyXUi9LJxG9iSc2RETt2',
    hospitalId: '9',
    name: 'Pawandeep',
    firstName: 'Pawandeep Rajan',
    lastName: 'Rajan',
    gender: 'Male',
    email: 'rajan@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16027.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'MgyYYS9KzJSopLC4YKqZ81AnyjF2',
    hospitalId: '9',
    name: 'Sayli Kamble',
    firstName: 'sAYLI',
    lastName: 'Syli',
    gender: 'Male',
    email: 'sayli@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16019.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'R3YDSR51oEdZPuHWJlDRYwhLdEV2',
    hospitalId: '9',
    name: 'Shanmuka',
    firstName: 'Shanmuka Priya',
    lastName: 'Priya',
    gender: 'Male',
    email: 'priya@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16015.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '9ffixTl246NMAi7rcb8rg9puNL92',
    hospitalId: '9',
    name: 'Mama Jee',
    firstName: 'Mama',
    lastName: 'jee',
    gender: 'Male',
    email: 'jee@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG15977.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.25,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '9vNeLXYDT6Vss4sSIeUxECzfHtd2',
    hospitalId: '1',
    name: 'Danish',
    firstName: 'Mohammad Danish',
    lastName: 'Danish',
    gender: 'Male',
    email: 'danish@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://femscare.com/wp-content/uploads/2018/02/doc-2-e1519324970351.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.7,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'UAlvJiieVSaV8geWoioCIGZDxVz1',
    hospitalId: '1',
    name: 'Katrina Kaif',
    firstName: 'Kaif',
    lastName: 'Kaif',
    gender: 'Male',
    email: 'kaif@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16012.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 'sex3FtjSyFXUA4VmLrmrzXmfxHz2',
    hospitalId: '1',
    name: 'Karina',
    firstName: 'Karina kapoor',
    lastName: 'Karina',
    gender: 'Male',
    email: 'karina@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16010.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: 't6TMYRw32wfB6Y2Wb59cQhnQY1J2',
    hospitalId: '1',
    name: 'Saffiya',
    firstName: 'Saffiya Sajjad',
    lastName: 'sajad',
    gender: 'Male',
    email: 'sajad@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16005.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 3.8,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  {
    id: '1GfVwxAiF5egQDs8xvRvtvZ9QMv1',
    hospitalId: '1',
    name: 'Jenny',
    firstName: 'Jenny DAR',
    lastName: 'Jenny',
    gender: 'Male',
    email: 'jenny@gmail.com',
    password: '123',
    specialty: 'specialty',
    imageURL: 'https://pngimg.com/uploads/doctor/doctor_PNG16002.png',
    imagePath: 'assets/profile.jpg',
    prefix: 'prefix',
    rank: 4.0,
    medicalEducation: 'medicalEducation',
    residency: 'residency',
    internship: 'internship',
    fellowship: 'fellowship',
    biography: 'biography',
  },
  ],
};

const _firestore = require('../api/models/firebase/firebase_admin').firestore();

async function setupDatabase(_req, res, _next) {
  // Start adding the data to the database
  for (const collectionName in _collectionsJson) {
    const collectionData = _collectionsJson[collectionName];

    for (const documentData of collectionData) {
      if (documentData && documentData.id) {
        const documentId = documentData.id;

        // id will not be included in the database. it is used only to name the document
        delete documentData.id;

        const result = await _firestore
            .collection(collectionName)
            .doc(documentId)
            .set(documentData);
        console.log({documentId, result});
      } else {
        await _firestore.collection(collectionName).add(documentData);
        console.log('auto gen doc id');
      }
    }
  }

  res.send('Setting Up Database.... Done ');
}

module.exports = setupDatabase;
