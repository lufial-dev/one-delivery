class URL{
    HOST = "http://192.168.1.121:3000";

    COMPANY_CATEGORY = this.HOST + "/uploads/companycategory/icons/";
    PRODUCT_CATEGORY = this.HOST + "/uploads/productcategory/images/";
    PRODUCT_IMAGE = this.HOST + "/uploads/product/images/";
}  

module.exports = new URL();