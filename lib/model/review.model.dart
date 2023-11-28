class ReviewModel {
  String? username;
  String? reviewInfo;

  ReviewModel({this.username, this.reviewInfo});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    reviewInfo = json['review_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['review_info'] = this.reviewInfo;
    return data;
  }
}
