// ignore_for_file: unnecessary_string_interpolations

class DoctorDetails {
  final String docName, docImage;

  DoctorDetails(
    this.docImage,
    this.docName,
  );
}
//type1
//----------------------------------------------------------------------------
// List<DoctorDetails> docInfo = [
//   DoctorDetails(
//     docImage: "assets/images/doc1.jpg",
//     docName: "Darrell Steward",
//   ),
//   DoctorDetails(
//     docImage: "assets/images/doc2.jpg",
//     docName: "Wade Warren",
//   ),
//   DoctorDetails(
//     docImage: "assets/images/doc3.jpg",
//     docName: "Loui Sara",
//   ),
//   DoctorDetails(
//     docImage: "assets/images/doc4.jpg",
//     docName: "Taylor Swift",
//   ),
//   DoctorDetails(
//     docImage: "assets/images/doc5.jpg",
//     docName: "Samia Sruty",
//   ),
//   DoctorDetails(
//     docImage: "assets/images/doc6.jpg",
//     docName: "David Paul",
//   ),
//   DoctorDetails(
//     docImage: "assets/images/doc7.jpg",
//     docName: "Nazia Bhatt",
//   ),
//   DoctorDetails(
//     docImage: "assets/images/doc8.jpg",
//     docName: "Sanjida Setu",
//   ),
//   DoctorDetails(
//     docImage: "assets/images/doc9.jpg",
//     docName: "John Cena",
//   ),
// ];

//type2
//----------------------------------------------------------------------------
List<String> docName = [
  "Darrell Steward",
  "Wade Warren",
  "Loui Sara",
  "Taylor Swift",
  "Samia Sruty",
  "David Paul",
  "Nazia Bhatt",
  "Sanjida Setu",
  "John Cena",
];

List<String> docImage = [
  "assets/images/doc1.jpg",
  "assets/images/doc2.jpg",
  "assets/images/doc3.jpg",
  "assets/images/doc4.jpg",
  "assets/images/doc5.jpg",
  "assets/images/doc6.jpg",
  "assets/images/doc7.jpg",
  "assets/images/doc8.jpg",
  "assets/images/doc9.jpg",
];

final List<DoctorDetails> doctorInfo = List.generate(docName.length,
    (index) => DoctorDetails("${docImage[index]}", "${docName[index]}"));
