package com.isnetis.policy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.policy.dao.PolicyMastDao;
import com.isnetis.policy.domain.FolderPolicyVO;
import com.isnetis.policy.domain.MediaPolicyVO;
import com.isnetis.policy.domain.PassPolicyVO;
import com.isnetis.policy.domain.PolicyMastVO;
import com.isnetis.policy.domain.SystemPolicyVO;

@Service
public class PolicyFileServiceImp implements PolicyFileService{
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PolicyMastDao policyMastDao;
	
	@Override
	public void insertPoliceFile(PolicyMastVO policy){
		
		
		String about_txt = makeAboutTxt(policy);
		String passProcess_dsf = makePassProcessDsf(policy);
		String systemProcess_dat = makeSystemProcessDat(policy);
		String folderDefines_dsf = makeFolderDefinesDsf(policy);
		String poldst_dat = makePolstDat(policy);

		Map<String, String> map = new HashMap<String, String>();
		// 바이너리 형태로 저장할 때
		map.put("policy_idx", String.valueOf(policy.getPolicy_idx()));

		String bin_about_txt = toBinaryString(about_txt);
		String bin_passProcess_dsf = toBinaryString(passProcess_dsf);
		String bin_systemprocess_date = toBinaryString(systemProcess_dat);
		String bin_folderdefines_dsf = toBinaryString(folderDefines_dsf);
		String bin_polst_dat = toBinaryString(poldst_dat);
		
		map.put("about_txt", bin_about_txt);
		map.put("passprocess_dsf", bin_passProcess_dsf);
		map.put("systemprocess_dat", bin_systemprocess_date);
		map.put("folderdefines_dsf", bin_folderdefines_dsf);
		map.put("polst_dat", bin_polst_dat);
		
		logger.info("["+getClass().getName()+"][insertPolicyFile] about_txt["+about_txt+"]");
		logger.info("["+getClass().getName()+"][insertPolicyFile] bin_about_txt["+bin_about_txt+"]");
		
		logger.info("["+getClass().getName()+"][insertPolicyFile] passProcess_dsf["+passProcess_dsf+"]");
		logger.info("["+getClass().getName()+"][insertPolicyFile] bin_passProcess_dsf["+bin_passProcess_dsf+"]");
		
		logger.info("["+getClass().getName()+"][insertPolicyFile] systemProcess_dat["+systemProcess_dat+"]");
		logger.info("["+getClass().getName()+"][insertPolicyFile] bin_systemprocess_date["+bin_systemprocess_date+"]");
		
		logger.info("["+getClass().getName()+"][insertPolicyFile] folderDefines_dsf["+folderDefines_dsf+"]");
		logger.info("["+getClass().getName()+"][insertPolicyFile] bin_folderdefines_dsf["+bin_folderdefines_dsf+"]");
		
		logger.info("["+getClass().getName()+"][insertPolicyFile] poldst_dat["+poldst_dat+"]");
		logger.info("["+getClass().getName()+"][insertPolicyFile] bin_polst_dat["+bin_polst_dat+"]");
		
		// 텍스트 형태로 저장할 때 
		/*
		map.put("about_txt", about_txt);
		map.put("passprocess_dsf", passProcess_dsf);
		map.put("systemprocess_dat", systemProcess_dat);
		map.put("folderdefines_dsf", folderDefines_dsf);
		map.put("polst_dat", foldst_dat);
		*/
		policyMastDao.addPolicyFile(map);
		
	}
	
	@Override
	public void deletePolicyFile(int policy_idx) {
		policyMastDao.deletePolicyFile(policy_idx);
	}
	
	private String makePolstDat(PolicyMastVO policy){
		
		StringBuilder sb = new StringBuilder();
		
		List<MediaPolicyVO> mediaPolicyList = policy.getMediaPolicyList();
		logger.debug("** makePolstDat : mediaPolicyList.size = " + mediaPolicyList.size()); 
		
		if(mediaPolicyList != null ) {
			for(MediaPolicyVO mediaPolicy : mediaPolicyList){
	
				String mediaType = mediaPolicy.getMedia_type().length() == 1 ? mediaPolicy.getMedia_type() + " ":mediaPolicy.getMedia_type();
				String method = mediaPolicy.getMethod();
				
				sb.append("MEDIACTL;");
				sb.append(mediaType + ";");
				sb.append(method + ";");
				sb.append("L");
				sb.append(System.getProperty("line.separator"));
			}
			sb.append(System.getProperty("line.separator"));
		}
		return sb.toString();
	}
	
