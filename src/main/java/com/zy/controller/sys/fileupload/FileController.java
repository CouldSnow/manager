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
	public Msg upload( @RequestParam("file")MultipartFile file,@RequestParam("fileName")String fileName) {
		if(file!=null) {
			String path=null;
			String type=null;
			String ofileName = file.getOriginalFilename();//文件原名
			type = fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
			if(type!=null) {
				if("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())||"PDF".equals(type.toUpperCase())) {
					String realPath="C:\\Users\\Administrator\\Desktop";
					//String trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
					String trueFileName=fileName;
					path = realPath+"\\"+trueFileName;
					try {
						file.transferTo(new File(path));
					} catch (Exception e) {
						return new Msg().fail().add("error", e.getMessage());
					}
				}
			}else {
				return new Msg().fail().add("error", "fail");
			}
		}else {
			return new Msg().fail().add("error", "file is null");
		}
		return  new Msg().success();
	}
}
