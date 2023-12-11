class CategoriesModelStatic {
  String? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDate;

  CategoriesModelStatic(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesDate});

  CategoriesModelStatic.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDate = json['categories_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_date'] = this.categoriesDate;
    return data;
  }
}