	private String makeFolderDefinesDsf(PolicyMastVO policy){
		StringBuilder sb = new StringBuilder();
		
		List<FolderPolicyVO> folderPolicyList = policy.getFolderPolicyList();
		for(FolderPolicyVO folderPolicy : folderPolicyList){
			sb.append(folderPolicy.getBmfolder_path());
		}
		
		return sb.toString();
	}
	
	private String makeSystemProcessDat(PolicyMastVO policy){
		StringBuilder sb = new StringBuilder();
		
		sb.append("// 이 파일은 보안드라이버에서 아무런 처리없이 진행해도 되는 프로세스들을 정의합니다.");
		sb.append(System.getProperty("line.separator"));
		sb.append(System.getProperty("line.separator"));
		
		List<SystemPolicyVO> systemPolicyList = policy.getSystemPolicyList();
		int size = systemPolicyList.size();
		String[] arrays = new String[size];
		for(int i=0; i<size; i++){
			arrays[i] = systemPolicyList.get(i).getProcess_name(); 
		}
		
		List<String> ostypeList = policy.getOsTypeList();
		for(String ostype : ostypeList){
			String text = makePolicyString(ostype, arrays);
			sb.append(text);
		}
		sb.append(System.getProperty("line.separator"));
		
		return sb.toString();
	}
	
	private String makePassProcessDsf(PolicyMastVO policy){
		StringBuilder sb = new StringBuilder();
		
		sb.append("// 이 파일은 보안드라이버에서 아무런 처리없이 진행해도 되는 프로세스들을 정의합니다.");
		sb.append(System.getProperty("line.separator"));
		sb.append(System.getProperty("line.separator"));
	
		List<PassPolicyVO> passPolicyList = policy.getPassPolicyList();
		int size = passPolicyList.size();
		String[] arrays = new String[size];
		for(int i=0; i<size; i++){
			arrays[i] = passPolicyList.get(i).getProcess_name();
		}
		
		List<String> ostypeList = policy.getOsTypeList();
		for(String ostype : ostypeList){
			String text = makePolicyString(ostype, arrays);
			sb.append(text);
		}
		sb.append(System.getProperty("line.separator"));
		
		return sb.toString();
	}
	
	
	private String makeAboutTxt(PolicyMastVO policy){
		
		StringBuilder sb = new StringBuilder();
		sb.append(policy.getCreate_date());
		sb.append(System.getProperty("line.separator"));
		sb.append(System.getProperty("line.separator"));
		sb.append("기본 보안정책입니다.");
		sb.append(System.getProperty("line.separator"));
		sb.append(System.getProperty("line.separator"));
		sb.append("기본적으로 필요한 내용이 저장되어있습니다.");
		sb.append(System.getProperty("line.separator"));
		sb.append(System.getProperty("line.separator"));
		sb.append("[PolicyINFO]");
		sb.append(System.getProperty("line.separator"));
		sb.append("Index=" + policy.getPolicy_idx());
		sb.append(System.getProperty("line.separator"));
		sb.append("Date=0");
		sb.append(System.getProperty("line.separator"));
		
		return sb.toString();
	}
	
	private String makePolicyString(String ostype, String[] arrays){
		
		StringBuilder sb = new StringBuilder();
		sb.append("<"+ostype.toUpperCase()+"-");
		for(String text : arrays){
			sb.append(text+";");
		}
		sb.append(">");
		sb.append(System.getProperty("line.separator"));
		return sb.toString();
	}

	private String toBinaryString(String data){
		StringBuilder result = new StringBuilder();
		
		byte[] bytes = data.getBytes();
		for(int i=0; i<bytes.length; i++){
			result.append(String.format("%02X", bytes[i]));
		}
		
		return result.toString();
	}
	
}
