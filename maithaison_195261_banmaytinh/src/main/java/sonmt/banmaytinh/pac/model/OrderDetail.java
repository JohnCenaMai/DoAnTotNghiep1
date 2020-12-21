package sonmt.banmaytinh.pac.model;

import java.util.List;

public class OrderDetail {
	
	private List<Giohang> giohang;
    private float subtotal;
    private float shipping;
    private float tax;
    private float total;
 	
    public OrderDetail(List<Giohang> giohang, String subtotal,
            String shipping, String tax, String total) {
        this.giohang = giohang;
        this.subtotal = Float.parseFloat(subtotal);
        this.shipping = Float.parseFloat(shipping);
        this.tax = Float.parseFloat(tax);
        this.total = Float.parseFloat(total);
    }
    
    public List<Giohang> getGiohang()
    {
    	return this.giohang;
    }
    
    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }
 
    public String getShipping() {
        return String.format("%.2f", shipping);
    }
 
    public String getTax() {
        return String.format("%.2f", tax);
    }
     
    public String getTotal() {
        return String.format("%.2f", total);
    }
    
}
