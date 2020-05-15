
import com.aishang.po.OrderForPageBean;
import com.aishang.po.ProductForPageBean;
import com.aishang.service.OrderService;
import com.aishang.service.ProductService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-applicationContext.xml"})
public class Demo {
    @Resource
    private ProductService productService;
    @Resource
    private OrderService orderService;
    @Test
    public void fun1(){
        ProductForPageBean productForPageBean = new ProductForPageBean();
        productForPageBean.setPageSize(12);
        productForPageBean.setPageNow(2);
        productForPageBean.setCsid(1);
        productForPageBean.setCid(1);
        ProductForPageBean productForPage = productService.getProductForPage(productForPageBean);
        System.out.println(productForPage);
    }
    @Test
    public void fun2(){
        OrderForPageBean orderForPageBean = new OrderForPageBean();
        orderForPageBean.setUid(7);
        orderForPageBean.setPageSize(3);
        OrderForPageBean orderExtsByUid = orderService.getOrderExtsByUid(orderForPageBean);
        System.out.println(orderExtsByUid);
    }
}
