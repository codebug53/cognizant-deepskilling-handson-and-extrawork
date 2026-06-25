public class Product {
    private String productName;
    private String category;
    private int productId;

    String getProductName() {
        return productName;
    }  

    String getCategory(){
        return category;
    }
    
    int getProductId() {
        return productId;
    }

    void setProductName(String productName) {
        this.productName = productName;
    }

    void setCategory(String category) {
        this.category = category;
    }

    void setProductId(int productId) {
        this.productId = productId;
    }
}