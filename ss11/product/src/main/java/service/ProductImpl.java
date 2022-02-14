package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductImpl implements ProductService{
    private static Map<Integer, Product> products;
    static {
        products = new HashMap<>();
        products.put(1,new Product(1,"com",2000,"com tam","hong ha"));
        products.put(2,new Product(2,"thit",4000,"thit tuoi","hong ha"));
        products.put(3,new Product(3,"ga",3000,"ga ta","hong ha"));
        products.put(4,new Product(4,"chao",1500,"chao hoa","hong ha"));
        products.put(5,new Product(5,"toi",3000,"toi tep","hong ha"));
        products.put(6,new Product(6,"ca",2000,"ca com","hong ha"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> search(String productName) {
        List<Product> productList = this.findAll();
        List<Product> result = new ArrayList<>();
        String nameProduct;
        productName = productName.toLowerCase();
        for (Product product: productList) {
            nameProduct = product.getName().toLowerCase();
            if (nameProduct.contains(productName) ){
                result.add(product);
            }else {
                result = null;
            }
        }

        return result;
    }


}
