class HomeContainer {
  HomeContainer({
    required this.headerGallery,
    required this.headerOffers,
    required this.headerWidgets,
    required this.partnerssectiontilte,
    required this.partners,
    required this.latestprojectssectiontilte,
    required this.latestProjects,
    required this.unitssectiontilte,
    required this.units,
    required this.lastseensectiontitle,
    required this.showAssistant,
    required this.notificationCount,
    required this.showPartners,
    required this.showOffers,
    required this.showUnits,
    required this.showLatestProjects,
    required this.showLastSeen,
    required this.showFundingEligibility,
    required this.showprojectsGroups,
  });
  late final List<HeaderGalleryModel>? headerGallery;
  late final List<HeaderOffers>? headerOffers;
  late final List<HeaderWidgets>? headerWidgets;
  late final String? partnerssectiontilte;
  late final List<PartnersModel>? partners;
  late final String? latestprojectssectiontilte;
  late final LatestProjectsModel? latestProjects;
  late final String? unitssectiontilte;
  late final UnitsModel? units;
  late final String? lastseensectiontitle;
  late final int? showAssistant;
  late final int? notificationCount;
  late final int? showPartners;
  late final int? showOffers;
  late final int? showUnits;
  late final int? showLatestProjects;
  late final int? showLastSeen;
  late final int? showFundingEligibility;
  late final int? showprojectsGroups;
  
  HomeContainer.fromJson(Map<String, dynamic> json){
    headerGallery = List.from(json['headerGallery']).map((e)=>HeaderGalleryModel.fromJson(e)).toList();
    headerOffers = List.from(json['headerOffers']).map((e)=>HeaderOffers.fromJson(e)).toList();
    headerWidgets = List.from(json['headerWidgets']).map((e)=>HeaderWidgets.fromJson(e)).toList();
    partnerssectiontilte = json['partnerssectiontilte'];
    partners = List.from(json['partners']).map((e)=>PartnersModel.fromJson(e)).toList();
    latestprojectssectiontilte = json['latestprojectssectiontilte'];
    latestProjects = LatestProjectsModel.fromJson(json['latestProjects']);
    unitssectiontilte = json['unitssectiontilte'];
    units = UnitsModel.fromJson(json['units']);
    lastseensectiontitle = json['lastseensectiontitle'];
    showAssistant = json['showAssistant'];
    notificationCount = json['notificationCount'];
    showPartners = json['showPartners'];
    showOffers = json['showOffers'];
    showUnits = json['showUnits'];
    showLatestProjects = json['showLatestProjects'];
    showLastSeen = json['showLastSeen'];
    showFundingEligibility = json['showFundingEligibility'];
    showprojectsGroups = json['showprojectsGroups'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['headerGallery'] = headerGallery?.map((e)=>e.toJson()).toList();
    _data['headerOffers'] = headerOffers?.map((e)=>e.toJson()).toList();
    _data['headerWidgets'] = headerWidgets?.map((e)=>e.toJson()).toList();
    _data['partnerssectiontilte'] = partnerssectiontilte;
    _data['partners'] = partners?.map((e)=>e.toJson()).toList();
    _data['latestprojectssectiontilte'] = latestprojectssectiontilte;
    _data['latestProjects'] = latestProjects?.toJson();
    _data['unitssectiontilte'] = unitssectiontilte;
    _data['units'] = units?.toJson();
    _data['lastseensectiontitle'] = lastseensectiontitle;
    _data['showAssistant'] = showAssistant;
    _data['notificationCount'] = notificationCount;
    _data['showPartners'] = showPartners;
    _data['showOffers'] = showOffers;
    _data['showUnits'] = showUnits;
    _data['showLatestProjects'] = showLatestProjects;
    _data['showLastSeen'] = showLastSeen;
    _data['showFundingEligibility'] = showFundingEligibility;
    _data['showprojectsGroups'] = showprojectsGroups;
    return _data;
  }
}

class HeaderGalleryModel {
  HeaderGalleryModel({
    required this.isvideo,
     this.title,
    required this.image,
     this.screenname,
     this.id,
    required this.isLink,
    required this.linktext,
  });
  late final int? isvideo;
  late final dynamic title;
  late final String? image;
  late final dynamic screenname;
  late final dynamic id;
  late final int? isLink;
  late final String? linktext;
  
