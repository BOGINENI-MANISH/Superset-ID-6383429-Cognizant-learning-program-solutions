package EcommercePlatformSearchFunction;

 // SearchDemo.java
import java.util.Arrays;
import java.util.Comparator;

public class SearchDemo {

    // Linear Search
    public static Product linearSearch(Product[] products, String targetName) {
        for (Product p : products) {
            if (p.productName.equalsIgnoreCase(targetName)) {
                return p;
            }
        }
        return null;
    }

    // Binary Search (array must be sorted by productName)
    public static Product binarySearch(Product[] products, String targetName) {
        int low = 0;
        int high = products.length - 1;

        while (low <= high) {
            int mid = (low + high) / 2;
            int cmp = products[mid].productName.compareToIgnoreCase(targetName);
            if (cmp == 0) return products[mid];
            else if (cmp < 0) low = mid + 1;
            else high = mid - 1;
        }
        return null;
    }

    public static void main(String[] args) {
        Product[] productList = {
            new Product(101, "Laptop", "Electronics"),
            new Product(102, "Shampoo", "Personal Care"),
            new Product(103, "Phone", "Electronics"),
            new Product(104, "Book", "Education"),
            new Product(105, "T-shirt", "Fashion")
        };

        // Linear Search
        Product result1 = linearSearch(productList, "Phone");
        System.out.println("Linear Search Result: " + (result1 != null ? result1 : "Not Found"));

        // Binary Search (requires sorting)
        Arrays.sort(productList, Comparator.comparing(p -> p.productName));
        Product result2 = binarySearch(productList, "Phone");
        System.out.println("Binary Search Result: " + (result2 != null ? result2 : "Not Found"));
    }
}

//For small or rarely searched lists, Linear Search is simple and fine.

//For large, sorted product datasets, Binary Search is significantly faster.