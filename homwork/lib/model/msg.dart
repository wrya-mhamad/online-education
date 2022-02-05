class MSG {
  String? message;
  MSG({this.message});


factory MSG.fromMap(map) {
    return MSG(
      message: map['message'],
     
    );
  }

Map<String, dynamic> toMap() {
    return {
'message' :message    
    };
  }

}
