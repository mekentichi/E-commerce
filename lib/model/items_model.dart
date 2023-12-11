class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsDescreption;
  String? itemsPrice;
  String? itemsCount;
  String? itemsActive;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCategories;
  String? itemsImage;
  String? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDate;
  String? favorite;
  String? itemsPriceDiscount;


  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsDescreption,
      this.itemsPrice,
      this.itemsCount,
      this.itemsActive,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCategories,
      this.itemsImage,
      this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesDate,
      this.itemsPriceDiscount,
      this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDescreption = json['items_descreption'];
    itemsPrice = json['items_price'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    itemsImage = json['items_image'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDate = json['categories_date'];
    favorite = json['favorite'];
    itemsPriceDiscount = json['itemspricediscount'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_descreption'] = this.itemsDescreption;
    data['items_price'] = this.itemsPrice;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_categories'] = this.itemsCategories;
    data['items_image'] = this.itemsImage;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_date'] = this.categoriesDate;
    data['favorite'] = this.favorite;
    data['itemspricediscount'] = this.itemsPriceDiscount;

    return data;
  }
}
