class MovieDetails {
  Ratings? ratings;
  String? description;
  bool? live;
  String? thumbnail;
  String? cloudinaryBannerId;
  String? launchDate;
  String? cloudinaryThumbnailId;
  String? cloudinaryVideoId;
  bool? launchFlag;
  String? video;
  int? views;
  String? id;
  String? directors;
  String? type;
  String? year;
  String? image;
  String? genres;
  String? languages;
  String? runtimeStr;
  String? plot;
  String? writers;
  String? sId;
  String? title;
  String? madeBy;
  String? studioId;
  List<ActorsList>? actorsList;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? banner;

  MovieDetails(
      {this.ratings,
      this.description,
      this.live,
      this.thumbnail,
      this.cloudinaryBannerId,
      this.launchDate,
      this.cloudinaryThumbnailId,
      this.cloudinaryVideoId,
      this.launchFlag,
      this.video,
      this.views,
      this.id,
      this.directors,
      this.type,
      this.year,
      this.image,
      this.genres,
      this.languages,
      this.runtimeStr,
      this.plot,
      this.writers,
      this.sId,
      this.title,
      this.madeBy,
      this.studioId,
      this.actorsList,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.banner});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    ratings =
        json['Ratings'] != null ? new Ratings.fromJson(json['Ratings']) : null;
    description = json['description'];
    live = json['live'];
    thumbnail = json['thumbnail'];
    cloudinaryBannerId = json['cloudinaryBanner_id'];
    launchDate = json['launchDate'];
    cloudinaryThumbnailId = json['cloudinaryThumbnail_id'];
    cloudinaryVideoId = json['cloudinaryVideo_id'];
    launchFlag = json['launch_flag'];
    video = json['video'];
    views = json['views'];
    id = json['Id'];
    directors = json['directors'];
    type = json['type'];
    year = json['year'];
    image = json['image'];
    genres = json['genres'];
    languages = json['Languages'];
    runtimeStr = json['RuntimeStr'];
    plot = json['Plot'];
    writers = json['Writers'];
    sId = json['_id'];
    title = json['title'];
    madeBy = json['madeBy'];
    studioId = json['studio_id'];
    if (json['Actors_list'] != null) {
      actorsList = <ActorsList>[];
      json['Actors_list'].forEach((v) {
        actorsList!.add(new ActorsList.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (ratings != null) {
      data['Ratings'] = ratings!.toJson();
    }
    data['description'] = description;
    data['live'] = live;
    data['thumbnail'] = thumbnail;
    data['cloudinaryBanner_id'] = cloudinaryBannerId;
    data['launchDate'] = launchDate;
    data['cloudinaryThumbnail_id'] = cloudinaryThumbnailId;
    data['cloudinaryVideo_id'] = cloudinaryVideoId;
    data['launch_flag'] = launchFlag;
    data['video'] = video;
    data['views'] = views;
    data['Id'] = id;
    data['directors'] = directors;
    data['type'] = type;
    data['year'] = year;
    data['image'] = image;
    data['genres'] = genres;
    data['Languages'] = languages;
    data['RuntimeStr'] = runtimeStr;
    data['Plot'] = plot;
    data['Writers'] = writers;
    data['_id'] = sId;
    data['title'] = title;
    data['madeBy'] = madeBy;
    data['studio_id'] = studioId;
    if (actorsList != null) {
      data['Actors_list'] = actorsList!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['banner'] = banner;
    return data;
  }
}

class Ratings {
  String? imDb;
  String? metacritic;
  String? theMovieDb;
  String? rottenTomatoes;
  String? tVCom;
  String? filmAffinity;

  Ratings(
      {this.imDb,
      this.metacritic,
      this.theMovieDb,
      this.rottenTomatoes,
      this.tVCom,
      this.filmAffinity});

  Ratings.fromJson(Map<String, dynamic> json) {
    imDb = json['imDb'];
    metacritic = json['metacritic'];
    theMovieDb = json['theMovieDb'];
    rottenTomatoes = json['rottenTomatoes'];
    tVCom = json['tV_com'];
    filmAffinity = json['filmAffinity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imDb'] = imDb;
    data['metacritic'] = metacritic;
    data['theMovieDb'] = theMovieDb;
    data['rottenTomatoes'] = rottenTomatoes;
    data['tV_com'] = tVCom;
    data['filmAffinity'] = filmAffinity;
    return data;
  }
}

class ActorsList {
  String? sId;
  String? id;
  String? image;
  String? name;
  String? asCharacter;

  ActorsList({this.sId, this.id, this.image, this.name, this.asCharacter});

  ActorsList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    asCharacter = json['asCharacter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['asCharacter'] = asCharacter;
    return data;
  }
}
