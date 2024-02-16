/// items : [{"id":4509,"req_id":4509,"requisition_no":"CCL/IR23100042","submition_date":"2023-10-22T10:27:47Z","shortname":"CCL","req_date":"2023-10-22T10:19:48Z","rtype_name":"REGULAR ITEM","item_main_group_id":1,"main_group_name":"General","department_name":"ADMIN","entry_user_id":5297,"entry_user_name":"SHAHRIAR-27766","entry_user_full_name":"Md. Shahriar Siddiqui","status":2,"department_id":15,"item_id":"6613","no_of_item":1,"item_name":"Sticky Note(1)","category_name":"Office Supplies & Stationery","store_house_name":"CCL Model General Store","action_by":"SHAHRIAR-27766(Md. Shahriar Siddiqui)","action_date":"2023-10-22T10:27:47Z","action_name":"Submitted","location_name":"Nishat Central Project","location_id":95,"item_cat_id":110},null]
/// hasMore : true
/// limit : 25
/// offset : 0
/// count : 25
/// links : [{"rel":"self","href":"http://175.29.177.84:7070/ords/idea_hameem/approval/Internal_req_pandding_list?g_user_id=13"},{"rel":"describedby","href":"http://175.29.177.84:7070/ords/idea_hameem/metadata-catalog/approval/item"},{"rel":"first","href":"http://175.29.177.84:7070/ords/idea_hameem/approval/Internal_req_pandding_list?g_user_id=13"},{"rel":"next","href":"http://175.29.177.84:7070/ords/idea_hameem/approval/Internal_req_pandding_list?g_user_id=13&offset=25"}]

class InternalRequisitionModel {

  List<Items>? items;
  bool? hasMore;
  num? limit;
  num? offset;
  num? count;
  List<Links>? links;



  InternalRequisitionModel({
    this.items,
    this.hasMore,
    this.limit,
    this.offset,
    this.count,
    this.links,});


  InternalRequisitionModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    hasMore = json['hasMore'];
    limit = json['limit'];
    offset = json['offset'];
    count = json['count'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['hasMore'] = hasMore;
    map['limit'] = limit;
    map['offset'] = offset;
    map['count'] = count;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// rel : "self"
/// href : "http://175.29.177.84:7070/ords/idea_hameem/approval/Internal_req_pandding_list?g_user_id=13"



class Links {

  String? rel;
  String? href;

  Links({
    this.rel,
    this.href,});

  Links.fromJson(dynamic json) {
    rel = json['rel'];
    href = json['href'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rel'] = rel;
    map['href'] = href;
    return map;
  }

}

/// id : 4509
/// req_id : 4509
/// requisition_no : "CCL/IR23100042"
/// submition_date : "2023-10-22T10:27:47Z"
/// shortname : "CCL"
/// req_date : "2023-10-22T10:19:48Z"
/// rtype_name : "REGULAR ITEM"
/// item_main_group_id : 1
/// main_group_name : "General"
/// department_name : "ADMIN"
/// entry_user_id : 5297
/// entry_user_name : "SHAHRIAR-27766"
/// entry_user_full_name : "Md. Shahriar Siddiqui"
/// status : 2
/// department_id : 15
/// item_id : "6613"
/// no_of_item : 1
/// item_name : "Sticky Note(1)"
/// category_name : "Office Supplies & Stationery"
/// store_house_name : "CCL Model General Store"
/// action_by : "SHAHRIAR-27766(Md. Shahriar Siddiqui)"
/// action_date : "2023-10-22T10:27:47Z"
/// action_name : "Submitted"
/// location_name : "Nishat Central Project"
/// location_id : 95
/// item_cat_id : 110

class Items {

  num? id;
  num? reqId;
  String? requisitionNo;
  String? submitionDate;
  String? shortname;
  String? reqDate;
  String? rtypeName;
  num? itemMainGroupId;
  String? mainGroupName;
  String? departmentName;
  num? entryUserId;
  String? entryUserName;
  String? entryUserFullName;
  num? status;
  num? departmentId;
  String? itemId;
  num? noOfItem;
  String? itemName;
  String? categoryName;
  String? storeHouseName;
  String? actionBy;
  String? actionDate;
  String? actionName;
  String? locationName;
  num? locationId;
  num? itemCatId;




  Items({
    this.id,
    this.reqId,
    this.requisitionNo,
    this.submitionDate,
    this.shortname,
    this.reqDate,
    this.rtypeName,
    this.itemMainGroupId,
    this.mainGroupName,
    this.departmentName,
    this.entryUserId,
    this.entryUserName,
    this.entryUserFullName,
    this.status,
    this.departmentId,
    this.itemId,
    this.noOfItem,
    this.itemName,
    this.categoryName,
    this.storeHouseName,
    this.actionBy,
    this.actionDate,
    this.actionName,
    this.locationName,
    this.locationId,
    this.itemCatId,});



  Items.fromJson(dynamic json) {
    id = json['id'];
    reqId = json['req_id'];
    requisitionNo = json['requisition_no'];
    submitionDate = json['submition_date'];
    shortname = json['shortname'];
    reqDate = json['req_date'];
    rtypeName = json['rtype_name'];
    itemMainGroupId = json['item_main_group_id'];
    mainGroupName = json['main_group_name'];
    departmentName = json['department_name'];
    entryUserId = json['entry_user_id'];
    entryUserName = json['entry_user_name'];
    entryUserFullName = json['entry_user_full_name'];
    status = json['status'];
    departmentId = json['department_id'];
    itemId = json['item_id'];
    noOfItem = json['no_of_item'];
    itemName = json['item_name'];
    categoryName = json['category_name'];
    storeHouseName = json['store_house_name'];
    actionBy = json['action_by'];
    actionDate = json['action_date'];
    actionName = json['action_name'];
    locationName = json['location_name'];
    locationId = json['location_id'];
    itemCatId = json['item_cat_id'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['req_id'] = reqId;
    map['requisition_no'] = requisitionNo;
    map['submition_date'] = submitionDate;
    map['shortname'] = shortname;
    map['req_date'] = reqDate;
    map['rtype_name'] = rtypeName;
    map['item_main_group_id'] = itemMainGroupId;
    map['main_group_name'] = mainGroupName;
    map['department_name'] = departmentName;
    map['entry_user_id'] = entryUserId;
    map['entry_user_name'] = entryUserName;
    map['entry_user_full_name'] = entryUserFullName;
    map['status'] = status;
    map['department_id'] = departmentId;
    map['item_id'] = itemId;
    map['no_of_item'] = noOfItem;
    map['item_name'] = itemName;
    map['category_name'] = categoryName;
    map['store_house_name'] = storeHouseName;
    map['action_by'] = actionBy;
    map['action_date'] = actionDate;
    map['action_name'] = actionName;
    map['location_name'] = locationName;
    map['location_id'] = locationId;
    map['item_cat_id'] = itemCatId;

    return map;
  }

}