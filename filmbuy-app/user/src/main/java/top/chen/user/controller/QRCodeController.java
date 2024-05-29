package top.chen.user.controller;

import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import top.chen.user.service.QRCodeService;

/**
 * @author ChenQi
 * @date 2023/12/28
 * @description: QRCodeController
 */
@RestController
@Slf4j
public class QRCodeController {
    @Autowired
    private QRCodeService qrCodeService;

    @GetMapping("qrCode")
    public void getQRCode(String codeContent, HttpServletResponse response) {
        try {
            System.out.println(codeContent);
            qrCodeService.createQRCode2Stream(codeContent, response);
            log.info("成功生成二维码！");
        } catch (Exception e) {
            log.error("发生错误， 错误信息是：{}！", e.getMessage());
        }
    }

}
