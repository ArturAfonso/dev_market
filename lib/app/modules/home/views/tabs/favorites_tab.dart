import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teste_dev_flutter/app/data/global/components/item_tile.dart';
import 'package:teste_dev_flutter/app/data/global/constants.dart';
import 'package:teste_dev_flutter/app/data/models/cart_item.dart';
import 'package:teste_dev_flutter/app/data/models/favorites_model.dart';

import 'package:teste_dev_flutter/app/data/models/product.dart';
import 'package:teste_dev_flutter/app/modules/home/controllers/home_controller.dart';

class FavoriteTab extends StatefulWidget {
  List<FavoriteItemModel> favorites = <FavoriteItemModel>[];
  FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTab();
}

class _FavoriteTab extends State<FavoriteTab> {
  HomeController homeController = HomeController();
  final storageUser = GetStorage('user');
  final storageProdutos = GetStorage('produtos');
  final storageCartProdutos = GetStorage('cart');
  final storageFavorites = GetStorage('favorites');
  List<Product> listProducts = <Product>[];
  List<FavoriteItemModel> favoritos = <FavoriteItemModel>[];
/* 
  getProductDatabase() async {
    if (storageProdutos.read("produtos") == null) {
      //create storage

      String produtos = jsonEncode({
        "results": [
          {
            "id": "MLB2673406676",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 Ultra (snapdragon) Dual Sim 256 Gb Phantom White 12 Gb Ram",
            "seller": {
              "id": 1297655,
              "permalink": "http://perfil.mercadolivre.com.br/R.S.+ORIGINAL",
              "registration_date": "2006-10-30T19:30:26.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "credits_profile", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0.0126,
                    "value": 3
                  },
                  "claims": {"period": "365 days", "rate": 0.0126, "value": 3},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0.0101,
                    "value": 2
                  },
                  "sales": {"period": "365 days", "completed": 197}
                },
                "transactions": {
                  "canceled": 40,
                  "period": "historic",
                  "total": 237,
                  "ratings": {
                    "negative": 0.08,
                    "neutral": 0.06,
                    "positive": 0.86
                  },
                  "completed": 197
                }
              }
            },
            "price": 7199,
            "prices": {
              "id": "MLB2673406676",
              "prices": [
                {
                  "id": "29",
                  "type": "standard",
                  "amount": 7199,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-12T10:28:55Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "23",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-28T04:25:33Z",
                    "end_time": "2022-07-05T04:25:33Z",
                    "eligible": true
                  },
                  "amount": 7190,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-29T13:58:10Z"
                },
                {
                  "id": "24",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 7090,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-29T13:58:10Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 3,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_special",
            "stop_time": "2042-06-04T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://www.mercadolivre.com.br/samsung-galaxy-s22-ultra-snapdragon-dual-sim-256-gb-phantom-white-12-gb-ram/p/MLB18967704",
            "thumbnail":
                "http://http2.mlstatic.com/D_834464-MLA49303777747_032022-I.jpg",
            "thumbnail_id": "834464-MLA49303777747_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 12,
              "amount": 697.94,
              "rate": 16.34,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-PR",
              "state_name": "Paraná",
              "city_id": "TUxCQ0xPTmI2Njg1",
              "city_name": "Londrina"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-PR", "name": "Paraná"},
              "city": {"id": "TUxCQ0xPTmI2Njg1", "name": "Londrina"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_struct": null,
                "values": [
                  {"source": 1, "id": "206", "name": "Samsung", "struct": null}
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung"
              },
              {
                "value_name": "SM-S908",
                "values": [
                  {
                    "id": "11850085",
                    "name": "SM-S908",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_id": "11850085",
                "value_struct": null
              },
              {
                "value_id": "11732851",
                "value_struct": null,
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "value_name": "Adreno 730",
                "attribute_group_id": "OTHERS",
                "source": 4709228965570453
              },
              {
                "id": "ITEM_CONDITION",
                "value_name": "Novo",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1505,
                "name": "Condição do item",
                "value_id": "2230284",
                "value_struct": null,
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 1505
                  }
                ]
              },
              {
                "value_id": "249991",
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 1
                  }
                ],
                "id": "LINE",
                "name": "Linha",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "values": [
                  {
                    "id": "12063780",
                    "name": "S22 Ultra Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 1
                  }
                ],
                "id": "MODEL",
                "value_id": "12063780",
                "value_name": "S22 Ultra Dual SIM (Snapdragon)",
                "value_struct": null,
                "name": "Modelo",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "name": "Modelo do processador",
                "value_name": "Snapdragon 8 Gen 1",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "id": "PROCESSOR_MODEL",
                "value_id": "11764992",
                "values": [
                  {
                    "source": 4709228965570453,
                    "id": "11764992",
                    "name": "Snapdragon 8 Gen 1",
                    "struct": null
                  }
                ]
              }
            ],
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967704",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "catalog_listing": true,
            "use_thumbnail_id": true,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null,
            "order_backend": 1
          },
          {
            "id": "MLB2671921591",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22+ Dual Sim 256 Gb Phantom White 8 Gb Ram",
            "seller": {
              "id": 39201446,
              "permalink":
                  "http://perfil.mercadolivre.com.br/ACESSIVELSHOP.COM.BR",
              "registration_date": "2010-12-25T20:22:15.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "mshops",
                "credits_profile",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": "gold",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 2},
                  "claims": {"period": "60 days", "rate": 0.0215, "value": 7},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0192,
                    "value": 6
                  },
                  "sales": {"period": "60 days", "completed": 303}
                },
                "transactions": {
                  "canceled": 63,
                  "period": "historic",
                  "total": 736,
                  "ratings": {"negative": 0.02, "neutral": 0, "positive": 0.98},
                  "completed": 673
                }
              }
            },
            "price": 5599,
            "prices": {
              "id": "MLB2671921591",
              "prices": [
                {
                  "id": "14",
                  "type": "standard",
                  "amount": 5599,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-27T12:37:45Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "15",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5599,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-27T12:37:46Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 2,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_special",
            "stop_time": "2042-06-22T12:37:29.000Z",
            "condition": "new",
            "permalink":
                "https://www.mercadolivre.com.br/samsung-galaxy-s22-dual-sim-256-gb-phantom-white-8-gb-ram/p/MLB18967709",
            "thumbnail":
                "http://http2.mlstatic.com/D_643975-MLA50498654441_062022-I.jpg",
            "thumbnail_id": "643975-MLA50498654441_062022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 12,
              "amount": 542.82,
              "rate": 16.34,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-RJ",
              "state_name": "Rio de Janeiro",
              "city_id": "BR-RJ-01",
              "city_name": "Rio de Janeiro"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["self_service_in", "mandatory_free_shipping"],
              "logistic_type": "xd_drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-RJ", "name": "Rio de Janeiro"},
              "city": {"id": "BR-RJ-01", "name": "Rio de Janeiro"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "source": 1,
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "value_struct": null,
                "values": [
                  {"id": "206", "name": "Samsung", "struct": null, "source": 1}
                ]
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "id": "11850088",
                    "name": "SM-S906",
                    "struct": null,
                    "source": 1
                  }
                ],
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "value_id": "11850088",
                "value_name": "SM-S906"
              },
              {
                "value_id": "2230284",
                "value_struct": null,
                "values": [
                  {
                    "source": 3045741222775799,
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null
                  }
                ],
                "source": 3045741222775799,
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_name": "Novo",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 1,
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null,
                "attribute_group_id": "OTHERS"
              },
              {
                "attribute_group_name": "Outros",
                "source": 1,
                "id": "MODEL",
                "name": "Modelo",
                "value_struct": null,
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_id": "OTHERS",
                "value_id": "11850079",
                "value_name": "S22+"
              },
              {
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "id": "PROCESSOR_MODEL",
                "value_id": "11850084",
                "attribute_group_id": "OTHERS",
                "source": 1,
                "name": "Modelo do processador",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 1
                  }
                ]
              }
            ],
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967709",
            "tags": [
              "good_quality_thumbnail",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "catalog_listing": true,
            "use_thumbnail_id": true,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null,
            "order_backend": 2
          },
          {
            "id": "MLB2611341767",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 (snapdragon) Dual Sim 128 Gb Pink Gold 8 Gb Ram",
            "seller": {
              "id": 83489253,
              "permalink": "http://perfil.mercadolivre.com.br/JEFFERBRITO",
              "registration_date": "2009-08-12T20:31:23.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "credits_profile",
                "mshops",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "4_light_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0.1212,
                    "value": 8
                  },
                  "sales": {"period": "365 days", "completed": 66}
                },
                "transactions": {
                  "canceled": 7,
                  "period": "historic",
                  "total": 73,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 66
                }
              }
            },
            "price": 4426,
            "prices": {
              "id": "MLB2611341767",
              "prices": [
                {
                  "id": "686",
                  "type": "standard",
                  "amount": 4426,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-13T14:27:16Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "9",
                  "type": "promotion",
                  "amount": 4844.05,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328914-MLB2611341767",
                    "promotion_type": "custom"
                  }
                },
                {
                  "id": "10",
                  "type": "promotion",
                  "amount": 4589.1,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328914-MLB2611341767",
                    "promotion_type": "custom"
                  }
                },
                {
                  "id": "11",
                  "type": "promotion",
                  "amount": 4589.1,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328914-MLB2611341767",
                    "promotion_type": "custom"
                  }
                },
                {
                  "id": "12",
                  "type": "promotion",
                  "amount": 4589.1,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328914-MLB2611341767",
                    "promotion_type": "custom"
                  }
                },
                {
                  "id": "13",
                  "type": "promotion",
                  "amount": 4589.1,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328914-MLB2611341767",
                    "promotion_type": "custom"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "687",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4426,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-13T14:27:40Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-07T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://www.mercadolivre.com.br/samsung-galaxy-s22-snapdragon-dual-sim-128-gb-pink-gold-8-gb-ram/p/MLB18967706",
            "thumbnail":
                "http://http2.mlstatic.com/D_792091-MLA49387650805_032022-I.jpg",
            "thumbnail_id": "792091-MLA49387650805_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 442.6,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-RJ",
              "state_name": "Rio de Janeiro",
              "city_id": "BR-RJ-01",
              "city_name": "Rio de Janeiro"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["self_service_in", "mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-RJ", "name": "Rio de Janeiro"},
              "city": {"id": "BR-RJ-01", "name": "Rio de Janeiro"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "source": 1,
                "id": "BRAND",
                "name": "Marca",
                "values": [
                  {"id": "206", "name": "Samsung", "struct": null, "source": 1}
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "attribute_group_id": "OTHERS",
                "source": 1,
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_name": "SM-S901",
                "attribute_group_name": "Outros",
                "value_id": "11850081",
                "value_struct": null,
                "values": [
                  {
                    "source": 1,
                    "id": "11850081",
                    "name": "SM-S901",
                    "struct": null
                  }
                ]
              },
              {
                "name": "Condição do item",
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "values": [
                  {
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "2230284",
                    "name": "Novo"
                  }
                ]
              },
              {
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 1
                  }
                ],
                "value_name": "Galaxy S",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "name": "Modelo",
                "values": [
                  {
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "id": "MODEL",
                "value_id": "12062075",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "value_struct": null,
                "attribute_group_id": "OTHERS"
              },
              {
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 1,
                "name": "Modelo do processador",
                "value_id": "11850084",
                "attribute_group_id": "OTHERS",
                "id": "PROCESSOR_MODEL",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 1
                  }
                ]
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967706",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "catalog_listing": true,
            "use_thumbnail_id": true,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null,
            "order_backend": 3
          },
          {
            "id": "MLB2146257191",
            "site_id": "MLB",
            "title":
                "Smartphone Galaxy S22 Ultra 5g 256gb 12gb Ram Vinho Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 9498.89,
            "prices": {
              "id": "MLB2146257191",
              "prices": [
                {
                  "id": "69",
                  "type": "standard",
                  "amount": 9499,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-03T17:35:57Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "119",
                  "type": "promotion",
                  "amount": 9498.89,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "120",
                  "type": "promotion",
                  "amount": 7599,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "121",
                  "type": "promotion",
                  "amount": 7599,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "122",
                  "type": "promotion",
                  "amount": 7599,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "123",
                  "type": "promotion",
                  "amount": 7599,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "142",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 9499,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-01T04:31:17Z"
                },
                {
                  "id": "143",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 9499,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-01T04:31:17Z"
                },
                {
                  "id": "144",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-01T04:31:17Z",
                    "end_time": "2022-07-08T04:31:17Z",
                    "eligible": true
                  },
                  "amount": 7299,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-01T04:31:17Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 100,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146257191-smartphone-galaxy-s22-ultra-5g-256gb-12gb-ram-vinho-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_812377-MLB49121219627_022022-O.jpg",
            "thumbnail_id": "812377-MLB49121219627_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 949.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 8748668969142,
                    "id": "206",
                    "name": "Samsung"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung",
                "attribute_group_name": "Outros",
                "source": 8748668969142
              },
              {
                "attribute_group_name": "Outros",
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_name": "SM-S908",
                "values": [
                  {
                    "id": null,
                    "name": "SM-S908",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "value_id": null,
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321
              },
              {
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "GPU_MODEL",
                "value_name": "Adreno 730",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Modelo de GPU",
                "value_id": "11732851"
              },
              {
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_name": "Novo",
                "attribute_group_name": "Outros",
                "source": 1,
                "name": "Condição do item",
                "value_struct": null,
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "source": 3942444344910321,
                "id": "LINE",
                "value_id": "249991",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "name": "Linha",
                "value_name": "Galaxy S",
                "attribute_group_name": "Outros"
              },
              {
                "value_struct": null,
                "attribute_group_name": "Outros",
                "values": [
                  {
                    "source": 3942444344910321,
                    "id": "12063780",
                    "name": "S22 Ultra Dual SIM (Snapdragon)",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "12063780",
                "value_name": "S22 Ultra Dual SIM (Snapdragon)"
              },
              {
                "id": "PROCESSOR_MODEL",
                "values": [
                  {
                    "source": 3942444344910321,
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Modelo do processador",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null
              },
              {
                "name": "Peso",
                "value_name": "229 g",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1183438784296846,
                "id": "WEIGHT",
                "value_id": "2703024",
                "value_struct": {"number": 229, "unit": "g"},
                "values": [
                  {
                    "id": "2703024",
                    "name": "229 g",
                    "struct": {"unit": "g", "number": 229},
                    "source": 1183438784296846
                  }
                ]
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 9499,
            "category_id": "MLB1055",
            "official_store_id": 2707,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967699",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 4,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146276224",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22 5g 128 Gb 8gb Ram Branco Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 5998.89,
            "prices": {
              "id": "MLB2146276224",
              "prices": [
                {
                  "id": "3",
                  "type": "standard",
                  "amount": 5998.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-04T15:47:06Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "131",
                  "type": "promotion",
                  "amount": 5998.89,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "132",
                  "type": "promotion",
                  "amount": 4399,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "133",
                  "type": "promotion",
                  "amount": 4399,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "134",
                  "type": "promotion",
                  "amount": 4399,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "135",
                  "type": "promotion",
                  "amount": 4399,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "142",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5998.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-30T04:26:32Z"
                },
                {
                  "id": "143",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-30T04:26:32Z"
                },
                {
                  "id": "144",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-30T04:26:32Z",
                    "end_time": "2022-07-07T04:26:32Z",
                    "eligible": true
                  },
                  "amount": 4299,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-30T04:26:32Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 100,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146276224-smartphone-galaxy-s22-5g-128-gb-8gb-ram-branco-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_830173-MLB49120765988_022022-O.jpg",
            "thumbnail_id": "830173-MLB49120765988_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 599.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "source": 8748668969142,
                "attribute_group_id": "OTHERS",
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 8748668969142
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "BRAND"
              },
              {
                "value_id": null,
                "value_name": "SM-S901",
                "value_struct": null,
                "values": [
                  {
                    "name": "SM-S901",
                    "struct": null,
                    "source": 3942444344910321,
                    "id": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Modelo detalhado",
                "id": "DETAILED_MODEL"
              },
              {
                "id": "GPU_MODEL",
                "value_id": "-1",
                "value_name": null,
                "attribute_group_name": "Outros",
                "source": 3376461333454861,
                "name": "Modelo de GPU",
                "value_struct": null,
                "values": [
                  {
                    "id": "-1",
                    "name": null,
                    "struct": null,
                    "source": 3376461333454861
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Condição do item",
                "value_id": "2230284",
                "value_struct": null,
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ],
                "id": "ITEM_CONDITION",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "value_name": "Novo"
              },
              {
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_name": "Outros",
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null
              },
              {
                "source": 3942444344910321,
                "name": "Modelo",
                "value_id": "12062075",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "value_struct": null,
                "values": [
                  {
                    "source": 3942444344910321,
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)",
                    "struct": null
                  }
                ]
              },
              {
                "source": 3942444344910321,
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "value_struct": null,
                "attribute_group_name": "Outros"
              },
              {
                "values": [
                  {
                    "source": 3376461333454861,
                    "id": null,
                    "name": "168 g",
                    "struct": {"number": 168, "unit": "g"}
                  }
                ],
                "source": 3376461333454861,
                "value_name": "168 g",
                "value_struct": {"unit": "g", "number": 168},
                "value_id": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "WEIGHT",
                "name": "Peso"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 5999,
            "category_id": "MLB1055",
            "official_store_id": 2707,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "loyalty_discount_eligible",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 5,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146263339",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22+ 5g 128 Gb 8gb Ram Preto Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 6998.89,
            "prices": {
              "id": "MLB2146263339",
              "prices": [
                {
                  "id": "18",
                  "type": "standard",
                  "amount": 6998.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-04T15:42:07Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "120",
                  "type": "promotion",
                  "amount": 6998.89,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "121",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "122",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "123",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "124",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "128",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 6998.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:21Z"
                },
                {
                  "id": "129",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 6999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:21Z"
                },
                {
                  "id": "130",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-28T04:21:21Z",
                    "end_time": "2022-07-05T04:21:21Z",
                    "eligible": true
                  },
                  "amount": 4899,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:21Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 50,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146263339-smartphone-galaxy-s22-5g-128-gb-8gb-ram-preto-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_657522-MLB49121119095_022022-O.jpg",
            "thumbnail_id": "657522-MLB49121119095_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 699.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_name": "Samsung",
                "values": [
                  {
                    "source": 8748668969142,
                    "id": "206",
                    "name": "Samsung",
                    "struct": null
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 8748668969142,
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "value_struct": null,
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Modelo detalhado",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "Galaxy S22+",
                    "struct": null,
                    "source": 3376461333454861
                  }
                ],
                "source": 3376461333454861,
                "id": "DETAILED_MODEL",
                "value_name": "Galaxy S22+",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "value_id": null
              },
              {
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "id": "GPU_MODEL",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "11732851",
                    "name": "Adreno 730"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Modelo de GPU"
              },
              {
                "name": "Condição do item",
                "value_id": "2230284",
                "value_name": "Novo",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "id": "ITEM_CONDITION",
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ],
                "value_struct": null
              },
              {
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "249991",
                    "name": "Galaxy S"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "LINE",
                "value_id": "249991",
                "source": 3942444344910321,
                "name": "Linha",
                "attribute_group_name": "Outros"
              },
              {
                "value_name": "S22+",
                "value_struct": null,
                "source": 3942444344910321,
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "11850079",
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "Snapdragon 8 Gen1 Qualcomm SM8450",
                    "struct": null,
                    "source": 3376461333454861
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": null,
                "value_name": "Snapdragon 8 Gen1 Qualcomm SM8450",
                "attribute_group_id": "OTHERS",
                "source": 3376461333454861
              },
              {
                "id": "WEIGHT",
                "name": "Peso",
                "value_struct": {"number": 195, "unit": "g"},
                "values": [
                  {
                    "id": null,
                    "name": "195 g",
                    "struct": {"number": 195, "unit": "g"},
                    "source": 3376461333454861
                  }
                ],
                "value_id": null,
                "value_name": "195 g",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3376461333454861
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 6999,
            "category_id": "MLB1055",
            "official_store_id": 2707,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 6,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146305137",
            "site_id": "MLB",
            "title":
                "Smartphone Galaxy S22 Ultra 5g 256gb 12gb Ram Verde Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 9499,
            "prices": {
              "id": "MLB2146305137",
              "prices": [
                {
                  "id": "116",
                  "type": "standard",
                  "amount": 9499,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-17T02:18:39Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "138",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 9499,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-04T04:18:14Z"
                },
                {
                  "id": "139",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 9499,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-04T04:18:14Z"
                },
                {
                  "id": "140",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-04T04:18:14Z",
                    "end_time": "2022-07-11T04:18:14Z",
                    "eligible": true
                  },
                  "amount": 7299,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-04T04:18:14Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 50,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146305137-smartphone-galaxy-s22-ultra-5g-256gb-12gb-ram-verde-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_892992-MLB49120189780_022022-O.jpg",
            "thumbnail_id": "892992-MLB49120189780_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 949.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "name": "Marca",
                "values": [
                  {
                    "name": "Samsung",
                    "struct": null,
                    "source": 8748668969142,
                    "id": "206"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 8748668969142,
                "id": "BRAND",
                "value_name": "Samsung",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "value_id": "206"
              },
              {
                "id": "DETAILED_MODEL",
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "attribute_group_name": "Outros",
                "name": "Modelo detalhado",
                "value_id": null,
                "value_name": "SM-S908",
                "value_struct": null,
                "values": [
                  {
                    "source": 3942444344910321,
                    "id": null,
                    "name": "SM-S908",
                    "struct": null
                  }
                ]
              },
              {
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "attribute_group_name": "Outros",
                "value_name": "Adreno 730",
                "value_struct": null,
                "values": [
                  {
                    "source": 3942444344910321,
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321
              },
              {
                "source": 1,
                "name": "Condição do item",
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ],
                "attribute_group_id": "OTHERS",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_name": "Novo"
              },
              {
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "attribute_group_name": "Outros",
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null
              },
              {
                "name": "Modelo",
                "value_id": "12063780",
                "value_name": "S22 Ultra Dual SIM (Snapdragon)",
                "value_struct": null,
                "values": [
                  {
                    "id": "12063780",
                    "name": "S22 Ultra Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "source": 3942444344910321,
                "id": "MODEL",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "id": "PROCESSOR_MODEL",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "source": 3942444344910321,
                "name": "Modelo do processador",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "name": "Peso",
                "values": [
                  {
                    "id": "2703024",
                    "name": "229 g",
                    "struct": {"unit": "g", "number": 229},
                    "source": 1183438784296846
                  }
                ],
                "source": 1183438784296846,
                "id": "WEIGHT",
                "value_name": "229 g",
                "value_struct": {"number": 229, "unit": "g"},
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "value_id": "2703024"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": 2707,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967699",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 7,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146257197",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22 5g 256gb 8gb Ram Branco Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 6499,
            "prices": {
              "id": "MLB2146257197",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 6499,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-01-18T19:01:17Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "89",
                  "type": "promotion",
                  "amount": 6499,
                  "regular_amount": 6599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "90",
                  "type": "promotion",
                  "amount": 4699,
                  "regular_amount": 6599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "91",
                  "type": "promotion",
                  "amount": 4699,
                  "regular_amount": 6599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "92",
                  "type": "promotion",
                  "amount": 4699,
                  "regular_amount": 6599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "93",
                  "type": "promotion",
                  "amount": 4699,
                  "regular_amount": 6599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "96",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 6499,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-30T04:27:04Z"
                },
                {
                  "id": "97",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-30T04:27:04Z",
                    "end_time": "2022-07-07T04:27:04Z",
                    "eligible": true
                  },
                  "amount": 4599,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-30T04:27:04Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 50,
            "sold_quantity": 50,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146257197-smartphone-galaxy-s22-5g-256gb-8gb-ram-branco-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_631472-MLB49121015610_022022-O.jpg",
            "thumbnail_id": "631472-MLB49121015610_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 649.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "attribute_group_id": "OTHERS",
                "value_struct": null,
                "values": [
                  {
                    "name": "Samsung",
                    "struct": null,
                    "source": 8748668969142,
                    "id": "206"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 8748668969142,
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung"
              },
              {
                "id": "DETAILED_MODEL",
                "value_struct": null,
                "values": [
                  {
                    "id": "-1",
                    "name": null,
                    "struct": null,
                    "source": 3376461333454861
                  }
                ],
                "attribute_group_id": "OTHERS",
                "name": "Modelo detalhado",
                "value_id": "-1",
                "value_name": null,
                "attribute_group_name": "Outros",
                "source": 3376461333454861
              },
              {
                "name": "Modelo de GPU",
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "source": 3942444344910321,
                "id": "GPU_MODEL",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "values": [
                  {"source": 1, "id": "2230284", "name": "Novo", "struct": null}
                ],
                "attribute_group_name": "Outros",
                "source": 1,
                "value_id": "2230284",
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_id": "OTHERS"
              },
              {
                "source": 3942444344910321,
                "value_id": "249991",
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "LINE",
                "name": "Linha"
              },
              {
                "values": [
                  {
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "12062075",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "value_struct": null,
                "attribute_group_name": "Outros"
              },
              {
                "id": "PROCESSOR_MODEL",
                "value_id": "11764992",
                "attribute_group_id": "OTHERS",
                "name": "Modelo do processador",
                "value_name": "Snapdragon 8 Gen 1",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "11764992",
                    "name": "Snapdragon 8 Gen 1"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3942444344910321
              },
              {
                "value_name": "167 g",
                "value_struct": {"number": 167, "unit": "g"},
                "source": 3376461333454861,
                "value_id": "2087871",
                "name": "Peso",
                "values": [
                  {
                    "struct": {"number": 167, "unit": "g"},
                    "source": 3376461333454861,
                    "id": "2087871",
                    "name": "167 g"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "WEIGHT"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 6599,
            "category_id": "MLB1055",
            "official_store_id": 2707,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 8,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146257196",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22+ 5g 128 Gb 8gb Ram Verde Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 6998.89,
            "prices": {
              "id": "MLB2146257196",
              "prices": [
                {
                  "id": "18",
                  "type": "standard",
                  "amount": 6998.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-04T15:43:12Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "120",
                  "type": "promotion",
                  "amount": 6998.89,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "121",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "122",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "123",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "124",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "128",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 6998.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:19Z"
                },
                {
                  "id": "129",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 6999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:19Z"
                },
                {
                  "id": "130",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-28T04:21:19Z",
                    "end_time": "2022-07-05T04:21:19Z",
                    "eligible": true
                  },
                  "amount": 4899,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:19Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 50,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146257196-smartphone-galaxy-s22-5g-128-gb-8gb-ram-verde-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_848769-MLB49121232317_022022-O.jpg",
            "thumbnail_id": "848769-MLB49121232317_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 699.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 8748668969142
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "BRAND",
                "name": "Marca",
                "attribute_group_name": "Outros",
                "source": 8748668969142
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "source": 3376461333454861,
                    "id": "-1",
                    "name": null,
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 3376461333454861,
                "attribute_group_name": "Outros",
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_id": "-1",
                "value_name": null
              },
              {
                "name": "Modelo de GPU",
                "attribute_group_name": "Outros",
                "id": "GPU_MODEL",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "11732851",
                    "name": "Adreno 730"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321
              },
              {
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_id": "2230284",
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ],
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "value_struct": null,
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991"
              },
              {
                "name": "Modelo",
                "value_id": "11850079",
                "value_struct": null,
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "value_name": "S22+",
                "source": 3942444344910321
              },
              {
                "values": [
                  {
                    "id": "11732852",
                    "name": "SM8450",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Modelo do processador",
                "value_id": "11732852",
                "value_name": "SM8450",
                "id": "PROCESSOR_MODEL",
                "value_struct": null,
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Peso",
                "source": 3376461333454861,
                "value_struct": {"number": 195, "unit": "g"},
                "values": [
                  {
                    "struct": {"number": 195, "unit": "g"},
                    "source": 3376461333454861,
                    "id": null,
                    "name": "195 g"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "WEIGHT",
                "value_id": null,
                "value_name": "195 g"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 6999,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 9,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146305141",
            "site_id": "MLB",
            "title":
                "Smartphone Samsung Galaxy S22 Ultra 5g 256gb 12gb Ram Branco",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 9498.89,
            "prices": {
              "id": "MLB2146305141",
              "prices": [
                {
                  "id": "3",
                  "type": "standard",
                  "amount": 9498.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-04T15:38:49Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "84",
                  "type": "promotion",
                  "amount": 9498.89,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:50Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "85",
                  "type": "promotion",
                  "amount": 7599,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:50Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "86",
                  "type": "promotion",
                  "amount": 7599,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:50Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "87",
                  "type": "promotion",
                  "amount": 7599,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:50Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "88",
                  "type": "promotion",
                  "amount": 7599,
                  "regular_amount": 9599,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:50Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "107",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 9499,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-01T04:31:55Z"
                },
                {
                  "id": "108",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 9498.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-01T04:31:55Z"
                },
                {
                  "id": "109",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-01T04:31:55Z",
                    "end_time": "2022-07-08T04:31:55Z",
                    "eligible": true
                  },
                  "amount": 7299,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-01T04:31:55Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 50,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146305141-smartphone-samsung-galaxy-s22-ultra-5g-256gb-12gb-ram-branco-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_995903-MLB49120074687_022022-O.jpg",
            "thumbnail_id": "995903-MLB49120074687_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 949.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 8748668969142
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "value_struct": null,
                "value_name": "Samsung",
                "attribute_group_id": "OTHERS",
                "source": 8748668969142
              },
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "DETAILED_MODEL",
                "value_id": null,
                "value_name": "SM-S908",
                "name": "Modelo detalhado",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": null,
                    "name": "SM-S908"
                  }
                ]
              },
              {
                "name": "Modelo de GPU",
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "source": 4709228965570453,
                "id": "GPU_MODEL",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "source": 1,
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_name": "Novo",
                "value_struct": null,
                "values": [
                  {"name": "Novo", "struct": null, "source": 1, "id": "2230284"}
                ],
                "value_id": "2230284",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "id": "LINE",
                "name": "Linha",
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "value_id": "249991",
                "attribute_group_name": "Outros",
                "source": 3942444344910321
              },
              {
                "name": "Modelo",
                "value_id": null,
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "S22 Ultra",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "MODEL",
                "attribute_group_id": "OTHERS",
                "value_name": "S22 Ultra"
              },
              {
                "value_id": "11850084",
                "value_struct": null,
                "name": "Modelo do processador",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "11850084"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "PROCESSOR_MODEL"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 9499,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967699",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 10,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146301388",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22 5g 128 Gb 8gb Ram Branco Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 6998.89,
            "prices": {
              "id": "MLB2146301388",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 6999,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-01-18T19:01:15Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "96",
                  "type": "promotion",
                  "amount": 6998.89,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "97",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "98",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "99",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "100",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "103",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 6999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:27Z"
                },
                {
                  "id": "104",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-28T04:21:27Z",
                    "end_time": "2022-07-05T04:21:27Z",
                    "eligible": true
                  },
                  "amount": 4899,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:27Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 50,
            "sold_quantity": 25,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146301388-smartphone-galaxy-s22-5g-128-gb-8gb-ram-branco-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_798666-MLB49120481099_022022-O.jpg",
            "thumbnail_id": "798666-MLB49120481099_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 699.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 8748668969142
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 8748668969142
              },
              {
                "id": "DETAILED_MODEL",
                "value_id": null,
                "attribute_group_name": "Outros",
                "source": 3376461333454861,
                "attribute_group_id": "OTHERS",
                "name": "Modelo detalhado",
                "value_name": "Galaxy S22+",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "Galaxy S22+",
                    "struct": null,
                    "source": 3376461333454861
                  }
                ]
              },
              {
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "GPU_MODEL",
                "value_struct": null,
                "value_name": "Adreno 730",
                "values": [
                  {
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "11732851"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "name": "Modelo de GPU",
                "value_id": "11732851"
              },
              {
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ],
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "value_id": "2230284",
                "value_name": "Novo"
              },
              {
                "value_name": "Galaxy S",
                "attribute_group_name": "Outros",
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "source": 3942444344910321,
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "11850079",
                "value_name": "S22+",
                "source": 3942444344910321
              },
              {
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": "11732852",
                "value_name": "SM8450",
                "values": [
                  {
                    "id": "11732852",
                    "name": "SM8450",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "value_name": "195 g",
                "values": [
                  {
                    "id": null,
                    "name": "195 g",
                    "struct": {"unit": "g", "number": 195},
                    "source": 3376461333454861
                  }
                ],
                "id": "WEIGHT",
                "name": "Peso",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3376461333454861,
                "value_id": null,
                "value_struct": {"number": 195, "unit": "g"}
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 6999,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "loyalty_discount_eligible",
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 11,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146294764",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22+ 5g 128gb 8gb Ram Rosé Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 6998.89,
            "prices": {
              "id": "MLB2146294764",
              "prices": [
                {
                  "id": "3",
                  "type": "standard",
                  "amount": 6998.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-04T15:42:44Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "66",
                  "type": "promotion",
                  "amount": 6998.89,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "67",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "68",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "69",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "70",
                  "type": "promotion",
                  "amount": 4999,
                  "regular_amount": 6999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "74",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 6999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:06Z"
                },
                {
                  "id": "75",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 6998.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:06Z"
                },
                {
                  "id": "76",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-28T04:21:06Z",
                    "end_time": "2022-07-05T04:21:06Z",
                    "eligible": true
                  },
                  "amount": 4899,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:21:06Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 50,
            "sold_quantity": 25,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146294764-smartphone-galaxy-s22-5g-128gb-8gb-ram-rose-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_715128-MLB49120519311_022022-O.jpg",
            "thumbnail_id": "715128-MLB49120519311_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 699.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 8748668969142,
                "value_name": "Samsung",
                "name": "Marca",
                "value_id": "206",
                "values": [
                  {
                    "struct": null,
                    "source": 8748668969142,
                    "id": "206",
                    "name": "Samsung"
                  }
                ],
                "id": "BRAND"
              },
              {
                "source": 3376461333454861,
                "name": "Modelo detalhado",
                "value_id": null,
                "value_name": "SM-S906E",
                "value_struct": null,
                "values": [
                  {
                    "source": 3376461333454861,
                    "id": null,
                    "name": "SM-S906E",
                    "struct": null
                  }
                ],
                "id": "DETAILED_MODEL",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_name": null,
                "values": [
                  {
                    "id": "-1",
                    "name": null,
                    "struct": null,
                    "source": 3376461333454861
                  }
                ],
                "attribute_group_id": "OTHERS",
                "value_id": "-1",
                "name": "Modelo de GPU",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 3376461333454861,
                "id": "GPU_MODEL"
              },
              {
                "value_struct": null,
                "values": [
                  {"struct": null, "source": 1, "id": "2230284", "name": "Novo"}
                ],
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_name": "Novo",
                "source": 1,
                "value_id": "2230284",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "value_struct": null,
                "source": 3942444344910321,
                "values": [
                  {
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "249991"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_id": null,
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "id": "MODEL",
                "name": "Modelo",
                "value_name": "S22+",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "S22+",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_name": "Outros"
              },
              {
                "name": "Modelo do processador",
                "value_id": "11850084",
                "attribute_group_id": "OTHERS",
                "values": [
                  {
                    "source": 3376461333454861,
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3376461333454861,
                "id": "PROCESSOR_MODEL",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null
              },
              {
                "value_id": null,
                "value_name": "195 g",
                "values": [
                  {
                    "id": null,
                    "name": "195 g",
                    "struct": {"unit": "g", "number": 195},
                    "source": 3376461333454861
                  }
                ],
                "source": 3376461333454861,
                "attribute_group_name": "Outros",
                "id": "WEIGHT",
                "name": "Peso",
                "value_struct": {"number": 195, "unit": "g"},
                "attribute_group_id": "OTHERS"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 6999,
            "category_id": "MLB1055",
            "official_store_id": 2707,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": null,
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 12,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146276226",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22+ 5g 256 Gb 8gb Ram Branco Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 7498.89,
            "prices": {
              "id": "MLB2146276226",
              "prices": [
                {
                  "id": "3",
                  "type": "standard",
                  "amount": 7498.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-04T15:41:20Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "14",
                  "type": "promotion",
                  "amount": 7498.89,
                  "regular_amount": 7499,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "15",
                  "type": "promotion",
                  "amount": 5399,
                  "regular_amount": 7499,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "16",
                  "type": "promotion",
                  "amount": 5399,
                  "regular_amount": 7499,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "17",
                  "type": "promotion",
                  "amount": 5399,
                  "regular_amount": 7499,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "18",
                  "type": "promotion",
                  "amount": 5399,
                  "regular_amount": 7499,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "25",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 7499,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-29T04:34:13Z"
                },
                {
                  "id": "26",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 7498.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-29T04:34:13Z"
                },
                {
                  "id": "27",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-29T04:34:13Z",
                    "end_time": "2022-07-06T04:34:13Z",
                    "eligible": true
                  },
                  "amount": 5299,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-29T04:34:13Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 25,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146276226-smartphone-galaxy-s22-5g-256-gb-8gb-ram-branco-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_669341-MLB49120938024_022022-O.jpg",
            "thumbnail_id": "669341-MLB49120938024_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 749.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_id": "206",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "name": "Marca",
                "value_name": "Samsung",
                "values": [
                  {
                    "struct": null,
                    "source": 8748668969142,
                    "id": "206",
                    "name": "Samsung"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 8748668969142
              },
              {
                "value_id": null,
                "value_struct": null,
                "values": [
                  {
                    "source": 3942444344910321,
                    "id": null,
                    "name": "SM-S906",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_name": "SM-S906",
                "attribute_group_name": "Outros"
              },
              {
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "values": [
                  {"source": 1, "id": "2230284", "name": "Novo", "struct": null}
                ],
                "value_id": "2230284",
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "values": [
                  {
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "249991"
                  }
                ],
                "id": "LINE",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Linha"
              },
              {
                "name": "Modelo",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "MODEL",
                "value_id": "11850079",
                "value_name": "S22+",
                "value_struct": null,
                "values": [
                  {
                    "source": 3942444344910321,
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null
                  }
                ]
              },
              {
                "source": 3942444344910321,
                "name": "Modelo do processador",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)"
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "PROCESSOR_MODEL",
                "value_struct": null,
                "attribute_group_id": "OTHERS"
              },
              {
                "id": "WEIGHT",
                "name": "Peso",
                "value_id": "1095137",
                "value_struct": {"number": 195, "unit": "g"},
                "attribute_group_id": "OTHERS",
                "value_name": "195 g",
                "values": [
                  {
                    "name": "195 g",
                    "struct": {"number": 195, "unit": "g"},
                    "source": 1183438784296846,
                    "id": "1095137"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 1183438784296846
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 7499,
            "category_id": "MLB1055",
            "official_store_id": 2707,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "good_quality_picture",
              "good_quality_thumbnail",
              "extended_warranty_eligible",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 13,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146294765",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22 5g 128 Gb 8gb Ram Rose Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 5998.89,
            "prices": {
              "id": "MLB2146294765",
              "prices": [
                {
                  "id": "3",
                  "type": "standard",
                  "amount": 5998.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-04T15:48:03Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "102",
                  "type": "promotion",
                  "amount": 5998.89,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "103",
                  "type": "promotion",
                  "amount": 4399,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "104",
                  "type": "promotion",
                  "amount": 4399,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "105",
                  "type": "promotion",
                  "amount": 4399,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                },
                {
                  "id": "106",
                  "type": "promotion",
                  "amount": 4399,
                  "regular_amount": 5999,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-14T13:55:49Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2020-03-16T02:30:00Z",
                    "end_time": "2030-08-08T06:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB2321",
                    "promotion_id": "MLB2321",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "113",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-29T04:35:55Z"
                },
                {
                  "id": "114",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5998.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-29T04:35:55Z"
                },
                {
                  "id": "115",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-29T04:35:55Z",
                    "end_time": "2022-07-06T04:35:55Z",
                    "eligible": true
                  },
                  "amount": 4299,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-29T04:35:55Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 50,
            "sold_quantity": 5,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146294765-smartphone-galaxy-s22-5g-128-gb-8gb-ram-rose-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_718763-MLB49120437425_022022-O.jpg",
            "thumbnail_id": "718763-MLB49120437425_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 599.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung",
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 8748668969142
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 8748668969142
              },
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_id": null,
                "value_name": "SM-S901",
                "values": [
                  {
                    "id": null,
                    "name": "SM-S901",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "value_struct": null
              },
              {
                "id": "GPU_MODEL",
                "value_struct": null,
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "attribute_group_name": "Outros",
                "source": 4709228965570453
              },
              {
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "name": "Condição do item",
                "value_name": "Novo",
                "value_struct": null,
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ]
              },
              {
                "value_id": "249991",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "id": "LINE",
                "value_name": "Galaxy S",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Linha"
              },
              {
                "id": "MODEL",
                "name": "Modelo",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "S22",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "value_id": null,
                "value_name": "S22",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321
              },
              {
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": "11850084",
                "value_struct": null,
                "source": 3942444344910321,
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_id": "6793640",
                "value_name": "168 g",
                "value_struct": {"number": 168, "unit": "g"},
                "values": [
                  {
                    "id": "6793640",
                    "name": "168 g",
                    "struct": {"number": 168, "unit": "g"},
                    "source": 1183438784296846
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "WEIGHT",
                "name": "Peso",
                "source": 1183438784296846
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 5999,
            "category_id": "MLB1055",
            "official_store_id": 2707,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 14,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2610073480",
            "site_id": "MLB",
            "title": "Celular Samsung Galaxy S22 256 Gb Branco 6.1 5g",
            "seller": {
              "id": 155425567,
              "permalink":
                  "http://perfil.mercadolivre.com.br/ZOO+VAREJO+DIGITAL",
              "registration_date": "2014-03-13T07:41:49.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "brand",
                "large_seller",
                "developer",
                "credits_profile",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.0058,
                    "value": 16
                  },
                  "claims": {"period": "60 days", "rate": 0.0189, "value": 52},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0741,
                    "value": 121
                  },
                  "sales": {"period": "60 days", "completed": 2535}
                },
                "transactions": {
                  "canceled": 4240,
                  "period": "historic",
                  "total": 40358,
                  "ratings": {
                    "negative": 0.06,
                    "neutral": 0.07,
                    "positive": 0.87
                  },
                  "completed": 36118
                }
              }
            },
            "price": 6498.89,
            "prices": {
              "id": "MLB2610073480",
              "prices": [
                {
                  "id": "68",
                  "type": "standard",
                  "amount": 6498.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-12T18:06:13Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [
                {
                  "id": "c1744d28-4993-462f-9b48-6cbae731a0d7",
                  "conditions": {
                    "allowed_methods": [
                      {
                        "id": "pix",
                        "issuer_id": null,
                        "payment_type_id": "bank_transfer",
                        "installments": null
                      }
                    ],
                    "start_time": "2022-07-12T03:00:00Z",
                    "end_time": "2022-07-15T02:00:00Z",
                    "restricted_to_prices": []
                  },
                  "value": 5,
                  "type": "percentage",
                  "currency_id": null,
                  "metadata": {
                    "purchase_discount_id": "MLB1044001",
                    "purchase_discount_type": "BD",
                    "purchase_discount_campaign_id": "P-MLB6679004",
                    "purchase_discount_rebate_id":
                        "OFFER-MLB2610073480-300753632"
                  },
                  "exchange_rate_context": "DEFAULT"
                }
              ],
              "reference_prices": [
                {
                  "id": "47",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5429,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:36:09Z"
                },
                {
                  "id": "48",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-28T04:36:09Z",
                    "end_time": "2022-07-05T04:36:09Z",
                    "eligible": true
                  },
                  "amount": 6498.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:36:09Z"
                }
              ],
              "purchase_discounts": [
                {
                  "purchase_discount_id": "MLB1044001",
                  "campaign_id": "P-MLB6679004",
                  "rebate_id": "OFFER-MLB2610073480-300753632",
                  "type": "BD",
                  "discount_percentage": 0.05,
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-12T03:00:00Z",
                    "end_time": "2022-07-15T02:00:00Z",
                    "eligible": true
                  },
                  "purchase_min_amount": 1499,
                  "max_discount_amount": 10000,
                  "max_benefit_count": 1,
                  "funding_mode": "coupon"
                }
              ]
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 1,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-06T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2610073480-celular-samsung-galaxy-s22-256-gb-branco-61-5g-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_782654-MLB49633977327_042022-O.jpg",
            "thumbnail_id": "782654-MLB49633977327_042022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 649.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-ES",
              "state_name": "Espírito Santo",
              "city_id": "TUxCQ1NFUmI1ZGQx",
              "city_name": "Serra"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping", "optional_me2_chosen"],
              "logistic_type": "cross_docking",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-ES", "name": "Espírito Santo"},
              "city": {"id": "TUxCQ1NFUmI1ZGQx", "name": "Serra"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_name": "Samsung",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "name": "Marca",
                "source": 6640288194394508,
                "value_id": "206",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6640288194394508
                  }
                ]
              },
              {
                "source": 1,
                "value_id": "2230284",
                "value_name": "Novo",
                "attribute_group_id": "OTHERS",
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ],
                "attribute_group_name": "Outros",
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_struct": null
              },
              {
                "id": "LINE",
                "value_id": "249991",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "249991",
                    "name": "Galaxy S"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Linha",
                "value_name": "Galaxy S",
                "attribute_group_id": "OTHERS"
              },
              {
                "id": "MODEL",
                "name": "Modelo",
                "value_id": null,
                "values": [
                  {
                    "id": null,
                    "name": "S22",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_name": "Outros",
                "value_name": "S22",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": 232,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": null,
            "tags": [
              "good_quality_thumbnail",
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 15,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2621319899",
            "site_id": "MLB",
            "title":
                "Smartphone Samsung Galaxy S22 Ultra 5g 256gb Branco 12gb Ram",
            "seller": {
              "id": 167787623,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MEGABYTE+MAGAZINE",
              "registration_date": "2014-09-29T16:21:54.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "eshop",
                "mshops",
                "credits_profile",
                "messages_as_seller"
              ],
              "eshop": {
                "seller": 167787623,
                "eshop_rubro": null,
                "eshop_id": 274323,
                "nick_name": "MEGA_BYTE_MAGAZINE",
                "site_id": "MLB",
                "eshop_logo_url":
                    "http://http2.mlstatic.com/eshops-logo/167787623v9b5ff8.png",
                "eshop_status_id": 2,
                "eshop_experience": 0,
                "eshop_locations": []
              },
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.0021,
                    "value": 18
                  },
                  "claims": {"period": "60 days", "rate": 0.0105, "value": 90},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0036,
                    "value": 30
                  },
                  "sales": {"period": "60 days", "completed": 7962}
                },
                "transactions": {
                  "canceled": 3236,
                  "period": "historic",
                  "total": 38497,
                  "ratings": {
                    "negative": 0.1,
                    "neutral": 0.01,
                    "positive": 0.89
                  },
                  "completed": 35261
                }
              }
            },
            "price": 7847.9,
            "prices": {
              "id": "MLB2621319899",
              "prices": [
                {
                  "id": "7",
                  "type": "standard",
                  "amount": 7847.9,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-04T13:54:26Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "8",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-01T04:59:39Z",
                    "end_time": "2022-07-08T04:59:39Z",
                    "eligible": true
                  },
                  "amount": 7875.9,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-04T13:57:29Z"
                },
                {
                  "id": "9",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 7847.9,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-04T13:57:29Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 1,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-18T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2621319899-smartphone-samsung-galaxy-s22-ultra-5g-256gb-branco-12gb-ram-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_872826-MLB49747340188_042022-O.jpg",
            "thumbnail_id": "872826-MLB49747340188_042022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 784.79,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BMZW7Dp8OzaXMgUGF1bGlzdGE",
              "city_name": "Lençóis Paulista"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "cross_docking",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {
                "id": "QlItU1BMZW7Dp8OzaXMgUGF1bGlzdGE",
                "name": "Lençóis Paulista"
              },
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "source": 923230526977079,
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 923230526977079
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "value_name": "Adreno 730",
                "value_struct": null,
                "value_id": "11732851",
                "values": [
                  {
                    "source": 4709228965570453,
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453
              },
              {
                "id": "ITEM_CONDITION",
                "value_name": "Novo",
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ],
                "source": 1,
                "name": "Condição do item",
                "value_id": "2230284",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3942444344910321
              },
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "value_id": null,
                "name": "Modelo",
                "value_name": "S22 Ultra",
                "value_struct": null,
                "values": [
                  {
                    "source": 3942444344910321,
                    "id": null,
                    "name": "S22 Ultra",
                    "struct": null
                  }
                ],
                "id": "MODEL"
              },
              {
                "name": "Modelo do processador",
                "value_struct": null,
                "values": [
                  {
                    "name": "Snapdragon 8 Gen 1",
                    "struct": null,
                    "source": 4709228965570453,
                    "id": "11764992"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 4709228965570453,
                "id": "PROCESSOR_MODEL",
                "value_id": "11764992",
                "value_name": "Snapdragon 8 Gen 1",
                "attribute_group_name": "Outros"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967699",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 16,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2146282416",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22+ 5g 256gb 8gb Ram Rosé Samsung",
            "seller": {
              "id": 480263032,
              "permalink":
                  "http://perfil.mercadolivre.com.br/MERCADOLIVRE+ELETRONICOS",
              "registration_date": "2019-10-15T18:13:19.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 4233
                  },
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 434765}
                },
                "transactions": {
                  "canceled": 234056,
                  "period": "historic",
                  "total": 3430303,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.01,
                    "positive": 0.95
                  },
                  "completed": 3196247
                }
              }
            },
            "price": 7498.89,
            "prices": {
              "id": "MLB2146282416",
              "prices": [
                {
                  "id": "3",
                  "type": "standard",
                  "amount": 7498.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-04T15:40:05Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "4",
                  "type": "list",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 7499,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-04-04T15:40:07Z"
                },
                {
                  "id": "5",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 7498.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-04-04T15:40:07Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-01-13T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2146282416-smartphone-galaxy-s22-5g-256gb-8gb-ram-rose-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_714359-MLB49120689113_022022-O.jpg",
            "thumbnail_id": "714359-MLB49120689113_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 749.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["fulfillment", "mandatory_free_shipping"],
              "logistic_type": "fulfillment",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_id": "206",
                "attribute_group_id": "OTHERS",
                "value_struct": null,
                "values": [
                  {
                    "name": "Samsung",
                    "struct": null,
                    "source": 8748668969142,
                    "id": "206"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 8748668969142,
                "id": "BRAND",
                "name": "Marca",
                "value_name": "Samsung"
              },
              {
                "name": "Modelo detalhado",
                "value_id": null,
                "value_name": "SM-S906",
                "values": [
                  {
                    "id": null,
                    "name": "SM-S906",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "DETAILED_MODEL",
                "value_struct": null,
                "source": 3942444344910321
              },
              {
                "source": 1,
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "name": "Condição do item",
                "values": [
                  {"id": "2230284", "name": "Novo", "struct": null, "source": 1}
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "value_id": "249991",
                "value_name": "Galaxy S",
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "249991",
                    "name": "Galaxy S"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "LINE",
                "name": "Linha",
                "value_struct": null
              },
              {
                "id": "MODEL",
                "value_id": "11850079",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Modelo",
                "value_name": "S22+",
                "value_struct": null,
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "source": 3942444344910321
              },
              {
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "id": "PROCESSOR_MODEL",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "name": "Modelo do processador",
                "value_id": "11850084",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ]
              },
              {
                "value_id": "1095137",
                "value_name": "195 g",
                "values": [
                  {
                    "source": 1183438784296846,
                    "id": "1095137",
                    "name": "195 g",
                    "struct": {"number": 195, "unit": "g"}
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "WEIGHT",
                "value_struct": {"number": 195, "unit": "g"},
                "attribute_group_name": "Outros",
                "source": 1183438784296846,
                "name": "Peso"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 7499,
            "category_id": "MLB1055",
            "official_store_id": 2707,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 17,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2626081738",
            "site_id": "MLB",
            "title": "Celular Samsung Galaxy S22 Dual Sim 128 Gb 8 Gb Ram 5g",
            "seller": {
              "id": 290494113,
              "permalink": "http://perfil.mercadolivre.com.br/7OUT",
              "registration_date": "2017-12-14T12:35:12.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "eshop", "mshops", "messages_as_seller"],
              "eshop": {
                "seller": 290494113,
                "eshop_rubro": null,
                "eshop_id": 372649,
                "nick_name": "7OUT",
                "site_id": "MLB",
                "eshop_logo_url":
                    "http://http2.mlstatic.com/eshops-logo/290494113v03d680.png",
                "eshop_status_id": 1,
                "eshop_experience": 0,
                "eshop_locations": []
              },
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.017,
                    "value": 18
                  },
                  "claims": {"period": "60 days", "rate": 0.0103, "value": 11},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0274,
                    "value": 26
                  },
                  "sales": {"period": "60 days", "completed": 884}
                },
                "transactions": {
                  "canceled": 726,
                  "period": "historic",
                  "total": 3940,
                  "ratings": {
                    "negative": 0.05,
                    "neutral": 0.02,
                    "positive": 0.93
                  },
                  "completed": 3214
                }
              }
            },
            "price": 5091.45,
            "prices": {
              "id": "MLB2626081738",
              "prices": [
                {
                  "id": "12",
                  "type": "standard",
                  "amount": 5091.45,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-11T13:05:42Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "10",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4849,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-06T04:55:56Z"
                },
                {
                  "id": "11",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-06T04:55:56Z",
                    "end_time": "2022-06-13T04:55:56Z",
                    "eligible": true
                  },
                  "amount": 4999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-06T04:55:56Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 1,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-23T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2626081738-celular-samsung-galaxy-s22-dual-sim-128-gb-8-gb-ram-5g-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_607199-MLA49387650897_032022-O.jpg",
            "thumbnail_id": "607199-MLA49387650897_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 509.15,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-39",
              "city_name": "São Bernardo do Campo"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "xd_drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-39", "name": "São Bernardo do Campo"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "value_id": "206",
                "value_name": "Samsung",
                "source": 6808261514773724,
                "name": "Marca",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ]
              },
              {
                "value_name": "SM-S901",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "SM-S901",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "source": 7567447101417086,
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_id": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "id": "GPU_MODEL",
                "value_name": "Adreno 730",
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "value_struct": null
              },
              {
                "value_struct": null,
                "source": 6808261514773724,
                "name": "Condição do item",
                "value_name": "Novo",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "ITEM_CONDITION",
                "value_id": "2230284"
              },
              {
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "249991",
                    "name": "Galaxy S"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "attribute_group_name": "Outros",
                "source": 6808261514773724
              },
              {
                "id": "MODEL",
                "value_id": "12062075",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)"
                  }
                ],
                "name": "Modelo",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6808261514773724
              },
              {
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "name": "Modelo do processador",
                "value_id": "11850084",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "id": "PROCESSOR_MODEL"
              },
              {
                "name": "Peso",
                "value_name": "167 g",
                "value_struct": {"number": 167, "unit": "g"},
                "source": 1183438784296846,
                "id": "WEIGHT",
                "value_id": "2087871",
                "values": [
                  {
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 1183438784296846,
                    "id": "2087871"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 18,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2714653759",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 (exynos) Dual Sim 128 Gb Phantom Black 8 Gb Ram",
            "seller": {
              "id": 186975609,
              "permalink": "http://perfil.mercadolivre.com.br/SAMIRAPASINI",
              "registration_date": "2016-05-03T23:28:20.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "credits_profile", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 1},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0.0461,
                    "value": 3
                  },
                  "sales": {"period": "365 days", "completed": 63}
                },
                "transactions": {
                  "canceled": 8,
                  "period": "historic",
                  "total": 71,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 63
                }
              }
            },
            "price": 4547,
            "prices": {
              "id": "MLB2714653759",
              "prices": [
                {
                  "id": "2",
                  "type": "standard",
                  "amount": 4547,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-12T17:38:08Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "3",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4547,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-12T17:40:50Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-07-07T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://www.mercadolivre.com.br/samsung-galaxy-s22-exynos-dual-sim-128-gb-phantom-black-8-gb-ram/p/MLB18956062",
            "thumbnail":
                "http://http2.mlstatic.com/D_637850-MLA50287846891_062022-I.jpg",
            "thumbnail_id": "637850-MLA50287846891_062022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 454.7,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-MG",
              "state_name": "Minas Gerais",
              "city_id": "TUxCQ0JFTGU0ODdm",
              "city_name": "Belo Horizonte"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-MG", "name": "Minas Gerais"},
              "city": {"id": "TUxCQ0JFTGU0ODdm", "name": "Belo Horizonte"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "values": [
                  {"id": "206", "name": "Samsung", "struct": null, "source": 1}
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "value_id": "206",
                "value_struct": null,
                "source": 1,
                "name": "Marca",
                "value_name": "Samsung"
              },
              {
                "value_id": "11732915",
                "value_name": "Xclipse 920",
                "value_struct": null,
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "values": [
                  {
                    "id": "11732915",
                    "name": "Xclipse 920",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 1505
                  }
                ],
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1505,
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_id": "2230284",
                "value_name": "Novo"
              },
              {
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "attribute_group_name": "Outros",
                "source": 1,
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "source": 1,
                    "id": "12062631",
                    "name": "S22 Dual SIM (Exynos)",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "12062631",
                "value_name": "S22 Dual SIM (Exynos)",
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "value_id": "11732916",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 1,
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_name": "Exynos 2200",
                "values": [
                  {
                    "struct": null,
                    "source": 1,
                    "id": "11732916",
                    "name": "Exynos 2200"
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Peso",
                "value_name": "167 g",
                "attribute_group_id": "OTHERS",
                "id": "WEIGHT",
                "value_id": "2087871",
                "value_struct": {"number": 167, "unit": "g"},
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 1
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 1
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18956062",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "catalog_listing": true,
            "use_thumbnail_id": true,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null,
            "order_backend": 19
          },
          {
            "id": "MLB2701750884",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 (exynos) Dual Sim 256 Gb Phantom Black 8 Gb Ram",
            "seller": {
              "id": 42776670,
              "permalink": "http://perfil.mercadolivre.com.br/PHONE_CEL2009",
              "registration_date": "2007-12-13T13:33:25.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "gold",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.0083,
                    "value": 3
                  },
                  "claims": {"period": "60 days", "rate": 0.0111, "value": 4},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0091,
                    "value": 3
                  },
                  "sales": {"period": "60 days", "completed": 308}
                },
                "transactions": {
                  "canceled": 330,
                  "period": "historic",
                  "total": 2385,
                  "ratings": {
                    "negative": 0.06,
                    "neutral": 0.03,
                    "positive": 0.91
                  },
                  "completed": 2055
                }
              }
            },
            "price": 5599,
            "prices": {
              "id": "MLB2701750884",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 5599,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-01T20:04:49Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-26T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://www.mercadolivre.com.br/samsung-galaxy-s22-exynos-dual-sim-256-gb-phantom-black-8-gb-ram/p/MLB18956082",
            "thumbnail":
                "http://http2.mlstatic.com/D_637850-MLA50287846891_062022-I.jpg",
            "thumbnail_id": "637850-MLA50287846891_062022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 559.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-PR",
              "state_name": "Paraná",
              "city_id": "TUxCQ0xPTmI2Njg1",
              "city_name": "Londrina"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "xd_drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-PR", "name": "Paraná"},
              "city": {"id": "TUxCQ0xPTmI2Njg1", "name": "Londrina"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "attribute_group_name": "Outros",
                "source": 1,
                "name": "Marca",
                "value_struct": null,
                "value_name": "Samsung",
                "values": [
                  {"id": "206", "name": "Samsung", "struct": null, "source": 1}
                ],
                "attribute_group_id": "OTHERS",
                "id": "BRAND",
                "value_id": "206"
              },
              {
                "attribute_group_id": "OTHERS",
                "source": 1,
                "name": "Modelo de GPU",
                "value_id": "11732915",
                "value_name": "Xclipse 920",
                "values": [
                  {
                    "id": "11732915",
                    "name": "Xclipse 920",
                    "struct": null,
                    "source": 1
                  }
                ],
                "id": "GPU_MODEL",
                "value_struct": null,
                "attribute_group_name": "Outros"
              },
              {
                "attribute_group_name": "Outros",
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_name": "Novo",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "value_id": "2230284",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 6808261514773724
              },
              {
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 1,
                "id": "LINE",
                "value_name": "Galaxy S",
                "values": [
                  {
                    "struct": null,
                    "source": 1,
                    "id": "249991",
                    "name": "Galaxy S"
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "source": 1,
                "name": "Modelo",
                "value_struct": null,
                "value_name": "S22 Dual SIM (Exynos)",
                "values": [
                  {
                    "id": "12062631",
                    "name": "S22 Dual SIM (Exynos)",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "value_id": "12062631"
              },
              {
                "value_id": "11732916",
                "value_struct": null,
                "source": 1,
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_name": "Exynos 2200",
                "values": [
                  {
                    "source": 1,
                    "id": "11732916",
                    "name": "Exynos 2200",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_name": "167 g",
                "value_struct": {"number": 167, "unit": "g"},
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 1
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "id": "WEIGHT",
                "name": "Peso",
                "value_id": "2087871"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18956082",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "catalog_listing": true,
            "use_thumbnail_id": true,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null,
            "order_backend": 20
          },
          {
            "id": "MLB2632124366",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 Ultra (snapdragon) Dual Sim 256 Gb Green ",
            "seller": {
              "id": 78474842,
              "permalink": "http://perfil.mercadolivre.com.br/PHONE_CENTER",
              "registration_date": "2005-02-01T06:37:17.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "mshops",
                "credits_profile",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": "gold",
                "real_level": "yellow",
                "level_id": "5_green",
                "protection_end_date": "2022-07-19T00:00:00.000-04:00",
                "metrics": {
                  "cancellations": {
                    "excluded": {"real_value": 1, "real_rate": 0},
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {
                    "excluded": {"real_value": 0, "real_rate": 0},
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "delayed_handling_time": {
                    "excluded": {"real_value": 34, "real_rate": 0.1511},
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 218}
                },
                "transactions": {
                  "canceled": 83,
                  "period": "historic",
                  "total": 864,
                  "ratings": {
                    "negative": 0.01,
                    "neutral": 0.01,
                    "positive": 0.98
                  },
                  "completed": 781
                }
              }
            },
            "price": 9399,
            "prices": {
              "id": "MLB2632124366",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 9399,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-04T20:26:56Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 1,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-29T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2632124366-samsung-galaxy-s22-ultra-snapdragon-dual-sim-256-gb-green-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_668050-MLA49303776893_032022-O.jpg",
            "thumbnail_id": "668050-MLA49303776893_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 939.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-58",
              "city_name": "Sumaré"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "xd_drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-58", "name": "Sumaré"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_name": "Samsung",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 7092,
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "attribute_group_name": "Outros"
              },
              {
                "value_id": null,
                "value_name": "SM-S908",
                "attribute_group_id": "OTHERS",
                "source": 7092,
                "name": "Modelo detalhado",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "SM-S908",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "DETAILED_MODEL"
              },
              {
                "value_id": "11732851",
                "value_struct": null,
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "source": 4709228965570453,
                "name": "Modelo de GPU",
                "value_name": "Adreno 730",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "GPU_MODEL"
              },
              {
                "value_name": "Novo",
                "values": [
                  {
                    "source": 7092,
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null
                  }
                ],
                "source": 7092,
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_id": "2230284",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "LINE",
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "source": 7092,
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null
              },
              {
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "12063780",
                "value_name": "S22 Ultra Dual SIM (Snapdragon)",
                "value_struct": null,
                "values": [
                  {
                    "id": "12063780",
                    "name": "S22 Ultra Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7092
              },
              {
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "attribute_group_name": "Outros",
                "name": "Modelo do processador",
                "value_id": "11850084",
                "attribute_group_id": "OTHERS",
                "source": 7092,
                "id": "PROCESSOR_MODEL",
                "value_struct": null
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967699",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 21,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2632933929",
            "site_id": "MLB",
            "title": "Celular Samsung Galaxy S22 128 Gb Rose 6.1 5g",
            "seller": {
              "id": 155425567,
              "permalink":
                  "http://perfil.mercadolivre.com.br/ZOO+VAREJO+DIGITAL",
              "registration_date": "2014-03-13T07:41:49.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "brand",
                "large_seller",
                "developer",
                "credits_profile",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.0058,
                    "value": 16
                  },
                  "claims": {"period": "60 days", "rate": 0.0189, "value": 52},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0741,
                    "value": 121
                  },
                  "sales": {"period": "60 days", "completed": 2535}
                },
                "transactions": {
                  "canceled": 4240,
                  "period": "historic",
                  "total": 40358,
                  "ratings": {
                    "negative": 0.06,
                    "neutral": 0.07,
                    "positive": 0.87
                  },
                  "completed": 36118
                }
              }
            },
            "price": 5998.89,
            "prices": {
              "id": "MLB2632933929",
              "prices": [
                {
                  "id": "53",
                  "type": "standard",
                  "amount": 5998.89,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-12T18:06:18Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [
                {
                  "id": "21f101a6-1db2-47be-b664-aa61df6d7740",
                  "conditions": {
                    "allowed_methods": [
                      {
                        "id": "pix",
                        "issuer_id": null,
                        "payment_type_id": "bank_transfer",
                        "installments": null
                      }
                    ],
                    "start_time": "2022-07-12T03:00:00Z",
                    "end_time": "2022-07-15T02:00:00Z",
                    "restricted_to_prices": []
                  },
                  "value": 5,
                  "type": "percentage",
                  "currency_id": null,
                  "metadata": {
                    "purchase_discount_id": "MLB1044001",
                    "purchase_discount_type": "BD",
                    "purchase_discount_campaign_id": "P-MLB6679004",
                    "purchase_discount_rebate_id":
                        "OFFER-MLB2632933929-300753560"
                  },
                  "exchange_rate_context": "DEFAULT"
                }
              ],
              "reference_prices": [
                {
                  "id": "31",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4499,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:58:21Z"
                },
                {
                  "id": "32",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-28T04:58:21Z",
                    "end_time": "2022-07-05T04:58:21Z",
                    "eligible": true
                  },
                  "amount": 5998.89,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T04:58:21Z"
                }
              ],
              "purchase_discounts": [
                {
                  "purchase_discount_id": "MLB1044001",
                  "campaign_id": "P-MLB6679004",
                  "rebate_id": "OFFER-MLB2632933929-300753560",
                  "type": "BD",
                  "discount_percentage": 0.05,
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-12T03:00:00Z",
                    "end_time": "2022-07-15T02:00:00Z",
                    "eligible": true
                  },
                  "purchase_min_amount": 1499,
                  "max_discount_amount": 10000,
                  "max_benefit_count": 1,
                  "funding_mode": "coupon"
                }
              ]
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-30T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2632933929-celular-samsung-galaxy-s22-128-gb-rose-61-5g-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_935897-MLB49863923243_052022-I.jpg",
            "thumbnail_id": "935897-MLB49863923243_052022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 599.89,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-ES",
              "state_name": "Espírito Santo",
              "city_id": "TUxCQ1NFUmI1ZGQx",
              "city_name": "Serra"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping", "optional_me2_chosen"],
              "logistic_type": "cross_docking",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-ES", "name": "Espírito Santo"},
              "city": {"id": "TUxCQ1NFUmI1ZGQx", "name": "Serra"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6640288194394508
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6640288194394508,
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null
              },
              {
                "name": "Modelo detalhado",
                "value_id": "11850081",
                "value_name": "SM-S901",
                "source": 1,
                "id": "DETAILED_MODEL",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 1,
                    "id": "11850081",
                    "name": "SM-S901"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "name": "Condição do item",
                "value_id": "2230284",
                "value_struct": null,
                "values": [
                  {"name": "Novo", "struct": null, "source": 1, "id": "2230284"}
                ],
                "id": "ITEM_CONDITION",
                "value_name": "Novo"
              },
              {
                "id": "LINE",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "value_struct": null,
                "name": "Linha",
                "values": [
                  {
                    "struct": null,
                    "source": 1,
                    "id": "249991",
                    "name": "Galaxy S"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "values": [
                  {
                    "struct": null,
                    "source": 6640288194394508,
                    "id": null,
                    "name": "SM-S901EIDRZTO"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6640288194394508,
                "id": "MODEL",
                "name": "Modelo",
                "value_id": null,
                "value_name": "SM-S901EIDRZTO",
                "value_struct": null
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 1,
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "attribute_group_name": "Outros",
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": 232,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967706",
            "tags": [
              "good_quality_picture",
              "good_quality_thumbnail",
              "extended_warranty_eligible",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 22,
            "use_thumbnail_id": true,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2196623436",
            "site_id": "MLB",
            "title": "Smartphone Samsung Galaxy S22+ 5g 128gb 8gb Ram Preto",
            "seller": {
              "id": 238741367,
              "permalink":
                  "http://perfil.mercadolivre.com.br/ATTOS+CAL%C3%87ADOS",
              "registration_date": "2016-12-23T11:34:52.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0.0491,
                    "value": 24
                  },
                  "sales": {"period": "365 days", "completed": 481}
                },
                "transactions": {
                  "canceled": 59,
                  "period": "historic",
                  "total": 540,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 481
                }
              }
            },
            "price": 5699.05,
            "prices": {
              "id": "MLB2196623436",
              "prices": [
                {
                  "id": "46",
                  "type": "standard",
                  "amount": 5999,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-17T18:42:39Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "19",
                  "type": "standard",
                  "amount": 6199,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-18T17:02:33Z",
                  "conditions": {
                    "context_restrictions": ["channel_mshops"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "58",
                  "type": "promotion",
                  "amount": 5699.05,
                  "regular_amount": 6299,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-07T19:05:44Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-06T21:00:00Z",
                    "end_time": "2022-07-18T03:00:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "MLB9377",
                    "promotion_id": "MLB9377",
                    "promotion_type": "campaign"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "55",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-04T04:21:20Z"
                },
                {
                  "id": "56",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-04T04:21:20Z",
                    "end_time": "2022-07-11T04:21:20Z",
                    "eligible": true
                  },
                  "amount": 5984.05,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-04T04:21:20Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 2,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-05-21T20:02:49.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2196623436-smartphone-samsung-galaxy-s22-5g-128gb-8gb-ram-preto-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_675245-MLB49412161337_032022-O.jpg",
            "thumbnail_id": "675245-MLB49412161337_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 569.91,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-MS",
              "state_name": "Mato Grosso do Sul",
              "city_id": "TUxCQ0NBTTFiNzU5",
              "city_name": "Campo Grande"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-MS", "name": "Mato Grosso do Sul"},
              "city": {"id": "TUxCQ0NBTTFiNzU5", "name": "Campo Grande"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_id": "206",
                "values": [
                  {
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "206",
                    "name": "Samsung"
                  }
                ],
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "id": "BRAND",
                "name": "Marca",
                "value_name": "Samsung"
              },
              {
                "name": "Condição do item",
                "value_id": "2230284",
                "values": [
                  {
                    "source": 3045741222775799,
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "ITEM_CONDITION",
                "value_name": "Novo",
                "value_struct": null,
                "source": 3045741222775799
              },
              {
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null,
                "source": 3942444344910321,
                "id": "LINE",
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_name": "S22+",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "11850079",
                    "name": "S22+"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "11850079",
                "attribute_group_name": "Outros",
                "source": 3942444344910321
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 6299,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "standard_price_by_channel",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 23,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2691192924",
            "site_id": "MLB",
            "title": "Samsung Galaxy S22 Dual Sim 256 Gb Black 8 Gb Ram",
            "seller": {
              "id": 1024532634,
              "permalink":
                  "http://perfil.mercadolivre.com.br/FIX.TECH.PARTS.LTDA",
              "registration_date": "2021-11-22T22:40:20.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 2},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0.0158,
                    "value": 1
                  },
                  "sales": {"period": "365 days", "completed": 66}
                },
                "transactions": {
                  "canceled": 25,
                  "period": "historic",
                  "total": 91,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 66
                }
              }
            },
            "price": 5841,
            "prices": {
              "id": "MLB2691192924",
              "prices": [
                {
                  "id": "2",
                  "type": "standard",
                  "amount": 5841,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-24T20:28:36Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "4",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5841,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T05:19:21Z"
                },
                {
                  "id": "5",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-28T05:19:21Z",
                    "end_time": "2022-07-05T05:19:21Z",
                    "eligible": true
                  },
                  "amount": 5899,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-28T05:19:21Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 500,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-18T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2691192924-samsung-galaxy-s22-dual-sim-256-gb-black-8-gb-ram-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_637850-MLA50287846891_062022-O.jpg",
            "thumbnail_id": "637850-MLA50287846891_062022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 584.1,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-22",
              "city_name": "Praia Grande"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-22", "name": "Praia Grande"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung"
              },
              {
                "id": "GPU_MODEL",
                "value_id": "11732915",
                "attribute_group_id": "OTHERS",
                "source": 7567447101417086,
                "name": "Modelo de GPU",
                "value_name": "Xclipse 920",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 7567447101417086,
                    "id": "11732915",
                    "name": "Xclipse 920"
                  }
                ],
                "attribute_group_name": "Outros"
              },
              {
                "id": "ITEM_CONDITION",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "name": "Condição do item",
                "value_id": "2230284",
                "value_name": "Novo",
                "value_struct": null
              },
              {
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "249991"
                  }
                ],
                "source": 6808261514773724,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_name": "S22 Dual SIM (Exynos)",
                "values": [
                  {
                    "source": 6808261514773724,
                    "id": "12062631",
                    "name": "S22 Dual SIM (Exynos)",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 6808261514773724,
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "12062631",
                "value_struct": null,
                "attribute_group_name": "Outros"
              },
              {
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "values": [
                  {
                    "name": "Exynos 2200",
                    "struct": null,
                    "source": 7567447101417086,
                    "id": "11732916"
                  }
                ],
                "source": 7567447101417086,
                "value_id": "11732916",
                "value_name": "Exynos 2200",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_struct": {"number": 167, "unit": "g"},
                "source": 7567447101417086,
                "id": "WEIGHT",
                "name": "Peso",
                "value_id": "2087871",
                "attribute_group_name": "Outros",
                "value_name": "167 g",
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_id": "OTHERS"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18956059",
            "tags": [
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 24,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2626043565",
            "site_id": "MLB",
            "title": "Celular Samsung Galaxy S22+ 128gb Ram 8gb 5g Tela 6.6",
            "seller": {
              "id": 290494113,
              "permalink": "http://perfil.mercadolivre.com.br/7OUT",
              "registration_date": "2017-12-14T12:35:12.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "eshop", "mshops", "messages_as_seller"],
              "eshop": {
                "seller": 290494113,
                "eshop_rubro": null,
                "eshop_id": 372649,
                "nick_name": "7OUT",
                "site_id": "MLB",
                "eshop_logo_url":
                    "http://http2.mlstatic.com/eshops-logo/290494113v03d680.png",
                "eshop_status_id": 1,
                "eshop_experience": 0,
                "eshop_locations": []
              },
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.017,
                    "value": 18
                  },
                  "claims": {"period": "60 days", "rate": 0.0103, "value": 11},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0274,
                    "value": 26
                  },
                  "sales": {"period": "60 days", "completed": 884}
                },
                "transactions": {
                  "canceled": 726,
                  "period": "historic",
                  "total": 3940,
                  "ratings": {
                    "negative": 0.05,
                    "neutral": 0.02,
                    "positive": 0.93
                  },
                  "completed": 3214
                }
              }
            },
            "price": 5983.95,
            "prices": {
              "id": "MLB2626043565",
              "prices": [
                {
                  "id": "14",
                  "type": "standard",
                  "amount": 5983.95,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-11T13:05:17Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "13",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5699,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-08T19:40:44Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-23T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2626043565-celular-samsung-galaxy-s22-128gb-ram-8gb-5g-tela-66-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_883907-MLB49794580526_042022-O.jpg",
            "thumbnail_id": "883907-MLB49794580526_042022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 598.4,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-39",
              "city_name": "São Bernardo do Campo"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "xd_drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-39", "name": "São Bernardo do Campo"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "value_id": "206",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Marca",
                "value_name": "Samsung",
                "source": 6808261514773724
              },
              {
                "value_id": "2230284",
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 6808261514773724,
                "name": "Condição do item",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "ITEM_CONDITION"
              },
              {
                "source": 6808261514773724,
                "name": "Linha",
                "value_name": "Galaxy S",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "id": "LINE",
                "value_id": "249991",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_name": "Outros"
              },
              {
                "id": "MODEL",
                "value_name": "S22+",
                "name": "Modelo",
                "value_id": "11850079",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "11850079",
                    "name": "S22+"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6808261514773724
              },
              {
                "attribute_group_name": "Outros",
                "source": 1183438784296846,
                "value_struct": {"number": 168, "unit": "g"},
                "values": [
                  {
                    "id": "6793640",
                    "name": "168 g",
                    "struct": {"number": 168, "unit": "g"},
                    "source": 1183438784296846
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "WEIGHT",
                "name": "Peso",
                "value_id": "6793640",
                "value_name": "168 g"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "good_quality_thumbnail",
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 25,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2704505917",
            "site_id": "MLB",
            "title":
                "Celular Samsung Galaxy S22 128gb Ram 8gb Dual 5g Tela 6.6",
            "seller": {
              "id": 368500700,
              "permalink": "http://perfil.mercadolivre.com.br/DMAIS+OUTLET",
              "registration_date": "2018-10-24T10:01:49.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "gold",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.018,
                    "value": 9
                  },
                  "claims": {"period": "60 days", "rate": 0.016, "value": 8},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0157,
                    "value": 7
                  },
                  "sales": {"period": "60 days", "completed": 401}
                },
                "transactions": {
                  "canceled": 691,
                  "period": "historic",
                  "total": 3480,
                  "ratings": {
                    "negative": 0.09,
                    "neutral": 0.04,
                    "positive": 0.87
                  },
                  "completed": 2789
                }
              }
            },
            "price": 5091.45,
            "prices": {
              "id": "MLB2704505917",
              "prices": [
                {
                  "id": "2",
                  "type": "standard",
                  "amount": 5091.45,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-11T13:06:19Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "3",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5091.45,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-11T13:06:24Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-29T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2704505917-celular-samsung-galaxy-s22-128gb-ram-8gb-dual-5g-tela-66-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_982115-MLA49387651611_032022-O.jpg",
            "thumbnail_id": "982115-MLA49387651611_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 509.15,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-39",
              "city_name": "São Bernardo do Campo"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "cross_docking",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-39", "name": "São Bernardo do Campo"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_name": "Samsung",
                "source": 3045741222775799,
                "value_id": "206",
                "value_struct": null,
                "values": [
                  {
                    "source": 3045741222775799,
                    "id": "206",
                    "name": "Samsung",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "name": "Marca"
              },
              {
                "id": "DETAILED_MODEL",
                "value_id": null,
                "values": [
                  {
                    "name": "SM-S901",
                    "struct": null,
                    "source": 7567447101417086,
                    "id": null
                  }
                ],
                "source": 7567447101417086,
                "name": "Modelo detalhado",
                "value_name": "SM-S901",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "id": "GPU_MODEL",
                "source": 4709228965570453
              },
              {
                "value_name": "Novo",
                "values": [
                  {
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "2230284",
                    "name": "Novo"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_id": "2230284",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 3045741222775799
              },
              {
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "LINE",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "source": 3045741222775799,
                "name": "Linha"
              },
              {
                "value_id": "12062075",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "name": "Modelo",
                "attribute_group_id": "OTHERS",
                "id": "MODEL"
              },
              {
                "name": "Modelo do processador",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "PROCESSOR_MODEL",
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "value_struct": null
              },
              {
                "id": "WEIGHT",
                "name": "Peso",
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 1183438784296846
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "value_id": "2087871",
                "value_name": "167 g",
                "value_struct": {"number": 167, "unit": "g"},
                "source": 1183438784296846
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 26,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2637725561",
            "site_id": "MLB",
            "title": "Samsung Galaxy S22 Ultra  256 Gb Burgundy 12 Gb Ram",
            "seller": {
              "id": 454900309,
              "permalink": "http://perfil.mercadolivre.com.br/PRINCIPAL+ONLINE",
              "registration_date": "2019-07-24T10:50:10.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "mshops",
                "credits_profile",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 2},
                  "claims": {"period": "60 days", "rate": 0.0103, "value": 24},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.132,
                    "value": 296
                  },
                  "sales": {"period": "60 days", "completed": 2152}
                },
                "transactions": {
                  "canceled": 627,
                  "period": "historic",
                  "total": 8348,
                  "ratings": {
                    "negative": 0.09,
                    "neutral": 0.03,
                    "positive": 0.88
                  },
                  "completed": 7721
                }
              }
            },
            "price": 8449,
            "prices": {
              "id": "MLB2637725561",
              "prices": [
                {
                  "id": "10",
                  "type": "standard",
                  "amount": 8449,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-13T13:57:45Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "8",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 8436,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-05-28T08:39:17Z"
                },
                {
                  "id": "9",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-05-28T08:39:17Z",
                    "end_time": "2022-06-04T08:39:17Z",
                    "eligible": true
                  },
                  "amount": 8599,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-05-28T08:39:17Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 1,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-05-05T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2637725561-samsung-galaxy-s22-ultra-256-gb-burgundy-12-gb-ram-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_863969-MLA49303779098_032022-O.jpg",
            "thumbnail_id": "863969-MLA49303779098_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 844.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-23",
              "city_name": "Ribeirão Preto"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "xd_drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-23", "name": "Ribeirão Preto"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "attribute_group_id": "OTHERS",
                "id": "BRAND",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "name": "Marca",
                "value_id": "206",
                "attribute_group_name": "Outros",
                "source": 2860837171021627
              },
              {
                "value_id": null,
                "value_name": "SM-S908",
                "values": [
                  {
                    "id": null,
                    "name": "SM-S908",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_struct": null,
                "source": 7567447101417086
              },
              {
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 4709228965570453
              },
              {
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "id": "ITEM_CONDITION",
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 2860837171021627,
                "name": "Condição do item",
                "value_id": "2230284"
              },
              {
                "name": "Linha",
                "value_name": "Galaxy S",
                "attribute_group_name": "Outros",
                "source": 2860837171021627,
                "id": "LINE",
                "value_id": "249991",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Modelo",
                "value_id": "12063780",
                "values": [
                  {
                    "source": 2860837171021627,
                    "id": "12063780",
                    "name": "S22 Ultra Dual SIM (Snapdragon)",
                    "struct": null
                  }
                ],
                "id": "MODEL",
                "value_name": "S22 Ultra Dual SIM (Snapdragon)",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 2860837171021627
              },
              {
                "name": "Modelo do processador",
                "attribute_group_id": "OTHERS",
                "source": 7567447101417086,
                "id": "PROCESSOR_MODEL",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "values": [
                  {
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086,
                    "id": "11850084"
                  }
                ],
                "attribute_group_name": "Outros"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967699",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 27,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2690668268",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 Dual Sim 256 Gb Phantom Black 8 Gb Ram",
            "seller": {
              "id": 10516094,
              "permalink": "http://perfil.mercadolivre.com.br/FIX.TECHNOLOGY",
              "registration_date": "2002-07-25T00:00:00.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "credits_profile",
                "mshops",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 1
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 1},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0.0178,
                    "value": 1
                  },
                  "sales": {"period": "365 days", "completed": 65}
                },
                "transactions": {
                  "canceled": 20,
                  "period": "historic",
                  "total": 85,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.02,
                    "positive": 0.94
                  },
                  "completed": 65
                }
              }
            },
            "price": 5900,
            "prices": {
              "id": "MLB2690668268",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 5900,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-23T17:32:17Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 500,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-18T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2690668268-samsung-galaxy-s22-dual-sim-256-gb-phantom-black-8-gb-ram-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_637850-MLA50287846891_062022-O.jpg",
            "thumbnail_id": "637850-MLA50287846891_062022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 590,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-22",
              "city_name": "Praia Grande"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-22", "name": "Praia Grande"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "source": 6808261514773724
              },
              {
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "value_id": "11732915",
                "value_name": "Xclipse 920",
                "values": [
                  {
                    "id": "11732915",
                    "name": "Xclipse 920",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_id": "OTHERS",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 7567447101417086
              },
              {
                "name": "Condição do item",
                "value_struct": null,
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_name": "Novo",
                "attribute_group_id": "OTHERS"
              },
              {
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "value_name": "Galaxy S",
                "value_struct": null,
                "source": 6808261514773724,
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991"
              },
              {
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "12062631",
                "value_struct": null,
                "value_name": "S22 Dual SIM (Exynos)",
                "values": [
                  {
                    "name": "S22 Dual SIM (Exynos)",
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "12062631"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 6808261514773724
              },
              {
                "value_id": "11732916",
                "value_name": "Exynos 2200",
                "value_struct": null,
                "values": [
                  {
                    "id": "11732916",
                    "name": "Exynos 2200",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "attribute_group_id": "OTHERS",
                "source": 7567447101417086
              },
              {
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_name": "Outros",
                "value_struct": {"number": 167, "unit": "g"},
                "attribute_group_id": "OTHERS",
                "source": 7567447101417086,
                "id": "WEIGHT",
                "name": "Peso",
                "value_id": "2087871",
                "value_name": "167 g"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18956059",
            "tags": [
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 28,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2671825542",
            "site_id": "MLB",
            "title": "Celular Samsung Galaxy S22+ 256gb Ram 8 Gb 5g Tela 6.6",
            "seller": {
              "id": 271180532,
              "permalink": "http://perfil.mercadolivre.com.br/4SHOW",
              "registration_date": "2017-08-31T12:33:20.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "eshop", "mshops", "messages_as_seller"],
              "eshop": {
                "seller": 271180532,
                "eshop_rubro": null,
                "eshop_id": 372653,
                "nick_name": "4SHOW",
                "site_id": "MLB",
                "eshop_logo_url":
                    "http://http2.mlstatic.com/eshops-logo/271180532v16ea46.png",
                "eshop_status_id": 1,
                "eshop_experience": 0,
                "eshop_locations": []
              },
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.0172,
                    "value": 21
                  },
                  "claims": {"period": "60 days", "rate": 0.0197, "value": 24},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0269,
                    "value": 29
                  },
                  "sales": {"period": "60 days", "completed": 1000}
                },
                "transactions": {
                  "canceled": 1218,
                  "period": "historic",
                  "total": 7292,
                  "ratings": {
                    "negative": 0.04,
                    "neutral": 0.03,
                    "positive": 0.93
                  },
                  "completed": 6074
                }
              }
            },
            "price": 6719,
            "prices": {
              "id": "MLB2671825542",
              "prices": [
                {
                  "id": "33",
                  "type": "standard",
                  "amount": 6719,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-13T19:44:39Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "29",
                  "type": "standard",
                  "amount": 5951,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-08T19:40:15Z",
                  "conditions": {
                    "context_restrictions": ["channel_mshops"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "30",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-02T04:58:35Z",
                    "end_time": "2022-07-09T04:58:35Z",
                    "eligible": true
                  },
                  "amount": 5858,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-08T19:41:16Z"
                },
                {
                  "id": "31",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5858,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-08T19:41:16Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-03T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2671825542-celular-samsung-galaxy-s22-256gb-ram-8-gb-5g-tela-66-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_978660-MLB50238013449_062022-O.jpg",
            "thumbnail_id": "978660-MLB50238013449_062022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 671.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-39",
              "city_name": "São Bernardo do Campo"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "cross_docking",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-39", "name": "São Bernardo do Campo"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "name": "Marca",
                "value_name": "Samsung",
                "source": 6808261514773724,
                "value_id": "206",
                "value_struct": null,
                "attribute_group_id": "OTHERS"
              },
              {
                "value_id": null,
                "attribute_group_id": "OTHERS",
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_name": "SM-S906",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "SM-S906",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 7567447101417086
              },
              {
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "name": "Condição do item",
                "value_struct": null,
                "values": [
                  {
                    "source": 6808261514773724,
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_name": "Novo"
              },
              {
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "name": "Linha",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "value_struct": null,
                "id": "LINE",
                "attribute_group_id": "OTHERS"
              },
              {
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "source": 6808261514773724,
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "11850079",
                "value_name": "S22+",
                "value_struct": null,
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Modelo do processador",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 7567447101417086,
                "id": "PROCESSOR_MODEL",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "attribute_group_name": "Outros"
              },
              {
                "values": [
                  {
                    "id": "6793640",
                    "name": "168 g",
                    "struct": {"number": 168, "unit": "g"},
                    "source": 1183438784296846
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1183438784296846,
                "id": "WEIGHT",
                "value_name": "168 g",
                "value_struct": {"number": 168, "unit": "g"},
                "name": "Peso",
                "value_id": "6793640"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "standard_price_by_channel",
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 29,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2704531875",
            "site_id": "MLB",
            "title": "Celular Samsung Galaxy S22 128gb Ram 8gb Dual 5g ",
            "seller": {
              "id": 368500700,
              "permalink": "http://perfil.mercadolivre.com.br/DMAIS+OUTLET",
              "registration_date": "2018-10-24T10:01:49.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "gold",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.018,
                    "value": 9
                  },
                  "claims": {"period": "60 days", "rate": 0.016, "value": 8},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0157,
                    "value": 7
                  },
                  "sales": {"period": "60 days", "completed": 401}
                },
                "transactions": {
                  "canceled": 691,
                  "period": "historic",
                  "total": 3480,
                  "ratings": {
                    "negative": 0.09,
                    "neutral": 0.04,
                    "positive": 0.87
                  },
                  "completed": 2789
                }
              }
            },
            "price": 5091.45,
            "prices": {
              "id": "MLB2704531875",
              "prices": [
                {
                  "id": "2",
                  "type": "standard",
                  "amount": 5091.45,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-11T13:06:51Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "3",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5091.45,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-11T13:06:52Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-29T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2704531875-celular-samsung-galaxy-s22-128gb-ram-8gb-dual-5g-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_607199-MLA49387650897_032022-O.jpg",
            "thumbnail_id": "607199-MLA49387650897_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 509.15,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-39",
              "city_name": "São Bernardo do Campo"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "cross_docking",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-39", "name": "São Bernardo do Campo"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "value_id": "206",
                "value_name": "Samsung",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "source": 3045741222775799,
                "name": "Marca",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_name": "SM-S901",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 7567447101417086,
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_id": null,
                "values": [
                  {
                    "name": "SM-S901",
                    "struct": null,
                    "source": 7567447101417086,
                    "id": null
                  }
                ],
                "attribute_group_name": "Outros"
              },
              {
                "value_struct": null,
                "attribute_group_name": "Outros",
                "value_name": "Adreno 730",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "values": [
                  {
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453,
                    "id": "11732851"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 4709228965570453,
                "id": "GPU_MODEL"
              },
              {
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_name": "Novo",
                "value_struct": null,
                "source": 3045741222775799,
                "name": "Condição do item",
                "values": [
                  {
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "2230284",
                    "name": "Novo"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "source": 3045741222775799,
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "attribute_group_name": "Outros"
              },
              {
                "name": "Modelo",
                "values": [
                  {
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "source": 3045741222775799,
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "value_id": "12062075",
                "value_name": "S22 Dual SIM (Snapdragon)"
              },
              {
                "value_id": "11850084",
                "value_struct": null,
                "values": [
                  {
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086,
                    "id": "11850084"
                  }
                ],
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7567447101417086
              },
              {
                "id": "WEIGHT",
                "value_id": "2087871",
                "value_name": "167 g",
                "value_struct": {"number": 167, "unit": "g"},
                "attribute_group_id": "OTHERS",
                "name": "Peso",
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 1183438784296846
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 1183438784296846
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 30,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2685394737",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 Ultra Dual 256gb Phantom White 12gb Ram",
            "seller": {
              "id": 520494493,
              "permalink": "http://perfil.mercadolivre.com.br/GG+PRIME",
              "registration_date": "2020-01-30T07:46:33.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "mshops",
                "credits_profile",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": "silver",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 1},
                  "claims": {"period": "60 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 70}
                },
                "transactions": {
                  "canceled": 26,
                  "period": "historic",
                  "total": 323,
                  "ratings": {"negative": 0.08, "neutral": 0, "positive": 0.92},
                  "completed": 297
                }
              }
            },
            "price": 9999,
            "prices": {
              "id": "MLB2685394737",
              "prices": [
                {
                  "id": "10",
                  "type": "standard",
                  "amount": 9999,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-29T14:26:11Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "2",
                  "type": "standard",
                  "amount": 8787,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-20T18:30:46Z",
                  "conditions": {
                    "context_restrictions": ["channel_mshops"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "13",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 8650,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-02T04:47:17Z"
                },
                {
                  "id": "14",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-02T04:47:17Z",
                    "end_time": "2022-07-09T04:47:17Z",
                    "eligible": true
                  },
                  "amount": 8650,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-02T04:47:17Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_special",
            "stop_time": "2042-06-15T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2685394737-samsung-galaxy-s22-ultra-dual-256gb-phantom-white-12gb-ram-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_834464-MLA49303777747_032022-O.jpg",
            "thumbnail_id": "834464-MLA49303777747_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 12,
              "amount": 969.4,
              "rate": 16.34,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-PR",
              "state_name": "Paraná",
              "city_id": "TUxCQ0xPTmI2Njg1",
              "city_name": "Londrina"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "xd_drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-PR", "name": "Paraná"},
              "city": {"id": "TUxCQ0xPTmI2Njg1", "name": "Londrina"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Marca",
                "value_id": "206",
                "value_name": "Samsung",
                "id": "BRAND",
                "source": 3045741222775799
              },
              {
                "attribute_group_name": "Outros",
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "SM-S908",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_id": "OTHERS",
                "value_id": null,
                "value_name": "SM-S908",
                "source": 7567447101417086
              },
              {
                "value_name": "Adreno 730",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "attribute_group_id": "OTHERS",
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "values": [
                  {
                    "source": 4709228965570453,
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null
                  }
                ]
              },
              {
                "id": "ITEM_CONDITION",
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "name": "Condição do item",
                "value_id": "2230284",
                "values": [
                  {
                    "name": "Novo",
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "2230284"
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "value_name": "Galaxy S",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "id": "MODEL",
                "name": "Modelo",
                "values": [
                  {
                    "id": "12063780",
                    "name": "S22 Ultra Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "value_id": "12063780",
                "value_name": "S22 Ultra Dual SIM (Snapdragon)",
                "value_struct": null,
                "source": 3045741222775799
              },
              {
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": "11850084",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ]
              }
            ],
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967699",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "standard_price_by_channel",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 31,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2698240635",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 Dual Sim 128 Gb Phantom White 8 Gb Ram",
            "seller": {
              "id": 520494493,
              "permalink": "http://perfil.mercadolivre.com.br/GG+PRIME",
              "registration_date": "2020-01-30T07:46:33.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "mshops",
                "credits_profile",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": "silver",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 1},
                  "claims": {"period": "60 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 70}
                },
                "transactions": {
                  "canceled": 26,
                  "period": "historic",
                  "total": 323,
                  "ratings": {"negative": 0.08, "neutral": 0, "positive": 0.92},
                  "completed": 297
                }
              }
            },
            "price": 5299,
            "prices": {
              "id": "MLB2698240635",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 5299,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-29T18:50:11Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "2",
                  "type": "standard",
                  "amount": 4299,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-29T18:50:11Z",
                  "conditions": {
                    "context_restrictions": ["channel_mshops"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "8",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5299,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-04T04:56:37Z"
                },
                {
                  "id": "9",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-04T04:56:37Z",
                    "end_time": "2022-07-11T04:56:37Z",
                    "eligible": true
                  },
                  "amount": 4299,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-04T04:56:37Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-24T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2698240635-samsung-galaxy-s22-dual-sim-128-gb-phantom-white-8-gb-ram-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_982115-MLA49387651611_032022-O.jpg",
            "thumbnail_id": "982115-MLA49387651611_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 529.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-PR",
              "state_name": "Paraná",
              "city_id": "TUxCQ0xPTmI2Njg1",
              "city_name": "Londrina"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "xd_drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-PR", "name": "Paraná"},
              "city": {"id": "TUxCQ0xPTmI2Njg1", "name": "Londrina"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "value_id": "206",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "name": "Marca",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {
                    "source": 3045741222775799,
                    "id": "206",
                    "name": "Samsung",
                    "struct": null
                  }
                ]
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "SM-S901",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "id": "DETAILED_MODEL",
                "value_name": "SM-S901",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "name": "Modelo detalhado",
                "value_id": null
              },
              {
                "id": "GPU_MODEL",
                "value_name": "Adreno 730",
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_name": "Outros",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 4709228965570453
              },
              {
                "name": "Condição do item",
                "attribute_group_name": "Outros",
                "attribute_group_id": "OTHERS",
                "source": 3045741222775799,
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_name": "Novo",
                "value_struct": null,
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ]
              },
              {
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "source": 3045741222775799,
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991"
              },
              {
                "id": "MODEL",
                "value_struct": null,
                "values": [
                  {
                    "name": "S22 Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "12062075"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "name": "Modelo",
                "value_id": "12062075",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "attribute_group_id": "OTHERS"
              },
              {
                "value_id": "11850084",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "values": [
                  {
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086,
                    "id": "11850084"
                  }
                ],
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null
              },
              {
                "name": "Peso",
                "value_name": "167 g",
                "source": 4709228965570453,
                "id": "WEIGHT",
                "value_id": "2087871",
                "value_struct": {"number": 167, "unit": "g"},
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "standard_price_by_channel",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 32,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2704588465",
            "site_id": "MLB",
            "title": "Samsung Galaxy S22+ Dual Sim 256 Gb  8 Gb Ram",
            "seller": {
              "id": 368500700,
              "permalink": "http://perfil.mercadolivre.com.br/DMAIS+OUTLET",
              "registration_date": "2018-10-24T10:01:49.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "gold",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.018,
                    "value": 9
                  },
                  "claims": {"period": "60 days", "rate": 0.016, "value": 8},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0157,
                    "value": 7
                  },
                  "sales": {"period": "60 days", "completed": 401}
                },
                "transactions": {
                  "canceled": 691,
                  "period": "historic",
                  "total": 3480,
                  "ratings": {
                    "negative": 0.09,
                    "neutral": 0.04,
                    "positive": 0.87
                  },
                  "completed": 2789
                }
              }
            },
            "price": 6718.95,
            "prices": {
              "id": "MLB2704588465",
              "prices": [
                {
                  "id": "4",
                  "type": "standard",
                  "amount": 6718.95,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-11T13:06:21Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "5",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 6299,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-11T13:06:24Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-29T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2704588465-samsung-galaxy-s22-dual-sim-256-gb-8-gb-ram-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_824262-MLA50514308939_062022-O.jpg",
            "thumbnail_id": "824262-MLA50514308939_062022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 671.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-39",
              "city_name": "São Bernardo do Campo"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "cross_docking",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-39", "name": "São Bernardo do Campo"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "attribute_group_name": "Outros",
                "value_name": "Samsung",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 3045741222775799
              },
              {
                "value_name": "SM-S906",
                "attribute_group_id": "OTHERS",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 7567447101417086,
                    "id": null,
                    "name": "SM-S906"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_id": null
              },
              {
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "name": "Condição do item",
                "value_id": "2230284",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "id": "ITEM_CONDITION"
              },
              {
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 3045741222775799,
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "id": "LINE",
                "value_name": "Galaxy S"
              },
              {
                "id": "MODEL",
                "value_id": "11850079",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Modelo",
                "value_name": "S22+",
                "values": [
                  {
                    "name": "S22+",
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "11850079"
                  }
                ],
                "source": 3045741222775799
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "source": 7567447101417086,
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "WEIGHT",
                "value_name": "168 g",
                "values": [
                  {
                    "struct": {"number": 168, "unit": "g"},
                    "source": 1183438784296846,
                    "id": "6793640",
                    "name": "168 g"
                  }
                ],
                "source": 1183438784296846,
                "name": "Peso",
                "value_id": "6793640",
                "value_struct": {"number": 168, "unit": "g"}
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 33,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2186949426",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 Ultra Verde, Com Tela De 6,8 , 5g, 256gb",
            "seller": {
              "id": 234000251,
              "permalink": "http://perfil.mercadolivre.com.br/FASTSHOP+OFICIAL",
              "registration_date": "2016-11-09T09:05:35.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["brand", "large_seller", "mshops", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.0034,
                    "value": 41
                  },
                  "claims": {"period": "60 days", "rate": 0.0088, "value": 104},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0975,
                    "value": 552
                  },
                  "sales": {"period": "60 days", "completed": 11036}
                },
                "transactions": {
                  "canceled": 5180,
                  "period": "historic",
                  "total": 67258,
                  "ratings": {
                    "negative": 0.03,
                    "neutral": 0.04,
                    "positive": 0.93
                  },
                  "completed": 62078
                }
              }
            },
            "price": 9688.98,
            "prices": {
              "id": "MLB2186949426",
              "prices": [
                {
                  "id": "46",
                  "type": "standard",
                  "amount": 9699,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-13T13:12:08Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "47",
                  "type": "promotion",
                  "amount": 9499,
                  "regular_amount": 9699,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-13T14:17:39Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-12T03:01:00Z",
                    "end_time": "2022-07-18T01:59:00Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "campaign_id": "P-MLB6539002",
                    "promotion_id": "OFFER-MLB2186949426-302551517",
                    "promotion_type": "marketplace_campaign",
                    "discount_meli_amount": 189.98,
                    "campaign_discount_percentage": 2.06,
                    "campaign_end_date": "2022-07-18T01:59:00Z",
                    "order_item_price": 9688.98,
                    "funding_mode": "coupon"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "39",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 9106.3,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-30T06:39:54Z"
                },
                {
                  "id": "40",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-06-30T06:39:54Z",
                    "end_time": "2022-07-07T06:39:54Z",
                    "eligible": true
                  },
                  "amount": 9366.44,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-30T06:39:54Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-02-18T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2186949426-samsung-galaxy-s22-ultra-verde-com-tela-de-68-5g-256gb-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_858578-MLB49192823871_022022-O.jpg",
            "thumbnail_id": "858578-MLB49192823871_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 968.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BDYWphbWFy",
              "city_name": "Cajamar"
            },
            "shipping": {
              "free_shipping": false,
              "mode": "me1",
              "tags": [],
              "logistic_type": "default",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BDYWphbWFy", "name": "Cajamar"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 2874922819648776,
                    "id": "206",
                    "name": "Samsung"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 2874922819648776,
                "name": "Marca",
                "id": "BRAND"
              },
              {
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "GPU_MODEL",
                "value_struct": null,
                "value_name": "Adreno 730",
                "attribute_group_id": "OTHERS",
                "source": 4709228965570453,
                "name": "Modelo de GPU",
                "value_id": "11732851"
              },
              {
                "attribute_group_name": "Outros",
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_id": "2230284",
                "value_name": "Novo",
                "value_struct": null,
                "values": [
                  {"struct": null, "source": 1, "id": "2230284", "name": "Novo"}
                ],
                "attribute_group_id": "OTHERS",
                "source": 1
              },
              {
                "name": "Linha",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "id": "LINE",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321
              },
              {
                "value_name": "S22 Ultra",
                "values": [
                  {
                    "id": null,
                    "name": "S22 Ultra",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "id": "MODEL",
                "value_id": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Modelo",
                "value_struct": null
              },
              {
                "name": "Modelo do processador",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "id": "PROCESSOR_MODEL",
                "value_id": "11764992",
                "value_name": "Snapdragon 8 Gen 1",
                "values": [
                  {
                    "struct": null,
                    "source": 4709228965570453,
                    "id": "11764992",
                    "name": "Snapdragon 8 Gen 1"
                  }
                ],
                "attribute_group_id": "OTHERS"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": 9699,
            "category_id": "MLB1055",
            "official_store_id": 942,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967699",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 34,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2612112429",
            "site_id": "MLB",
            "title": "Samsung Galaxy S22 Dual Sim 128 Gb - 8 Gb Ram - Rosé",
            "seller": {
              "id": 130201827,
              "permalink": "http://perfil.mercadolivre.com.br/VICTORPASSOS940",
              "registration_date": "2012-12-09T21:19:49.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "credits_profile",
                "mshops",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 2},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0.0105,
                    "value": 1
                  },
                  "sales": {"period": "365 days", "completed": 90}
                },
                "transactions": {
                  "canceled": 10,
                  "period": "historic",
                  "total": 100,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 90
                }
              }
            },
            "price": 6490,
            "prices": {
              "id": "MLB2612112429",
              "prices": [
                {
                  "id": "40",
                  "type": "standard",
                  "amount": 6490,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-19T00:04:39Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "43",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4390,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-02T06:58:09Z"
                },
                {
                  "id": "44",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-02T06:58:09Z",
                    "end_time": "2022-07-09T06:58:09Z",
                    "eligible": true
                  },
                  "amount": 4490,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-02T06:58:09Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-08T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2612112429-samsung-galaxy-s22-dual-sim-128-gb-8-gb-ram-rose-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_792091-MLA49387650805_032022-O.jpg",
            "thumbnail_id": "792091-MLA49387650805_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 649,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-ES",
              "state_name": "Espírito Santo",
              "city_id": "TUxCQ1ZJTGU5YTdl",
              "city_name": "Vila Velha"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-ES", "name": "Espírito Santo"},
              "city": {"id": "TUxCQ1ZJTGU5YTdl", "name": "Vila Velha"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "BRAND",
                "value_struct": null,
                "value_name": "Samsung",
                "values": [
                  {
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "206"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "name": "Marca",
                "value_id": "206"
              },
              {
                "name": "Modelo detalhado",
                "value_name": "SM-S901",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "id": "DETAILED_MODEL",
                "value_id": null,
                "values": [
                  {
                    "id": null,
                    "name": "SM-S901",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ]
              },
              {
                "value_name": "Adreno 730",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 4709228965570453,
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_name": "Outros"
              },
              {
                "id": "ITEM_CONDITION",
                "attribute_group_name": "Outros",
                "values": [
                  {
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "2230284"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 6808261514773724,
                "name": "Condição do item",
                "value_id": "2230284",
                "value_name": "Novo",
                "value_struct": null
              },
              {
                "value_id": "249991",
                "value_name": "Galaxy S",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "name": "Linha",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "LINE"
              },
              {
                "id": "MODEL",
                "name": "Modelo",
                "value_id": null,
                "value_name": "S22",
                "value_struct": null,
                "values": [
                  {
                    "name": "S22",
                    "struct": null,
                    "source": 6808261514773724,
                    "id": null
                  }
                ],
                "attribute_group_name": "Outros",
                "attribute_group_id": "OTHERS",
                "source": 6808261514773724
              },
              {
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ]
              },
              {
                "id": "WEIGHT",
                "name": "Peso",
                "value_struct": {"number": 167, "unit": "g"},
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "value_id": "2087871",
                "value_name": "167 g"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 35,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2701544962",
            "site_id": "MLB",
            "title": "Smartphone Galaxy S22+ 5g 128 Gb 8gb Ram Preto Samsung",
            "seller": {
              "id": 1297655,
              "permalink": "http://perfil.mercadolivre.com.br/R.S.+ORIGINAL",
              "registration_date": "2006-10-30T19:30:26.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "credits_profile", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0.0126,
                    "value": 3
                  },
                  "claims": {"period": "365 days", "rate": 0.0126, "value": 3},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0.0101,
                    "value": 2
                  },
                  "sales": {"period": "365 days", "completed": 197}
                },
                "transactions": {
                  "canceled": 40,
                  "period": "historic",
                  "total": 237,
                  "ratings": {
                    "negative": 0.08,
                    "neutral": 0.06,
                    "positive": 0.86
                  },
                  "completed": 197
                }
              }
            },
            "price": 4990,
            "prices": {
              "id": "MLB2701544962",
              "prices": [
                {
                  "id": "10",
                  "type": "standard",
                  "amount": 4990,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-12T17:15:34Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "3",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4690,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-01T18:38:29Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-07-06T22:18:09.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2701544962-smartphone-galaxy-s22-5g-128-gb-8gb-ram-preto-samsung-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_997418-MLB50543116459_072022-O.jpg",
            "thumbnail_id": "997418-MLB50543116459_072022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 499,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-PR",
              "state_name": "Paraná",
              "city_id": "TUxCQ0xPTmI2Njg1",
              "city_name": "Londrina"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-PR", "name": "Paraná"},
              "city": {"id": "TUxCQ0xPTmI2Njg1", "name": "Londrina"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "value_id": "206",
                "source": 1,
                "name": "Marca",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {"struct": null, "source": 1, "id": "206", "name": "Samsung"}
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_id": null,
                "value_name": "SM-S906",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1,
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_struct": null,
                "values": [
                  {"source": 1, "id": null, "name": "SM-S906", "struct": null}
                ]
              },
              {
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 3045741222775799,
                "name": "Condição do item",
                "value_name": "Novo",
                "values": [
                  {
                    "source": 3045741222775799,
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "attribute_group_id": "OTHERS",
                "value_struct": null,
                "values": [
                  {
                    "source": 1,
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "source": 1,
                "value_name": "S22+",
                "attribute_group_id": "OTHERS",
                "value_id": "11850079",
                "value_struct": null,
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "name": "Modelo"
              },
              {
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_name": "Outros",
                "name": "Modelo do processador",
                "value_id": "11850084",
                "source": 1,
                "id": "PROCESSOR_MODEL",
                "attribute_group_id": "OTHERS"
              },
              {
                "id": "WEIGHT",
                "value_name": "195 g",
                "value_struct": {"number": 195, "unit": "g"},
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 1183438784296846,
                "name": "Peso",
                "value_id": "1095137",
                "values": [
                  {
                    "source": 1183438784296846,
                    "id": "1095137",
                    "name": "195 g",
                    "struct": {"number": 195, "unit": "g"}
                  }
                ]
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 36,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2626492087",
            "site_id": "MLB",
            "title": "Celular Galaxy S22 Preto 128 Gb",
            "seller": {
              "id": 74943708,
              "permalink": "http://perfil.mercadolivre.com.br/FLAVIOMSANTANA",
              "registration_date": "2004-08-05T17:06:51.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "credits_profile", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": null,
                "metrics": {
                  "cancellations": {
                    "period": "60 months",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "60 months", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "60 months",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 months", "completed": 6}
                },
                "transactions": {
                  "canceled": 0,
                  "period": "historic",
                  "total": 6,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 6
                }
              }
            },
            "price": 4900,
            "prices": {
              "id": "MLB2626492087",
              "prices": [
                {
                  "id": "5",
                  "type": "standard",
                  "amount": 4900,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-05T22:07:17Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "3",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4900,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-04-28T20:32:12Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-23T20:37:48.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2626492087-celular-galaxy-s22-preto-128-gb-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_671086-MLB49798350470_042022-O.jpg",
            "thumbnail_id": "671086-MLB49798350470_042022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 490,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-DF",
              "state_name": "Distrito Federal",
              "city_id": "TUxCQ0JSQTU2M2Yy",
              "city_name": "Brasília"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-DF", "name": "Distrito Federal"},
              "city": {"id": "TUxCQ0JSQTU2M2Yy", "name": "Brasília"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "name": "Marca",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 1505
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 1505,
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "attribute_group_id": "OTHERS"
              },
              {
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "value_struct": null,
                "values": [
                  {
                    "source": 4709228965570453,
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453
              },
              {
                "source": 1505,
                "name": "Condição do item",
                "value_name": "Novo",
                "attribute_group_name": "Outros",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 1505
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_struct": null
              },
              {
                "value_id": "249991",
                "value_name": "Galaxy S",
                "source": 1505,
                "id": "LINE",
                "name": "Linha",
                "value_struct": null,
                "values": [
                  {
                    "source": 1505,
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "source": 1505,
                "id": "MODEL",
                "name": "Modelo",
                "value_id": "12063780",
                "value_name": "S22 Ultra Dual SIM (Snapdragon)",
                "value_struct": null,
                "values": [
                  {
                    "name": "S22 Ultra Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 1505,
                    "id": "12063780"
                  }
                ],
                "attribute_group_name": "Outros",
                "attribute_group_id": "OTHERS"
              },
              {
                "value_id": "11764992",
                "value_name": "Snapdragon 8 Gen 1",
                "value_struct": null,
                "id": "PROCESSOR_MODEL",
                "values": [
                  {
                    "id": "11764992",
                    "name": "Snapdragon 8 Gen 1",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "name": "Modelo do processador"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB19063252",
            "tags": [
              "extended_warranty_eligible",
              "poor_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 37,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2630221406",
            "site_id": "MLB",
            "title": "Samsung Galaxy S22 128gb Rosé Novo Garantia De 12 Meses",
            "seller": {
              "id": 167501700,
              "permalink": "http://perfil.mercadolivre.com.br/ANASZ+TECH",
              "registration_date": "2014-09-25T10:19:08.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "credits_profile",
                "mshops",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "365 days", "completed": 64}
                },
                "transactions": {
                  "canceled": 3,
                  "period": "historic",
                  "total": 67,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 64
                }
              }
            },
            "price": 4199,
            "prices": {
              "id": "MLB2630221406",
              "prices": [
                {
                  "id": "12",
                  "type": "standard",
                  "amount": 4199,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-12T21:42:15Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "11",
                  "type": "standard",
                  "amount": 3899,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-12T21:41:17Z",
                  "conditions": {
                    "context_restrictions": ["channel_mshops"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "3",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 3400,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-21T23:35:46Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-07-07T21:41:27.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2630221406-samsung-galaxy-s22-128gb-rose-novo-garantia-de-12-meses-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_686664-MLB49836534834_052022-O.jpg",
            "thumbnail_id": "686664-MLB49836534834_052022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 419.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BTb2NvcnJv",
              "city_name": "Socorro"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BTb2NvcnJv", "name": "Socorro"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "name": "Marca",
                "attribute_group_name": "Outros",
                "source": 7092,
                "attribute_group_id": "OTHERS",
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {
                    "name": "Samsung",
                    "struct": null,
                    "source": 7092,
                    "id": "206"
                  }
                ]
              },
              {
                "source": 1,
                "name": "Modelo detalhado",
                "value_id": null,
                "value_name": "SM-S901",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "id": "DETAILED_MODEL",
                "values": [
                  {"id": null, "name": "SM-S901", "struct": null, "source": 1}
                ],
                "attribute_group_name": "Outros"
              },
              {
                "name": "Modelo de GPU",
                "value_name": "Adreno 730",
                "value_struct": null,
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "id": "GPU_MODEL",
                "value_id": "11732851",
                "attribute_group_id": "OTHERS"
              },
              {
                "attribute_group_name": "Outros",
                "source": 7092,
                "name": "Condição do item",
                "value_name": "Novo",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 7092
                  }
                ]
              },
              {
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "value_id": "249991",
                "value_struct": null,
                "value_name": "Galaxy S",
                "source": 7092,
                "id": "LINE",
                "name": "Linha"
              },
              {
                "name": "Modelo",
                "value_id": "12062075",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7092,
                "id": "MODEL",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "value_struct": null,
                "values": [
                  {
                    "source": 7092,
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)",
                    "struct": null
                  }
                ]
              },
              {
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": "11764992",
                "value_struct": null,
                "value_name": "Snapdragon 8 Gen 1",
                "values": [
                  {
                    "id": "11764992",
                    "name": "Snapdragon 8 Gen 1",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453
              },
              {
                "value_name": "167 g",
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "WEIGHT",
                "name": "Peso",
                "value_id": "2087871",
                "value_struct": {"number": 167, "unit": "g"},
                "attribute_group_name": "Outros",
                "source": 4709228965570453
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "standard_price_by_channel",
              "catalog_listing_eligible",
              "extended_warranty_eligible",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 38,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2695707309",
            "site_id": "MLB",
            "title":
                "Smartphone Samsung Galaxy S22+ 5g 256gb 8gb Ram Tela 6,6  Câ",
            "seller": {
              "id": 821738921,
              "permalink": "http://perfil.mercadolivre.com.br/IBYTE.",
              "registration_date": "2021-09-09T14:55:54.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "brand",
                "large_seller",
                "credits_profile",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": "gold",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.0174,
                    "value": 4
                  },
                  "claims": {"period": "60 days", "rate": 0.0174, "value": 4},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 1
                  },
                  "sales": {"period": "60 days", "completed": 217}
                },
                "transactions": {
                  "canceled": 209,
                  "period": "historic",
                  "total": 750,
                  "ratings": {
                    "negative": 0.43,
                    "neutral": 0.17,
                    "positive": 0.4
                  },
                  "completed": 541
                }
              }
            },
            "price": 8931.3,
            "prices": {
              "id": "MLB2695707309",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 8931.3,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-28T01:32:21Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-22T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2695707309-smartphone-samsung-galaxy-s22-5g-256gb-8gb-ram-tela-66-c-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_796217-MLB50488331311_062022-O.jpg",
            "thumbnail_id": "796217-MLB50488331311_062022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 893.13,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-CE",
              "state_name": "Ceará",
              "city_id": "TUxCQ0ZPUjM5MmFh",
              "city_name": "Fortaleza"
            },
            "shipping": {
              "free_shipping": false,
              "mode": "me1",
              "tags": ["lost_me2_by_dimensions"],
              "logistic_type": "default",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-CE", "name": "Ceará"},
              "city": {"id": "TUxCQ0ZPUjM5MmFh", "name": "Fortaleza"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_name": "Samsung",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "values": [
                  {
                    "name": "Samsung",
                    "struct": null,
                    "source": 443929435104005,
                    "id": "206"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 443929435104005
              },
              {
                "id": "DETAILED_MODEL",
                "value_id": null,
                "values": [
                  {"name": "SM-S906", "struct": null, "source": 1, "id": null}
                ],
                "attribute_group_id": "OTHERS",
                "name": "Modelo detalhado",
                "value_name": "SM-S906",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 1
              },
              {
                "value_name": "Novo",
                "value_struct": null,
                "values": [
                  {"name": "Novo", "struct": null, "source": 1, "id": "2230284"}
                ],
                "source": 1,
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "attribute_group_name": "Outros",
                "name": "Condição do item",
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Linha",
                "value_name": "Galaxy S",
                "attribute_group_name": "Outros",
                "attribute_group_id": "OTHERS",
                "source": 1,
                "id": "LINE",
                "value_id": "249991",
                "value_struct": null,
                "values": [
                  {
                    "source": 1,
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null
                  }
                ]
              },
              {
                "name": "Modelo",
                "value_name": "Tela 6",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 443929435104005,
                "id": "MODEL",
                "value_id": null,
                "values": [
                  {
                    "id": null,
                    "name": "Tela 6\"",
                    "struct": null,
                    "source": 443929435104005
                  }
                ],
                "attribute_group_name": "Outros"
              },
              {
                "source": 1,
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 1
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": "11850084"
              },
              {
                "value_name": "195 g",
                "value_struct": {"number": 195, "unit": "g"},
                "values": [
                  {
                    "id": "1095137",
                    "name": "195 g",
                    "struct": {"number": 195, "unit": "g"},
                    "source": 1183438784296846
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 1183438784296846,
                "id": "WEIGHT",
                "name": "Peso",
                "value_id": "1095137",
                "attribute_group_id": "OTHERS"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": 3979,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 39,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2647032139",
            "site_id": "MLB",
            "title": "Celular S22 Plus Novo Na Caixa Lacrado Sem Uso",
            "seller": {
              "id": 271056695,
              "permalink": "http://perfil.mercadolivre.com.br/SALA1580773",
              "registration_date": "2017-08-30T15:42:58.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "credits_priority_2",
                "credits_profile",
                "mshops",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 1
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "365 days", "completed": 25}
                },
                "transactions": {
                  "canceled": 2,
                  "period": "historic",
                  "total": 27,
                  "ratings": {"negative": 0.38, "neutral": 0, "positive": 0.62},
                  "completed": 25
                }
              }
            },
            "price": 5229,
            "prices": {
              "id": "MLB2647032139",
              "prices": [
                {
                  "id": "38",
                  "type": "standard",
                  "amount": 5229,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-11T15:15:41Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "35",
                  "type": "standard",
                  "amount": 4800,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-02T21:31:55Z",
                  "conditions": {
                    "context_restrictions": ["channel_mshops"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "36",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4600,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-03T04:43:19Z"
                },
                {
                  "id": "37",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-03T04:43:19Z",
                    "end_time": "2022-07-10T04:43:19Z",
                    "eligible": true
                  },
                  "amount": 4600,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-03T04:43:19Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-05-14T01:40:37.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2647032139-celular-s22-plus-novo-na-caixa-lacrado-sem-uso-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_806954-MLB50530920723_062022-O.jpg",
            "thumbnail_id": "806954-MLB50530920723_062022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 522.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-MS",
              "state_name": "Mato Grosso do Sul",
              "city_id": "TUxCQ05PVjZmOGMz",
              "city_name": "Novo Horizonte do Sul"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-MS", "name": "Mato Grosso do Sul"},
              "city": {
                "id": "TUxCQ05PVjZmOGMz",
                "name": "Novo Horizonte do Sul"
              },
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "attribute_group_name": "Outros",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {
                    "source": 7092,
                    "id": "206",
                    "name": "Samsung",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 7092
              },
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7092,
                "name": "Condição do item",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "value_name": "Novo",
                "value_struct": null,
                "id": "ITEM_CONDITION",
                "value_id": "2230284"
              },
              {
                "id": "LINE",
                "value_name": "Galaxy S",
                "attribute_group_name": "Outros",
                "source": 7092,
                "name": "Linha",
                "value_id": "249991",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Modelo",
                "value_name": "S22+",
                "value_struct": null,
                "values": [
                  {"id": null, "name": "S22+", "struct": null, "source": 7092}
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "source": 7092,
                "value_id": null
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": null,
            "tags": [
              "extended_warranty_eligible",
              "poor_quality_picture",
              "poor_quality_thumbnail",
              "standard_price_by_channel",
              "immediate_payment",
              "cart_eligible",
              "shipping_guaranteed"
            ],
            "order_backend": 40,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2210992142",
            "site_id": "MLB",
            "title":
                "Smartphone Galaxy S22 5g 128gb, 8gb Ram, Tela Infinita 6.1''",
            "seller": {
              "id": 83489253,
              "permalink": "http://perfil.mercadolivre.com.br/JEFFERBRITO",
              "registration_date": "2009-08-12T20:31:23.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "credits_profile",
                "mshops",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "4_light_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0.1212,
                    "value": 8
                  },
                  "sales": {"period": "365 days", "completed": 66}
                },
                "transactions": {
                  "canceled": 7,
                  "period": "historic",
                  "total": 73,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 66
                }
              }
            },
            "price": 4426,
            "prices": {
              "id": "MLB2210992142",
              "prices": [
                {
                  "id": "686",
                  "type": "standard",
                  "amount": 4426,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-13T14:27:30Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "9",
                  "type": "promotion",
                  "amount": 4844.05,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328915-MLB2210992142",
                    "promotion_type": "custom"
                  }
                },
                {
                  "id": "10",
                  "type": "promotion",
                  "amount": 4589.1,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_3"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328915-MLB2210992142",
                    "promotion_type": "custom"
                  }
                },
                {
                  "id": "11",
                  "type": "promotion",
                  "amount": 4589.1,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_4"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328915-MLB2210992142",
                    "promotion_type": "custom"
                  }
                },
                {
                  "id": "12",
                  "type": "promotion",
                  "amount": 4589.1,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_5"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328915-MLB2210992142",
                    "promotion_type": "custom"
                  }
                },
                {
                  "id": "13",
                  "type": "promotion",
                  "amount": 4589.1,
                  "regular_amount": 5099,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-21T15:08:30Z",
                  "conditions": {
                    "context_restrictions": ["buyer_loyalty_6"],
                    "start_time": "2022-05-21T03:00:00Z",
                    "end_time": "2022-05-27T02:59:59Z",
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {
                    "promotion_id": "40328915-MLB2210992142",
                    "promotion_type": "custom"
                  }
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "687",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4426,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-13T14:29:34Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-03-14T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2210992142-smartphone-galaxy-s22-5g-128gb-8gb-ram-tela-infinita-61-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_850442-MLB49406816110_032022-O.jpg",
            "thumbnail_id": "850442-MLB49406816110_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 442.6,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-RJ",
              "state_name": "Rio de Janeiro",
              "city_id": "BR-RJ-01",
              "city_name": "Rio de Janeiro"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["self_service_in", "mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-RJ", "name": "Rio de Janeiro"},
              "city": {"id": "BR-RJ-01", "name": "Rio de Janeiro"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "source": 3045741222775799,
                "id": "BRAND",
                "value_name": "Samsung",
                "values": [
                  {
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "206",
                    "name": "Samsung"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Marca",
                "value_id": "206",
                "value_struct": null
              },
              {
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "id": "DETAILED_MODEL",
                "value_id": null,
                "value_name": "SM-S901",
                "attribute_group_id": "OTHERS",
                "name": "Modelo detalhado",
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "SM-S901",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ]
              },
              {
                "id": "GPU_MODEL",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "value_struct": null,
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "name": "Modelo de GPU",
                "attribute_group_id": "OTHERS"
              },
              {
                "values": [
                  {
                    "struct": null,
                    "source": 3045741222775799,
                    "id": "2230284",
                    "name": "Novo"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "value_struct": null,
                "name": "Condição do item",
                "value_name": "Novo",
                "source": 3045741222775799
              },
              {
                "name": "Linha",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "source": 3045741222775799,
                "id": "LINE",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_name": "S22",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "name": "Modelo",
                "value_id": null,
                "values": [
                  {
                    "id": null,
                    "name": "S22",
                    "struct": null,
                    "source": 3045741222775799
                  }
                ],
                "source": 3045741222775799
              },
              {
                "id": "PROCESSOR_MODEL",
                "value_id": "11850084",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 7567447101417086,
                "name": "Modelo do processador",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086,
                    "id": "11850084"
                  }
                ],
                "attribute_group_name": "Outros"
              },
              {
                "value_name": "167 g",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "values": [
                  {
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 4709228965570453,
                    "id": "2087871"
                  }
                ],
                "id": "WEIGHT",
                "name": "Peso",
                "value_id": "2087871",
                "value_struct": {"number": 167, "unit": "g"}
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "poor_quality_picture",
              "poor_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 41,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2695457464",
            "site_id": "MLB",
            "title": "Samsung Galaxy S22+ 5g 128gb Rosé",
            "seller": {
              "id": 167501700,
              "permalink": "http://perfil.mercadolivre.com.br/ANASZ+TECH",
              "registration_date": "2014-09-25T10:19:08.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "credits_profile",
                "mshops",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "365 days", "completed": 64}
                },
                "transactions": {
                  "canceled": 3,
                  "period": "historic",
                  "total": 67,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 64
                }
              }
            },
            "price": 4899,
            "prices": {
              "id": "MLB2695457464",
              "prices": [
                {
                  "id": "9",
                  "type": "standard",
                  "amount": 4899,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-07T11:37:49Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "7",
                  "type": "was",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": "2022-07-01T05:32:40Z",
                    "end_time": "2022-07-08T05:32:40Z",
                    "eligible": true
                  },
                  "amount": 4799,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-05T01:18:37Z"
                },
                {
                  "id": "8",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4799,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-05T01:18:37Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-07-02T11:37:59.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2695457464-samsung-galaxy-s22-5g-128gb-rose-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_620961-MLB50587281420_072022-O.jpg",
            "thumbnail_id": "620961-MLB50587281420_072022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 489.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "QlItU1BTb2NvcnJv",
              "city_name": "Socorro"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "QlItU1BTb2NvcnJv", "name": "Socorro"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "attribute_group_id": "OTHERS",
                "id": "BRAND",
                "values": [
                  {
                    "source": 7092,
                    "id": "206",
                    "name": "Samsung",
                    "struct": null
                  }
                ],
                "value_name": "Samsung",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 7092,
                "name": "Marca",
                "value_id": "206"
              },
              {
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_id": "2230284",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 7092,
                    "id": "2230284",
                    "name": "Novo"
                  }
                ],
                "source": 7092,
                "value_name": "Novo",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "LINE",
                "value_id": "249991",
                "source": 7092,
                "name": "Linha",
                "attribute_group_id": "OTHERS"
              },
              {
                "attribute_group_id": "OTHERS",
                "id": "MODEL",
                "name": "Modelo",
                "value_name": "S22+",
                "attribute_group_name": "Outros",
                "source": 7092,
                "value_id": "11850079",
                "value_struct": null,
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 7092
                  }
                ]
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "poor_quality_thumbnail",
              "extended_warranty_eligible",
              "poor_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 42,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2634484230",
            "site_id": "MLB",
            "title": "Celular Samsung Galaxy S22 256gb 8gb Lacrado Novo",
            "seller": {
              "id": 1114683955,
              "permalink":
                  "http://perfil.mercadolivre.com.br/COSTAGRAZIELA20220428194028",
              "registration_date": "2022-04-28T19:40:03.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": null,
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "365 days", "completed": 1}
                },
                "transactions": {
                  "canceled": 0,
                  "period": "historic",
                  "total": 1,
                  "ratings": {"negative": 0, "neutral": 1, "positive": 0},
                  "completed": 1
                }
              }
            },
            "price": 4790,
            "prices": {
              "id": "MLB2634484230",
              "prices": [
                {
                  "id": "2",
                  "type": "standard",
                  "amount": 4790,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-15T11:55:36Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "3",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 4790,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-06-15T11:55:37Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-22T20:55:09.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2634484230-celular-samsung-galaxy-s22-256gb-8gb-lacrado-novo-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_920072-MLB49819184770_042022-O.jpg",
            "thumbnail_id": "920072-MLB49819184770_042022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 479,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-RJ",
              "state_name": "Rio de Janeiro",
              "city_id": "BR-RJ-09",
              "city_name": "Petrópolis"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-RJ", "name": "Rio de Janeiro"},
              "city": {"id": "BR-RJ-09", "name": "Petrópolis"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "value_id": "206",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Marca",
                "value_name": "Samsung",
                "values": [
                  {
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "206"
                  }
                ],
                "source": 6808261514773724
              },
              {
                "value_id": "2230284",
                "value_struct": null,
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 6808261514773724,
                "id": "ITEM_CONDITION",
                "value_name": "Novo",
                "attribute_group_name": "Outros",
                "name": "Condição do item"
              },
              {
                "value_struct": null,
                "values": [
                  {
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "249991"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_name": "Galaxy S"
              },
              {
                "name": "Modelo",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "value_id": "12062075",
                "value_struct": null,
                "values": [
                  {
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "source": 6808261514773724
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": null,
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 43,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2217221256",
            "site_id": "MLB",
            "title": " Celular Galaxy S22 Ultra 5g Preto 256gb - Lançamento!!!",
            "seller": {
              "id": 162256411,
              "permalink": "http://perfil.mercadolivre.com.br/SIFE9264561",
              "registration_date": "2014-07-09T20:24:08.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "credits_profile", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": null,
                "metrics": {
                  "cancellations": {
                    "period": "60 months",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "60 months", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "60 months",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 months", "completed": 0}
                },
                "transactions": {
                  "canceled": 0,
                  "period": "historic",
                  "total": 0,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 0},
                  "completed": 0
                }
              }
            },
            "price": 9599,
            "prices": {
              "id": "MLB2217221256",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 9599,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-03-24T22:50:05Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-03-19T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2217221256-celular-galaxy-s22-ultra-5g-preto-256gb-lancamento-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_672748-MLB49462119062_032022-O.jpg",
            "thumbnail_id": "672748-MLB49462119062_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 959.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-AL",
              "state_name": "Alagoas",
              "city_id": "TUxCQ01BQzFiOTU0",
              "city_name": "Maceió"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-AL", "name": "Alagoas"},
              "city": {"id": "TUxCQ01BQzFiOTU0", "name": "Maceió"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "name": "Marca",
                "value_id": "206",
                "attribute_group_id": "OTHERS",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "BRAND",
                "value_name": "Samsung",
                "value_struct": null
              },
              {
                "values": [
                  {
                    "id": null,
                    "name": "SM-S908",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "source": 3942444344910321,
                "id": "DETAILED_MODEL",
                "value_name": "SM-S908",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Modelo detalhado",
                "value_id": null
              },
              {
                "id": "GPU_MODEL",
                "source": 4709228965570453,
                "attribute_group_name": "Outros",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "value_struct": null,
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Condição do item",
                "value_id": "2230284",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "ITEM_CONDITION",
                "value_name": "Novo",
                "value_struct": null,
                "source": 6808261514773724
              },
              {
                "source": 6808261514773724,
                "name": "Linha",
                "value_id": "249991",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "LINE",
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ]
              },
              {
                "attribute_group_name": "Outros",
                "value_id": null,
                "value_name": "S22 Ultra",
                "values": [
                  {
                    "id": null,
                    "name": "S22 Ultra",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "MODEL",
                "name": "Modelo",
                "value_struct": null,
                "source": 6808261514773724
              },
              {
                "id": "PROCESSOR_MODEL",
                "value_id": "11850084",
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "attribute_group_name": "Outros",
                "name": "Modelo do processador",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)"
                  }
                ]
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967699",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 44,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2212747250",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22+ 256 Verde (brindes Galaxy Watch 4+fonte)",
            "seller": {
              "id": 50504826,
              "permalink": "http://perfil.mercadolivre.com.br/RAFAKIRSTEN",
              "registration_date": "2004-03-23T09:34:55.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": [
                "normal",
                "credits_profile",
                "mshops",
                "messages_as_seller"
              ],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": null,
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "365 days", "completed": 1}
                },
                "transactions": {
                  "canceled": 0,
                  "period": "historic",
                  "total": 1,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 1
                }
              }
            },
            "price": 6499,
            "prices": {
              "id": "MLB2212747250",
              "prices": [
                {
                  "id": "4",
                  "type": "standard",
                  "amount": 6499,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-18T15:00:52Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "3",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-04-18T15:00:08Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-03-16T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2212747250-samsung-galaxy-s22-256-verde-brindes-galaxy-watch-4fonte-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_600544-MLB49693573983_042022-O.jpg",
            "thumbnail_id": "600544-MLB49693573983_042022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 649.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-PR",
              "state_name": "Paraná",
              "city_id": "TUxCQ0NVUjYyZmY1",
              "city_name": "Curitiba"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-PR", "name": "Paraná"},
              "city": {"id": "TUxCQ0NVUjYyZmY1", "name": "Curitiba"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_id": "206",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "BRAND",
                "name": "Marca",
                "value_name": "Samsung"
              },
              {
                "value_name": "SM-S906",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_id": null,
                "values": [
                  {
                    "struct": null,
                    "source": 7567447101417086,
                    "id": null,
                    "name": "SM-S906"
                  }
                ],
                "source": 7567447101417086
              },
              {
                "value_struct": null,
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "value_name": "Adreno 730",
                "values": [
                  {
                    "source": 6808261514773724,
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "GPU_MODEL"
              },
              {
                "value_name": "Novo",
                "attribute_group_name": "Outros",
                "name": "Condição do item",
                "value_id": "2230284",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 6808261514773724,
                "id": "ITEM_CONDITION",
                "value_struct": null
              },
              {
                "id": "LINE",
                "name": "Linha",
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "value_id": "249991",
                "source": 6808261514773724
              },
              {
                "id": "MODEL",
                "name": "Modelo",
                "value_name": "S22+",
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "value_id": "11850079",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 6808261514773724
              },
              {
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_name": "Outros",
                "name": "Modelo do processador",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "source": 3942444344910321,
                "id": "PROCESSOR_MODEL",
                "value_id": "11850084",
                "attribute_group_id": "OTHERS"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 45,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2213784619",
            "site_id": "MLB",
            "title":
                "Smartphone Samsung Galaxy S22+ 5g 128gb 8gb Preto Lacrado",
            "seller": {
              "id": 199716327,
              "permalink": "http://perfil.mercadolivre.com.br/TGR555",
              "registration_date": "2018-05-23T23:01:12.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": null,
                "metrics": {
                  "cancellations": {
                    "period": "60 months",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "60 months", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "60 months",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 months", "completed": 0}
                },
                "transactions": {
                  "canceled": 0,
                  "period": "historic",
                  "total": 0,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 0},
                  "completed": 0
                }
              }
            },
            "price": 5599,
            "prices": {
              "id": "MLB2213784619",
              "prices": [
                {
                  "id": "5",
                  "type": "standard",
                  "amount": 5599,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-04-10T01:18:36Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "6",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5000,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-04-10T01:18:36Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-03-29T20:30:26.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2213784619-smartphone-samsung-galaxy-s22-5g-128gb-8gb-preto-lacrado-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_978631-MLB49432869205_032022-O.jpg",
            "thumbnail_id": "978631-MLB49432869205_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 559.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-09",
              "city_name": "Franca"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-09", "name": "Franca"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "value_name": "Samsung",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 6808261514773724
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "BRAND",
                "name": "Marca",
                "value_id": "206",
                "value_struct": null
              },
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "name": "Modelo detalhado",
                "value_id": null,
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "SM-S901",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "id": "DETAILED_MODEL",
                "value_name": "SM-S901"
              },
              {
                "value_name": "Adreno 730",
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "values": [
                  {
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453,
                    "id": "11732851"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "value_id": "11732851",
                "value_struct": null
              },
              {
                "value_name": "Novo",
                "values": [
                  {
                    "name": "Novo",
                    "struct": null,
                    "source": 6808261514773724,
                    "id": "2230284"
                  }
                ],
                "value_id": "2230284",
                "name": "Condição do item",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 6808261514773724,
                "id": "ITEM_CONDITION"
              },
              {
                "name": "Linha",
                "value_name": "Galaxy S",
                "attribute_group_id": "OTHERS",
                "id": "LINE",
                "value_id": "249991",
                "value_struct": null,
                "values": [
                  {
                    "source": 6808261514773724,
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 6808261514773724
              },
              {
                "value_name": "S22",
                "values": [
                  {
                    "struct": null,
                    "source": 3942444344910321,
                    "id": null,
                    "name": "S22"
                  }
                ],
                "id": "MODEL",
                "name": "Modelo",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "value_id": null,
                "value_struct": null
              },
              {
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 3942444344910321,
                "attribute_group_name": "Outros",
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_id": "11850084",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ]
              },
              {
                "name": "Peso",
                "value_struct": {"number": 167, "unit": "g"},
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 4709228965570453
                  }
                ],
                "source": 4709228965570453,
                "id": "WEIGHT",
                "value_id": "2087871",
                "value_name": "167 g",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 46,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2179758729",
            "site_id": "MLB",
            "title": "Samsung Galaxy S22+ 256gb 5g Tela 6.6'' Dual Chip Plus",
            "seller": {
              "id": 8882526,
              "permalink": "http://perfil.mercadolivre.com.br/MADBOB",
              "registration_date": "2002-04-08T00:00:00.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "credits_profile", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": null,
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 1
                  },
                  "sales": {"period": "365 days", "completed": 3}
                },
                "transactions": {
                  "canceled": 0,
                  "period": "historic",
                  "total": 3,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 3
                }
              }
            },
            "price": 6399,
            "prices": {
              "id": "MLB2179758729",
              "prices": [
                {
                  "id": "17",
                  "type": "standard",
                  "amount": 6399,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-05-24T14:08:08Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "12",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5999,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-03-08T15:28:02Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-03-20T13:08:13.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2179758729-samsung-galaxy-s22-256gb-5g-tela-66-dual-chip-plus-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_897076-MLB49128534303_022022-O.jpg",
            "thumbnail_id": "897076-MLB49128534303_022022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 639.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-DF",
              "state_name": "Distrito Federal",
              "city_id": "TUxCQ0JSQTU2M2Yy",
              "city_name": "Brasília"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-DF", "name": "Distrito Federal"},
              "city": {"id": "TUxCQ0JSQTU2M2Yy", "name": "Brasília"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "name": "Marca",
                "attribute_group_id": "OTHERS",
                "value_id": "206",
                "value_name": "Samsung",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 7092,
                    "id": "206",
                    "name": "Samsung"
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 7092
              },
              {
                "attribute_group_id": "OTHERS",
                "value_id": null,
                "value_struct": null,
                "values": [
                  {
                    "id": null,
                    "name": "SM-S906",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 3942444344910321,
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_name": "SM-S906"
              },
              {
                "id": "ITEM_CONDITION",
                "value_id": "2230284",
                "source": 7092,
                "name": "Condição do item",
                "value_name": "Novo",
                "value_struct": null,
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 7092
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 3942444344910321
                  }
                ],
                "value_name": "Galaxy S",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 3942444344910321
              },
              {
                "name": "Modelo",
                "value_struct": null,
                "source": 3942444344910321,
                "values": [
                  {
                    "name": "S22+",
                    "struct": null,
                    "source": 3942444344910321,
                    "id": "11850079"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "MODEL",
                "value_id": "11850079",
                "value_name": "S22+"
              },
              {
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "values": [
                  {
                    "source": 3942444344910321,
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null
                  }
                ],
                "source": 3942444344910321,
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "id": "WEIGHT",
                "name": "Peso",
                "value_name": "167 g",
                "value_struct": {"number": 167, "unit": "g"},
                "source": 1183438784296846,
                "value_id": "2087871",
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 1183438784296846
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 47,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2698530815",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 Dual Sim 128gb 8gb Ram Preto + Brindes!",
            "seller": {
              "id": 62958145,
              "permalink": "http://perfil.mercadolivre.com.br/BELAVIDA741",
              "registration_date": "2009-01-09T08:37:27.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "credits_profile", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": null,
                "metrics": {
                  "cancellations": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "claims": {"period": "365 days", "rate": 0, "value": 2},
                  "delayed_handling_time": {
                    "period": "365 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "365 days", "completed": 6}
                },
                "transactions": {
                  "canceled": 2,
                  "period": "historic",
                  "total": 8,
                  "ratings": {"negative": 0, "neutral": 0, "positive": 1},
                  "completed": 6
                }
              }
            },
            "price": 4250,
            "prices": {
              "id": "MLB2698530815",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 4250,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-29T22:26:55Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-24T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2698530815-samsung-galaxy-s22-dual-sim-128gb-8gb-ram-preto-brindes-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_607199-MLA49387650897_032022-O.jpg",
            "thumbnail_id": "607199-MLA49387650897_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 425,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-DF",
              "state_name": "Distrito Federal",
              "city_id": "TUxCQ0JSQTU2M2Yy",
              "city_name": "Brasília"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-DF", "name": "Distrito Federal"},
              "city": {"id": "TUxCQ0JSQTU2M2Yy", "name": "Brasília"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "attribute_group_id": "OTHERS",
                "source": 2860837171021627,
                "value_name": "Samsung",
                "name": "Marca",
                "value_id": "206",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "BRAND"
              },
              {
                "value_id": null,
                "value_name": "SM-S901",
                "source": 7567447101417086,
                "values": [
                  {
                    "struct": null,
                    "source": 7567447101417086,
                    "id": null,
                    "name": "SM-S901"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "DETAILED_MODEL",
                "name": "Modelo detalhado",
                "value_struct": null
              },
              {
                "value_name": "Adreno 730",
                "value_struct": null,
                "values": [
                  {
                    "source": 4709228965570453,
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "GPU_MODEL",
                "name": "Modelo de GPU",
                "value_id": "11732851",
                "source": 4709228965570453
              },
              {
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "value_id": "2230284",
                "value_name": "Novo",
                "attribute_group_name": "Outros",
                "value_struct": null,
                "values": [
                  {
                    "source": 2860837171021627,
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 2860837171021627
              },
              {
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 2860837171021627,
                "name": "Linha",
                "value_id": "249991",
                "id": "LINE"
              },
              {
                "id": "MODEL",
                "name": "Modelo",
                "value_struct": null,
                "source": 2860837171021627,
                "value_id": "12062075",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "values": [
                  {
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_id": "11850084",
                "value_struct": null,
                "attribute_group_name": "Outros",
                "source": 7567447101417086,
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "values": [
                  {
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "name": "Peso",
                "value_id": "2087871",
                "attribute_group_name": "Outros",
                "values": [
                  {
                    "name": "167 g",
                    "struct": {"unit": "g", "number": 167},
                    "source": 1183438784296846,
                    "id": "2087871"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "source": 1183438784296846,
                "id": "WEIGHT",
                "value_name": "167 g",
                "value_struct": {"number": 167, "unit": "g"}
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 48,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2626370674",
            "site_id": "MLB",
            "title": "Celular Samsung Galaxy S22+ 256gb Ram 8 Gb 5g Tela 6.6",
            "seller": {
              "id": 220712533,
              "permalink": "http://perfil.mercadolivre.com.br/DAPHIE+STORE",
              "registration_date": "2016-07-10T18:29:29.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "eshop", "mshops", "messages_as_seller"],
              "eshop": {
                "seller": 220712533,
                "eshop_rubro": null,
                "eshop_id": 418377,
                "nick_name": "DAPHIE STORE",
                "site_id": "MLB",
                "eshop_logo_url":
                    "http://http2.mlstatic.com/eshops-logo/220712533vc66159.png",
                "eshop_status_id": 1,
                "eshop_experience": 0,
                "eshop_locations": []
              },
              "seller_reputation": {
                "power_seller_status": "platinum",
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {
                    "period": "60 days",
                    "rate": 0.0094,
                    "value": 13
                  },
                  "claims": {"period": "60 days", "rate": 0.0152, "value": 21},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0.0226,
                    "value": 29
                  },
                  "sales": {"period": "60 days", "completed": 1162}
                },
                "transactions": {
                  "canceled": 989,
                  "period": "historic",
                  "total": 6029,
                  "ratings": {
                    "negative": 0.06,
                    "neutral": 0.02,
                    "positive": 0.92
                  },
                  "completed": 5040
                }
              }
            },
            "price": 6719,
            "prices": {
              "id": "MLB2626370674",
              "prices": [
                {
                  "id": "16",
                  "type": "standard",
                  "amount": 6719,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-13T18:46:13Z",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                },
                {
                  "id": "17",
                  "type": "standard",
                  "amount": 6248.6,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-07-13T18:54:12Z",
                  "conditions": {
                    "context_restrictions": ["channel_mshops"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [
                {
                  "id": "14",
                  "type": "min_standard",
                  "conditions": {
                    "context_restrictions": ["channel_marketplace"],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "amount": 5858,
                  "currency_id": "BRL",
                  "exchange_rate_context": "DEFAULT",
                  "tags": [],
                  "last_updated": "2022-07-08T19:41:29Z"
                }
              ],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-04-23T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2626370674-celular-samsung-galaxy-s22-256gb-ram-8-gb-5g-tela-66-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_668120-MLA49303776830_032022-O.jpg",
            "thumbnail_id": "668120-MLA49303776830_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 671.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-SP",
              "state_name": "São Paulo",
              "city_id": "BR-SP-39",
              "city_name": "São Bernardo do Campo"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["self_service_in", "mandatory_free_shipping"],
              "logistic_type": "cross_docking",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-SP", "name": "São Paulo"},
              "city": {"id": "BR-SP-39", "name": "São Bernardo do Campo"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "id": "BRAND",
                "name": "Marca",
                "value_name": "Samsung",
                "source": 81068639424647,
                "value_id": "206",
                "value_struct": null,
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 81068639424647
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "source": 7567447101417086,
                "name": "Modelo detalhado",
                "value_id": null,
                "value_name": "SM-S906",
                "values": [
                  {
                    "struct": null,
                    "source": 7567447101417086,
                    "id": null,
                    "name": "SM-S906"
                  }
                ],
                "attribute_group_name": "Outros",
                "id": "DETAILED_MODEL"
              },
              {
                "attribute_group_name": "Outros",
                "name": "Condição do item",
                "value_id": "2230284",
                "value_struct": null,
                "attribute_group_id": "OTHERS",
                "id": "ITEM_CONDITION",
                "value_name": "Novo",
                "values": [
                  {
                    "struct": null,
                    "source": 81068639424647,
                    "id": "2230284",
                    "name": "Novo"
                  }
                ],
                "source": 81068639424647
              },
              {
                "name": "Linha",
                "value_name": "Galaxy S",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 81068639424647,
                "id": "LINE",
                "value_id": "249991",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 81068639424647
                  }
                ]
              },
              {
                "source": 81068639424647,
                "id": "MODEL",
                "value_id": "11850079",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "name": "Modelo",
                "value_name": "S22+",
                "value_struct": null,
                "values": [
                  {
                    "id": "11850079",
                    "name": "S22+",
                    "struct": null,
                    "source": 81068639424647
                  }
                ]
              },
              {
                "value_id": "11850084",
                "value_struct": null,
                "values": [
                  {
                    "struct": null,
                    "source": 7567447101417086,
                    "id": "11850084",
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)"
                  }
                ],
                "id": "PROCESSOR_MODEL",
                "name": "Modelo do processador",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 7567447101417086
              },
              {
                "value_name": "168 g",
                "values": [
                  {
                    "id": "6793640",
                    "name": "168 g",
                    "struct": {"unit": "g", "number": 168},
                    "source": 1183438784296846
                  }
                ],
                "id": "WEIGHT",
                "name": "Peso",
                "value_id": "6793640",
                "source": 1183438784296846,
                "value_struct": {"number": 168, "unit": "g"},
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967700",
            "tags": [
              "standard_price_by_channel",
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 49,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          },
          {
            "id": "MLB2695559210",
            "site_id": "MLB",
            "title":
                "Samsung Galaxy S22 Dual Sim 128 Gb Phantom Black 8 Gb Ram",
            "seller": {
              "id": 139544910,
              "permalink": "http://perfil.mercadolivre.com.br/MD+ELETRONICS",
              "registration_date": "2013-06-01T11:54:10.000-04:00",
              "car_dealer": false,
              "real_estate_agency": false,
              "tags": ["normal", "credits_profile", "messages_as_seller"],
              "seller_reputation": {
                "power_seller_status": null,
                "level_id": "5_green",
                "metrics": {
                  "cancellations": {"period": "60 days", "rate": 0, "value": 0},
                  "claims": {"period": "60 days", "rate": 0, "value": 0},
                  "delayed_handling_time": {
                    "period": "60 days",
                    "rate": 0,
                    "value": 0
                  },
                  "sales": {"period": "60 days", "completed": 61}
                },
                "transactions": {
                  "canceled": 6,
                  "period": "historic",
                  "total": 126,
                  "ratings": {
                    "negative": 0.01,
                    "neutral": 0.01,
                    "positive": 0.98
                  },
                  "completed": 120
                }
              }
            },
            "price": 4499,
            "prices": {
              "id": "MLB2695559210",
              "prices": [
                {
                  "id": "1",
                  "type": "standard",
                  "amount": 4499,
                  "regular_amount": null,
                  "currency_id": "BRL",
                  "last_updated": "2022-06-27T21:09:19Z",
                  "conditions": {
                    "context_restrictions": [],
                    "start_time": null,
                    "end_time": null,
                    "eligible": true
                  },
                  "exchange_rate_context": "DEFAULT",
                  "metadata": {}
                }
              ],
              "presentation": {"display_currency": "BRL"},
              "payment_method_prices": [],
              "reference_prices": [],
              "purchase_discounts": []
            },
            "sale_price": null,
            "currency_id": "BRL",
            "available_quantity": 1,
            "sold_quantity": 0,
            "buying_mode": "buy_it_now",
            "listing_type_id": "gold_pro",
            "stop_time": "2042-06-22T04:00:00.000Z",
            "condition": "new",
            "permalink":
                "https://produto.mercadolivre.com.br/MLB-2695559210-samsung-galaxy-s22-dual-sim-128-gb-phantom-black-8-gb-ram-_JM",
            "thumbnail":
                "http://http2.mlstatic.com/D_607199-MLA49387650897_032022-O.jpg",
            "thumbnail_id": "607199-MLA49387650897_032022",
            "accepts_mercadopago": true,
            "installments": {
              "quantity": 10,
              "amount": 449.9,
              "rate": 0,
              "currency_id": "BRL"
            },
            "address": {
              "state_id": "BR-RJ",
              "state_name": "Rio de Janeiro",
              "city_id": "BR-RJ-01",
              "city_name": "Rio de Janeiro"
            },
            "shipping": {
              "free_shipping": true,
              "mode": "me2",
              "tags": ["self_service_in", "mandatory_free_shipping"],
              "logistic_type": "drop_off",
              "store_pick_up": false
            },
            "seller_address": {
              "id": "",
              "comment": "",
              "address_line": "",
              "zip_code": "",
              "country": {"id": "BR", "name": "Brasil"},
              "state": {"id": "BR-RJ", "name": "Rio de Janeiro"},
              "city": {"id": "BR-RJ-01", "name": "Rio de Janeiro"},
              "latitude": "",
              "longitude": ""
            },
            "attributes": [
              {
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "id": "BRAND",
                "name": "Marca",
                "value_name": "Samsung",
                "values": [
                  {
                    "id": "206",
                    "name": "Samsung",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "value_id": "206",
                "value_struct": null,
                "source": 2860837171021627
              },
              {
                "id": "DETAILED_MODEL",
                "value_struct": null,
                "source": 7567447101417086,
                "name": "Modelo detalhado",
                "value_id": null,
                "value_name": "SM-S901",
                "values": [
                  {
                    "id": null,
                    "name": "SM-S901",
                    "struct": null,
                    "source": 7567447101417086
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "name": "Modelo de GPU",
                "value_name": "Adreno 730",
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros",
                "source": 4709228965570453,
                "id": "GPU_MODEL",
                "value_id": "11732851",
                "value_struct": null,
                "values": [
                  {
                    "id": "11732851",
                    "name": "Adreno 730",
                    "struct": null,
                    "source": 4709228965570453
                  }
                ]
              },
              {
                "value_name": "Novo",
                "attribute_group_id": "OTHERS",
                "id": "ITEM_CONDITION",
                "name": "Condição do item",
                "values": [
                  {
                    "id": "2230284",
                    "name": "Novo",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 2860837171021627,
                "value_id": "2230284",
                "value_struct": null
              },
              {
                "attribute_group_name": "Outros",
                "source": 2860837171021627,
                "id": "LINE",
                "name": "Linha",
                "value_id": "249991",
                "value_name": "Galaxy S",
                "value_struct": null,
                "values": [
                  {
                    "id": "249991",
                    "name": "Galaxy S",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "attribute_group_id": "OTHERS"
              },
              {
                "value_id": "12062075",
                "attribute_group_id": "OTHERS",
                "values": [
                  {
                    "id": "12062075",
                    "name": "S22 Dual SIM (Snapdragon)",
                    "struct": null,
                    "source": 2860837171021627
                  }
                ],
                "attribute_group_name": "Outros",
                "source": 2860837171021627,
                "id": "MODEL",
                "name": "Modelo",
                "value_name": "S22 Dual SIM (Snapdragon)",
                "value_struct": null
              },
              {
                "name": "Modelo do processador",
                "source": 7567447101417086,
                "id": "PROCESSOR_MODEL",
                "value_id": "11850084",
                "value_name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                "value_struct": null,
                "values": [
                  {
                    "name": "Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)",
                    "struct": null,
                    "source": 7567447101417086,
                    "id": "11850084"
                  }
                ],
                "attribute_group_id": "OTHERS",
                "attribute_group_name": "Outros"
              },
              {
                "name": "Peso",
                "value_name": "167 g",
                "value_struct": {"number": 167, "unit": "g"},
                "values": [
                  {
                    "id": "2087871",
                    "name": "167 g",
                    "struct": {"number": 167, "unit": "g"},
                    "source": 4709228965570453
                  }
                ],
                "attribute_group_id": "OTHERS",
                "id": "WEIGHT",
                "value_id": "2087871",
                "attribute_group_name": "Outros",
                "source": 4709228965570453
              }
            ],
            "differential_pricing": {"id": 35713366},
            "original_price": null,
            "category_id": "MLB1055",
            "official_store_id": null,
            "domain_id": "MLB-CELLPHONES",
            "catalog_product_id": "MLB18967698",
            "tags": [
              "extended_warranty_eligible",
              "good_quality_picture",
              "good_quality_thumbnail",
              "immediate_payment",
              "cart_eligible"
            ],
            "order_backend": 50,
            "use_thumbnail_id": false,
            "offer_score": null,
            "offer_share": null,
            "match_score": null,
            "winner_item_id": null,
            "melicoin": null,
            "discounts": null
          }
        ]
      });

      var jsom = json.decode(produtos);

      var inventary = jsom['results'];

      inventary.forEach((e) {
        Product item = Product.fromJson(e);
        listProducts.add(item);
      });

      storageProdutos.write('produtos', listProducts);
    } else {
      //read storage and mount product list

      var inventary = storageProdutos.read("produtos");
      inventary.forEach((e) {
        Product item = Product.fromJson(e);
        listProducts.add(item);
      });
    }
  }
 */
  filterListProduct(String query) {
    List<Product> dummySearchList = <Product>[];
    dummySearchList.addAll(listProducts);

    if (query.isNotEmpty) {
      List<Product> dummyListData = <Product>[];
      dummySearchList.forEach((item) {
        if (item.title!.contains(query)) {
          dummyListData.add(item);
        }
      });

      listProducts.clear();
      setState(() {
        listProducts.addAll(dummyListData);
        print("listProducts ${listProducts.length}");
      });

      return;
    } else {
      setState(() {
        listProducts.clear();
        //getProductDatabase();
        print("listProducts ${listProducts.length}");
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 40,
                width: 40,
                child: Image.asset("assets/compras-online.png")),
            Text(
              "Dev Market",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),

      body: Column(
        children: [
          //campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              onChanged: (value) {
                filterListProduct(value.toUpperCase());
              },
              onFieldSubmitted: (value) {
                filterListProduct(value.toUpperCase());
              },
              decoration: InputDecoration(
                  hintText: "Pesquise aqui",
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 18),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 21,
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      60,
                    ),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  )),
            ),
          ),
          Expanded(
            child: listProducts.length > 0
                ? GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 9 / 15.5),
                    itemCount: listProducts.length,
                    itemBuilder: (_, index) {
                      Product produto = listProducts[index];
                      return ItemTile(
                        itemproduct: listProducts[index],
                      );
                    })
                : Container(
                    color: Colors.transparent,
                  ),
          )
        ],
      ),
    );
  }
}
