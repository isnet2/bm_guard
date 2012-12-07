package com.isnetis.common.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.isnetis.common.domain.CommonConstant;

@Controller
public class ExcelToJSONController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView; 
	
	@RequestMapping(value="/openfile.html")
	public ModelAndView readExcel(@RequestParam("excelfile")MultipartFile excelfile) {
		//logger.debug("excelfile : " + excelfile);
	
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		int resultCode = CommonConstant.REQUEST_PROCESS_SUCCEED;
		
		try{
			Sheet sheet = this.getSheet(excelfile);
			if(sheet != null){
				List<Map<String, String>> list = new ArrayList<Map<String,String>>();
				
				int rows = sheet.getPhysicalNumberOfRows();
				String[] rowname = getRowname(sheet.getRow(0));
				for(int i=1; i<rows; i++){
					list.add(getRow(sheet.getRow(i), rowname));
				}
				
				for(int i=0;i < list.size();i++) {
					Map<String, String> map =list.get(i);

					Set<String> setStr = map.keySet();
		            Iterator ss = setStr.iterator();

					for(int g =0; g < map.size(); g++) {
						while (ss.hasNext()) {
							String key = (String) ss.next();
			               // logger.debug("**** " + key +  " == " + map.get(key));
			            }
					}
				}
				mav.addObject("excel_data", list);
				
			}
		}catch(Exception e){
			e.printStackTrace();
			resultCode = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultCode);
		
		return mav;
	}
	
	private String[] getRowname(Row titleRow){
		int cells = titleRow.getPhysicalNumberOfCells();
		String[] rowname = new String[cells];
		for(int i=0; i<cells; i++){
			rowname[i] = this.getCellData(titleRow.getCell(i));
		}
		return rowname;
	}
	
	private Map<String, String> getRow(Row row, String[] rowname){
		Map<String, String> map = new HashMap<String, String>();
		
		int cells = row.getPhysicalNumberOfCells();
		for(int i=0; i<cells; i++){
			//logger.debug(this.getCellData(row.getCell(i)));
			map.put(rowname[i], this.getCellData(row.getCell(i)));
		}
		
		return map;
	}
	
	private Sheet getSheet(MultipartFile excelfile) throws IOException{
		Sheet sheet = null;
		if(!excelfile.isEmpty()){
			String filename = excelfile.getOriginalFilename();
			InputStream is = excelfile.getInputStream();
			
			Workbook workbook = null;
			if(filename.endsWith("xlsx")){
				workbook = new XSSFWorkbook(is);
			}else if(filename.endsWith("xls")){
				workbook = new HSSFWorkbook(is);
			}
			sheet = workbook.getSheetAt(0);
		}
		
		return sheet;
	}
	
	private String getCellData(Cell cell){
		String data = "";
		switch (cell.getCellType()) {
		case XSSFCell.CELL_TYPE_STRING:
			data = cell.getRichStringCellValue().getString();
			break;
		case XSSFCell.CELL_TYPE_NUMERIC:
			if(HSSFDateUtil.isCellDateFormatted(cell)){
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMDD");
				data = formatter.format(cell.getDateCellValue());
			}else{
				data = String.valueOf(cell.getNumericCellValue());
			}
			break;
		case XSSFCell.CELL_TYPE_FORMULA:
			data = cell.getCellFormula();
			break;
		case XSSFCell.CELL_TYPE_BOOLEAN:
			data = String.valueOf(cell.getBooleanCellValue());
			break;
		case XSSFCell.CELL_TYPE_ERROR:
			data = String.valueOf(cell.getErrorCellValue());
			break;
		case XSSFCell.CELL_TYPE_BLANK:
			break;
		default:
			break;
		}
		return data;
	}
}
