<%@ page pageEncoding="utf-8" %>
 <!-- policy_detail_view -->
   <div id="policy_detail_view">
		<div class="pol_tab">
			<ul>
				<li><a class="on" href="#" data-tab="body1"><span>허용프로세스</span></a></li>
				<li><a href="#" data-tab="body2"><span>시스템프로세스</span></a></li>
				<li><a href="#" data-tab="body3"><span>허용폴더목록</span></a></li>
				<li><a href="#" data-tab="body4"><span>미디어</span></a></li>
			</ul>
		</div>
		<div class="polbox body1">
			<div class="os">
				<table>
					<colgroup>
						<col style="width:10%"/>
						<col style="width:90%"/>
					</colgroup>
					<tbody>
						<tr>
							<th>OS</th>
							<td>
								<ul class="os">
									<li><input type="checkbox" id="" name=""> <label for="#">Win98</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">WinNT</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">WinME</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">Win2K</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">WinXP</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">Win7</label></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<table class="title">
				<colgroup>
					<col style="width:20%"/>
					<col style="width:20%"/>
					<col style="width:40%"/>
				</colgroup>
				<tbody>
					<tr>
						<td>프로세스</td>
						<td>회사명</td>
						<td class="pl20 tl">설명</td>
					</tr>
				</tbody>
			</table>
			<div class="list">
				<table id="pass_policy_table">
					<colgroup>
						<col style="width:20%"/>
						<col style="width:20%"/>
						<col style="width:40%"/>
					</colgroup>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>

		<div class="polbox body2" style="display:none">
			<div class="os">
				<table>
					<colgroup>
						<col style="width:10%"/>
						<col style="width:90%"/>
					</colgroup>
					<tbody>
						<tr>
							<th>OS</th>
							<td>
								<ul class="os">
									<li><input type="checkbox" id="" name=""> <label for="#">Win98</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">WinNT</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">WinME</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">Win2K</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">WinXP</label></li>
									<li><input type="checkbox" id="" name=""> <label for="#">Win7</label></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<table class="title">
				<tbody>
					<tr>
						<td>프로세스</td>
					</tr>
				</tbody>
			</table>
			<div class="list">
				<table  id="system_policy_table">
					<tbody>
					</tbody>
				</table>
			</div>
		</div>

		<div class="polbox body3" style="display:none">
			<table class="title">
				<colgroup>
					<col style="width:34%"/>
					<col style="width:33%"/>
					<col style="width:33%"/>
				</colgroup>
				<tbody>
					<tr>
						<td>폴더목록</td>
						<td>회사명</td>
						<td>설명</td>
					</tr>
				</tbody>
			</table>
			<div class="list">
				<table id="folder_policy_table">
					<colgroup>
						<col style="width:34%"/>
						<col style="width:33%"/>
						<col style="width:33%"/>
					</colgroup>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>

		<div class="polbox body4" style="display:none">
			<table class="title">
				<colgroup>
					<col style="width:40%"/>
					<col style="width:60%"/>
				</colgroup>
				<tbody>
					<tr>
						<td>Device 명</td>
						<td>적용정책</td>
					</tr>
				</tbody>
			</table>
			<div class="list">
				<table id="media_policy_table">
					<colgroup>
						<col style="width:40%"/>
						<col style="width:60%"/>
					</colgroup>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div><!-- //end policy_detail_view -->