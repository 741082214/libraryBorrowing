import library.service.BookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class test {
    
    @Autowired
    private BookService bookService;


    @Test
    public void test1(){
        List allTypeName = bookService.findAllTypeName();
        for (Object a:allTypeName){
            System.out.println(a);
        }
    }
}
