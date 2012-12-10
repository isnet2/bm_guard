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
		logger.debug("** PolicyFileServiceImp :insertPoliceFile");
		String about_txt = makeAboutTxt(policy);
		logger.debug(" about_txt : " + about_txt);
		String passProcess_dsf = makePassProcessDsf(policy);
		logger.debug(" passProcess_dsf : " + passProcess_dsf);
		String systemProcess_dat = makeSystemProcessDat(policy);
		logger.debug(" systemProcess_dat : " + systemProcess_dat);
		String folderDefines_dsf = makeFolderDefinesDsf(policy);
		logger.debug(" folderDefines_dsf : " + folderDefines_dsf);
		String foldst_dat = makePolstDat(policy);
		logger.debug(" foldst_dat : " + foldst_dat);
		
		Map<String, String> map = new HashMap<String, String>();
		// 바이너리 형태로 저장할 때
		map.put("policy_idx", String.valueOf(policy.getPolicy_idx()));
		map.put("about_txt", toBinaryString(about_txt));
		map.put("passprocess_dsf", toBinaryString(passProcess_dsf));
		map.put("systemprocess_dat", toBinaryString(systemProcess_dat));
		map.put("folderdefines_dsf", toBinaryString(folderDefines_dsf));
		map.put("polst_dat", toBinaryString(foldst_dat));
		
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
