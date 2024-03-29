// ignore_for_file: constant_identifier_names, duplicate_ignore

class Constants {
  //DASHBOARD PAGE
  static const dashboard = "Dashboard";
  static const totuser = "Total Users";
  static const totorder = "Total Orders";
  static const liveprodct = "Live Product";
  static const dPid = "ProductId";
  static const dQuantity = "Quantity";
  static const dtotamt = "Total";
  //orders page
  static const orders = "Orders";
  static const accepted = "Accepted";
  static const declined = "Declined";
  static const orderNo = "Order No: ";
  static const trackingNo = "Tracking number: ";
  static const quantity = "Quantity: ";
  // ignore: constant_identifier_names
  static const total_amt = "Total Amount: ";
  static const detail = "Details";
  static const unit = "Units: ";
  //orderd product detail page
  static const item = " item";
  static const color = "Color: ";
  static const size = "Size: ";
  // ignore: constant_identifier_names
  static const ord_info = "Order information";
  // ignore: constant_identifier_names
  static const shipp_add = "Shipping Address: ";
  // ignore: constant_identifier_names
  static const pay_meth = "Payment method: ";
  // ignore: constant_identifier_names
  static const del_method = "Delivery method: ";
  static const discount = "Discount: ";
  // ignore: constant_identifier_names
  static const tot_amt = "Total Amount: ";
  static const reorder = "Reorder";
  // ignore: constant_identifier_names
  static const lea_feed = "Leave feedback";

  //Product page
  static const products = "Products";
  static const edit = "Edit";
  static const delete = "Delete";
  static const preview = "Preview";

  //category page
  static const category = "Categories";
  static const men = "Male";
  static const women = "Female";
  static const kide = "Kids";

  //add category page
  static const addCategory = "Add Category";
  static const subCategory = "Sub Category";

  //add product page
  static const addProduct = "Add Product";
  static const productDetail = "Product Detail";
  static const productName = "Product Name";
  static const price = "Price";
  static const dprice = "Strike-off price";
  static const brandName = "Brand Name";
  static const productDesc = "Product Description";
  static const selectImageText = "Select Multiple photos of your product";
  static const display = "Option display or Not";
  static const updateProduct = "Update Product";

  //user page
  static const user = "Users";

//database path name
  static const dSubCategoryImage = "subcgimage";
  static const dSubCategoryName = "subcgName";
  static const dProducts = "Products";
  static const dMale = "Male";
  static const dFemale = "Female";
  static const dKids = "Kids";

  // products

  static const dimages = "images";
  static const dPname = "Pname";
  static const dSPrice = "Price";
  static const ddPrice = "DisPrice";
  static const dBrand = "Brand";
  static const dDesc = "Description";
  static const dcategory = "Category";
  static const dsubCategory = "SubCategory";
  static const dType = "Type";
  static const dGender = "Gender";
  static const dDate = "Date";
  static const dId = "ID";
  static const dUser = "User";
  static const dColor = "Color";
  static const dSize = "Size";
  static const duname = "Name";
  static const dProimage = "ProfileIamge";
  static const demail = "Email";
  static const dOrderCount = "OrderCount";
  static const dColorLists = "ColorLists";

  //COLOR
  // ignore: constant_identifier_names
  static const red_text = 0xffDB3022;
  static const white_text = 0xffFFFFFF;
  static const black_text = 0xff222222;
  static const grey_text = 0xff9B9B9B;
  static const green_text = 0xff2AA952;
  //orders
  static const dcheckId = "CheckoutId";
  static const dorder = "Orders";
  static const dorderno = "OrderNo";
  static const dtrackNum = "TrackNo";
  static const dtotal = "Total";
  static const dodate = "Date";
  static const dShipAddress = "ShippingAddress";
  static const dPayment = "Payment";
  static const dDelMethod = "Delivery";
  static const dstatus = "Status";
  static const dAccepted = "Accepted";
  static const dProcessing = "Processing";
  static const dCancelled = "Cancelled";
  static const dUserid = "UserId";
  static const dokey = "OrderKey";
  static const dTotalProduct = "TotalProducts";
}

// class Autogenerated {
//   Clothes? clothes;

//   Autogenerated({this.clothes});

//   Autogenerated.fromJson(Map<String, dynamic> json) {
//     clothes =
//         json['clothes'] != null ? Clothes.fromJson(json['clothes']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (clothes != null) {
//       data['clothes'] = clothes!.toJson();
//     }
//     return data;
//   }
// }

class CategoryModel {
  String? subcgName;
  String? subcgimage;

  CategoryModel({this.subcgName, this.subcgimage});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    subcgName = json['subcgName'];
    subcgimage = json['subcgimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subcgName'] = subcgName;
    data['subcgimage'] = subcgimage;
    return data;
  }
}
