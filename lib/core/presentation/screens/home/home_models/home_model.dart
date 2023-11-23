class HomeContainer {
  List<GalleryItem> headerGallery;
  List<OfferItem> headerOffers;
  List<WidgetItem> headerWidgets;
  String partnersSectionTitle;
  List<PartnerItem> partners;
  String latestProjectsSectionTitle;
  LatestProjectsData latestProjects;
  String unitsSectionTitle;
  UnitsData units;
  String lastSeenSectionTitle;
  int showAssistant;
  int notificationCount;
  int showPartners;
  int showOffers;
  int showUnits;
  int showLatestProjects;
  int showLastSeen;
  int showFundingEligibility;
  int showProjectsGroups;

  HomeContainer({
    required this.headerGallery,
    required this.headerOffers,
    required this.headerWidgets,
    required this.partnersSectionTitle,
    required this.partners,
    required this.latestProjectsSectionTitle,
    required this.latestProjects,
    required this.unitsSectionTitle,
    required this.units,
    required this.lastSeenSectionTitle,
    required this.showAssistant,
    required this.notificationCount,
    required this.showPartners,
    required this.showOffers,
    required this.showUnits,
    required this.showLatestProjects,
    required this.showLastSeen,
    required this.showFundingEligibility,
    required this.showProjectsGroups,
  });

  factory HomeContainer.fromJson(Map<String, dynamic> json) {
    return HomeContainer(
      headerGallery: (json['headerGallery'] as List<dynamic>)
          .map((item) => GalleryItem.fromJson(item))
          .toList(),
      headerOffers: (json['headerOffers'] as List<dynamic>)
          .map((item) => OfferItem.fromJson(item))
          .toList(),
      headerWidgets: (json['headerWidgets'] as List<dynamic>)
          .map((item) => WidgetItem.fromJson(item))
          .toList(),
      partnersSectionTitle: json['partnerssectiontilte'] as String,
      partners: (json['partners'] as List<dynamic>)
          .map((item) => PartnerItem.fromJson(item))
          .toList(),
      latestProjectsSectionTitle: json['latestprojectssectiontilte'] as String,
      latestProjects: LatestProjectsData.fromJson(
          json['latestProjects'] as Map<String, dynamic>),
      unitsSectionTitle: json['unitssectiontilte'] as String,
      units: UnitsData.fromJson(json['units'] as Map<String, dynamic>),
      lastSeenSectionTitle: json['lastseensectiontitle'] as String,
      showAssistant: json['showAssistant'] as int,
      notificationCount: json['notificationCount'] as int,
      showPartners: json['showPartners'] as int,
      showOffers: json['showOffers'] as int,
      showUnits: json['showUnits'] as int,
      showLatestProjects: json['showLatestProjects'] as int,
      showLastSeen: json['showLastSeen'] as int,
      showFundingEligibility: json['showFundingEligibility'] as int,
      showProjectsGroups: json['showprojectsGroups'] as int,
    );
  }
}

class GalleryItem {
  int isVideo;
  String? title;
  String image;
  String? screenName;
  dynamic id;
  int isLink;
  String linkText;

  GalleryItem({
    required this.isVideo,
    required this.title,
    required this.image,
    required this.screenName,
    required this.id,
    required this.isLink,
    required this.linkText,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      isVideo: json['isvideo'] as int,
      title: json['title'] as String?,
      image: json['image'] as String,
      screenName: json['screenname'] as String?,
      id: json['id'],
      isLink: json['isLink'] as int,
      linkText: json['linktext'] as String,
    );
  }
}

class OfferItem {
  int isVideo;
  String title;
  String image;
  String screenName;
  int id;
  int isLink;

  OfferItem({
    required this.isVideo,
    required this.title,
    required this.image,
    required this.screenName,
    required this.id,
    required this.isLink,
  });

  factory OfferItem.fromJson(Map<String, dynamic> json) {
    return OfferItem(
      isVideo: json['isvideo'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      screenName: json['screenname'] as String,
      id: json['id'] as int,
      isLink: json['isLink'] as int,
    );
  }
}

class WidgetItem {
  String screenName;
  String title;
  String imageUrl;
  String iconUrl;

  WidgetItem({
    required this.screenName,
    required this.title,
    required this.imageUrl,
    required this.iconUrl,
  });

  factory WidgetItem.fromJson(Map<String, dynamic> json) {
    return WidgetItem(
      screenName: json['screenname'] as String,
      title: json['title'] as String,
      imageUrl: json['imageurl'] as String,
      iconUrl: json['iconurl'] as String,
    );
  }
}

class PartnerItem {
  String screenName;
  int id;
  String title;
  String image;

  PartnerItem({
    required this.screenName,
    required this.id,
    required this.title,
    required this.image,
  });

  factory PartnerItem.fromJson(Map<String, dynamic> json) {
    return PartnerItem(
      screenName: json['screenname'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }
}

class LatestProjectsData {
  String description;
  List<ProjectItem> items;

  LatestProjectsData({
    required this.description,
    required this.items,
  });

  factory LatestProjectsData.fromJson(Map<String, dynamic> json) {
    return LatestProjectsData(
      description: json['description'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => ProjectItem.fromJson(item))
          .toList(),
    );
  }
}

class ProjectItem {
  String screenName;
  int id;
  String title;
  String? image;
  String cityname;
  String icon;

  ProjectItem({
    required this.screenName,
    required this.id,
    required this.title,
    required this.image,
    required this.cityname,
    required this.icon,
  });

  factory ProjectItem.fromJson(Map<String, dynamic> json) {
    return ProjectItem(
      screenName: json['screenname'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String?,
      cityname: json['cityname'] as String,
      icon: json['icon'] as String,
    );
  }
}

class UnitsData {
  List<UnitItem> items;

  UnitsData({
    required this.items,
  });

  factory UnitsData.fromJson(Map<String, dynamic> json) {
    return UnitsData(
      items: (json['items'] as List<dynamic>)
          .map((item) => UnitItem.fromJson(item))
          .toList(),
    );
  }
}

class UnitItem {
  String screenName;
  String photoUrl;
  String title;
  String text;
  String totalPrice;
  String priceText;

  UnitItem({
    required this.screenName,
    required this.photoUrl,
    required this.title,
    required this.text,
    required this.totalPrice,
    required this.priceText,
  });

  factory UnitItem.fromJson(Map<String, dynamic> json) {
    return UnitItem(
      screenName: json['screenname'] as String,
      photoUrl: json['photourl'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      totalPrice: json['totalprice'] as String,
      priceText: json['pricetext'] as String,
    );
  }
}
