interface search {
    int searchProduct(Product[] products, int productId);
}
class linearSearch implements search {
    @Override
    public int searchProduct(Product[] products, int productId) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].getProductId() == productId) {
                return i;
            }
        }
        return -1;
    }
}
class binarySearch implements search {
    @Override
    public int searchProduct(Product[] products, int productId) {
        int left = 0;
        int right = products.length-1;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (products[mid].getProductId() == productId) {
                return mid;
            } else if (products[mid].getProductId() < productId) {
                left = mid + 1;
            } else {
                right = mid - 1; 
            }
        }
        return -1;
    }
}

public class productSearch {
    public Product searchProductLinear(Product[] products, int productId) {
        search searchAlgorithm = new linearSearch();
        int index = searchAlgorithm.searchProduct(products, productId);
        
        if (index != -1) {
            return products[index];
        } else {
            return null;
        }
    }
    public Product searchProductById(Product[] products, int productId) {
        // Sort the products array by productId before performing binary search
        
        java.util.Arrays.sort(products, new productIdComparator());
        
        // Perform binary search
        search searchAlgorithm = new binarySearch();
        int index = searchAlgorithm.searchProduct(products, productId);
        
        if (index != -1) {
            return products[index];
        } else {
            return null;
        }
    }
}
