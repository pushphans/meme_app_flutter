// ignore_for_file: file_names

class Memes {
  String? postLink;
  String? url;
  List<String>? previewList;

  Memes({this.postLink, this.url, this.previewList});

  Memes copyWith({String? postLink, String? url, List<String>? previewList}) =>
      Memes(
        postLink: postLink ?? this.postLink,
        url: url ?? this.url,
        previewList: previewList ?? this.previewList,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["postLink"] = postLink;
    map["url"] = url;
    map["preview"] = previewList;
    return map;
  }

  Memes.fromJson(dynamic json) {
    postLink = json["postLink"];
    url = json["url"];
    previewList = json["preview"] != null ? json["preview"].cast<String>() : [];
  }
}

class ApiResponse {
  num? count;
  List<Memes>? memesList;

  ApiResponse({this.count, this.memesList});

  ApiResponse copyWith({num? count, List<Memes>? memesList}) => ApiResponse(
    count: count ?? this.count,
    memesList: memesList ?? this.memesList,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["count"] = count;
    if (memesList != null) {
      map["memes"] = memesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  ApiResponse.fromJson(dynamic json) {
    count = json["count"];
    if (json["memes"] != null) {
      memesList = [];
      json["memes"].forEach((v) {
        memesList?.add(Memes.fromJson(v));
      });
    }
  }
}
