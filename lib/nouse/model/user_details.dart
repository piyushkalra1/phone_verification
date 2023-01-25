// class UserDetails {
//
//   String ? displayName;
//   String ? email;
//   String ? photourl;
//
//   UserDetails({this.displayName, this.email,this.photourl});
//
//   UserDetails.fromjson(Map<String,dynamic>json)
//   {
//     displayName = json['displayName'];
//     photourl = json['photourl'];
//     email =json['email'];
//   }
//
//   Map<String,dynamic> tojson(){
//     final Map<String ,dynamic> data = new Map<String, dynamic>();
//     data['displayName']=this.displayName;
//     data['email']=this.email;
//     data['photourl']=this.photourl;
//
//     return data;
//   }
// }