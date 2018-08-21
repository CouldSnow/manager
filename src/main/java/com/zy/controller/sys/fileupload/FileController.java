package com.zy.controller.sys.fileupload;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zy.utils.Msg;

@Controller
@RequestMapping("file")
public class FileController {

	@RequestMapping("/upload")
	@ResponseBody
	public Msg upload( @RequestParam("file")MultipartFile file,@RequestParam("fileName")String fileName,@RequestParam("filePath")String filePath) {
		if(file!=null) {
			String path=null;
			String type=null;
			String ofileName = file.getOriginalFilename();//文件原名
			type = ofileName.indexOf(".")!=-1?ofileName.substring(ofileName.lastIndexOf(".")+1, ofileName.length()):null;
			if(type!=null) {
				if("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())||"PDF".equals(type.toUpperCase())) {
					String realPath=null;//待定字段，以后为项目文件存放地址，可以通过配置文件维护
					//String trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
					String trueFileName=fileName;
					path = filePath+"\\"+trueFileName;
					try {
						
						File dirfile = new File(path);
						if(dirfile.exists()) {
							return Msg.fail().add("error", "文件已存在");
						}
						
						File dirFile = new File(filePath);
						if(!dirFile.exists()) {
							dirFile.mkdirs();
						}
						file.transferTo(dirfile);
					} catch (Exception e) {
						return Msg.fail().add("error", e.getMessage());
					}
				}else {
					return Msg.fail().add("error", "文件上传格式不对");
				}
			}else {
				return Msg.fail().add("error", "fail");
			}
		}else {
			return Msg.fail().add("error", "上传文件为空");
		}
		return  Msg.success();
	}
}
