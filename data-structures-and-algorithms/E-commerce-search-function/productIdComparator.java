import java.util.Comparator;
public class productIdComparator implements Comparator<Product> {
    @Override
    public int compare(Product p1, Product p2) {
        return Integer.compare(p1.getProductId(), p2.getProductId());
    }
}
