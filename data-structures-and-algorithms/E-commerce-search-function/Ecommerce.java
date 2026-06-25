import java.util.Scanner;
public class Ecommerce {
    public static void main(String[] args) {
        Product[] products = new Product[5];
        Scanner sc = new Scanner(System.in);
        // Creating and adding products to the array
        for (int i = 0; i < products.length; i++) {
            products[i] = new Product();
            products[i].setProductId(i + 1);
            products[i].setProductName("Product " + (i + 1));
            products[i].setCategory("Category " + (i + 1));
        }

        // Searching for a product by ID
        System.out.print("Enter product ID to search: ");
        int searchId = sc.nextInt();
        productSearch searcher = new productSearch();
        Product foundProduct = searcher.searchProductById(products, searchId);
        Product found = searcher.searchProductLinear(products, searchId);
        if (foundProduct != null && found != null) {
            System.out.println("Product found: " + foundProduct.getProductName() + ", Category: " + foundProduct.getCategory());
        } else {
            System.out.println("Product with ID " + searchId + " not found.");
        }
    }
}