  HeaderGalleryModel.fromJson(Map<String, dynamic> json){
    isvideo = json['isvideo'];
    title = json['title'];
    image = json['image'];
    screenname = json['screenname'];
    id = json['id'];
    isLink = json['isLink'];
    linktext = json['linktext'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isvideo'] = isvideo;
    _data['title'] = title;
    _data['image'] = image;
    _data['screenname'] = screenname;
    _data['id'] = id;
    _data['isLink'] = isLink;
    _data['linktext'] = linktext;
    return _data;
  }
}

class HeaderOffers {
  HeaderOffers({
    required this.isvideo,
    required this.title,
    required this.image,
    required this.screenname,
    required this.id,
    required this.isLink,
  });
  late final int? isvideo;
  late final String? title;
  late final String? image;
  late final String? screenname;
  late final int? id;
  late final int? isLink;
  
  HeaderOffers.fromJson(Map<String, dynamic> json){
    isvideo = json['isvideo'];
    title = json['title'];
    image = json['image'];
    screenname = json['screenname'];
    id = json['id'];
    isLink = json['isLink'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isvideo'] = isvideo;
    _data['title'] = title;
    _data['image'] = image;
    _data['screenname'] = screenname;
    _data['id'] = id;
    _data['isLink'] = isLink;
    return _data;
  }
}

class HeaderWidgets {
  HeaderWidgets({
    required this.screenname,
    required this.title,
    required this.imageurl,
    required this.iconurl,
  });
  late final String? screenname;
  late final String? title;
  late final String? imageurl;
  late final String? iconurl;
  
  HeaderWidgets.fromJson(Map<String, dynamic> json){
    screenname = json['screenname'];
    title = json['title'];
    imageurl = json['imageurl'];
    iconurl = json['iconurl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['screenname'] = screenname;
    _data['title'] = title;
    _data['imageurl'] = imageurl;
    _data['iconurl'] = iconurl;
    return _data;
  }
}

class PartnersModel {
  PartnersModel({
    required this.screenname,
    required this.id,
    required this.title,
    required this.image,
  });
  late final String? screenname;
  late final int? id;
  late final String? title;
  late final String? image;
  
  PartnersModel.fromJson(Map<String, dynamic> json){
    screenname = json['screenname'];
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['screenname'] = screenname;
    _data['id'] = id;
    _data['title'] = title;
    _data['image'] = image;
    return _data;
  }
}

class LatestProjectsModel {
  LatestProjectsModel({
    required this.description,
    required this.items,
  });
  late final String? description;
  late final List<Items>? items;
  
  LatestProjectsModel.fromJson(Map<String, dynamic> json){
    description = json['description'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['items'] = items?.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Items {
  Items({
    required this.screenname,
    required this.id,
    required this.title,
    required this.image,
    required this.cityname,
    required this.icon,
  });
  late final String? screenname;
  late final int? id;
  late final String? title;
  late final String? image;
  late final String? cityname;
  late final String? icon;
  
  Items.fromJson(Map<String, dynamic> json){
    screenname = json['screenname'];
    id = json['id'];
    title = json['title'];
    image = json['image'];
    cityname = json['cityname'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['screenname'] = screenname;
    _data['id'] = id;
    _data['title'] = title;
    _data['image'] = image;
    _data['cityname'] = cityname;
    _data['icon'] = icon;
    return _data;
  }
}

class UnitsModel {
  UnitsModel({
    required this.items,
  });
  late final List<Items>? items;
  
  UnitsModel.fromJson(Map<String, dynamic> json){
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['items'] = items?.map((e)=>e.toJson()).toList();
    return _data;
  }
}