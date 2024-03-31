class PostModel {
   final String postId;
   final String title;
   final String description;
   final bool isOffline;
   final String status;
   final DateTime createdAt;
   final DateTime updatedAt;

   String? content;
   String? location;
   String? registrationLink;
   String? calendar;
   String? route;
   String? tags;
   String? countryCode;
   String? language;
   String? image;
   String? userId;

   double? price;
   int? discount;
   List<DateTime>? eventDates;
   bool? useAutoRegistration;
   bool? isVisible;

   PostModel({
     required this.postId,
     required this.title,
     required this.description,
     required this.isOffline,
     required this.status,
     required this.createdAt,
     required this.updatedAt,
     this.content,
     this.location,
     this.registrationLink,
     this.calendar,
     this.countryCode,
     this.discount,
     this.eventDates,
     this.image,
     this.isVisible,
     this.language,
     this.price,
     this.route,
     this.tags,
     this.useAutoRegistration,
     this.userId
   });

   PostModel fromJson(Map<String, dynamic> json) {
     List<String> jsonDates = json["dates"] ?? [];
     List<DateTime> dates = [];

     if(jsonDates.isNotEmpty) {
       for(String date in jsonDates) {
         dates.add(DateTime.parse(date));
       }
     }

     return PostModel(
         postId: json["id"],
         title: json["title"],
         description: json["description"],
         isOffline: json["isOffline"],
         status: json["status"],
         createdAt: DateTime.parse(json["created_at"]),
         updatedAt: DateTime.parse(json["updated_at"]),
         eventDates: dates,
         content: json["content"],
         location: json["location"],
         registrationLink: json["registration_link"],
         calendar: json["calendar"],
         countryCode: json["country_code"],
         discount: json["discount"],
         price: json["price"],
         image: json["image"],
         isVisible: json["is_viasable"],
         language: json["language"],
         route: json["route"],
         tags: json["tags"],
         useAutoRegistration: json["use_auto_registration"],
         userId: json["user_id"],
     );
   }
}