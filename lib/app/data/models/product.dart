class Product {
  String? id;
  String? siteId;
  String? title;

  double? price;
  Prices? prices;

  String? permalink;
  String? thumbnail;
  String? thumbnailId;

  Product({
    this.id,
    this.siteId,
    this.title,
    this.price,
    this.prices,
    this.permalink,
    this.thumbnail,
    this.thumbnailId,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['site_id'];
    title = json['title'].toString().toUpperCase();

    price = double.tryParse(json['price'].toString());
    prices =
        json['prices'] != null ? new Prices.fromJson(json['prices']) : null;

    permalink = json['permalink'];
    thumbnail = json['thumbnail'];
    thumbnailId = json['thumbnail_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site_id'] = this.siteId;
    data['title'] = this.title;

    data['price'] = this.price;
    if (this.prices != null) {
      data['prices'] = this.prices!.toJson();
    }

    data['permalink'] = this.permalink;
    data['thumbnail'] = this.thumbnail;
    data['thumbnail_id'] = this.thumbnailId;

    return data;
  }
}

class Prices {
  String? id;
  List<Prices>? prices;

  Prices({
    this.id,
    this.prices,
  });

  Prices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(new Prices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
