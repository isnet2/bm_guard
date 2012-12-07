<%@ page pageEncoding="utf-8" %>

	<!-- policy_select_view -->
	<div id="policy_select_view"  class="scroll" style="height: 300px; margin: 0px;">
		<div>
			<p class="txt_gigi"><strong>기기명</strong> : <span id="view_device_name"></span></p>
			<div class="list">
				<table style="border-top:1px solid #ddd" id="view_device_table">
					<colgroup>
					<col style="width:20%"/>
					<col style="width:30%"/>
					<col style="width:20%"/>
					<col style="width:30%"/>
					</colgroup>
					<tbody>
					</tbody>
				</table>
			</div>
			<p class="txt_gigi mt20"><strong>정책적용이력</strong></p>
			<table class="title">
				<colgroup>
					<col style="width:15%"/>
					<col style="width:15%"/>
					<col style="width:25%"/>
					<col style="width:15%"/>
					<col style="width:10%"/>
					<col style="width:20%"/>
				</colgroup>
				<tbody>
					<tr>
						<td>정책적용일시</td>
						<td>정책명</td>
						<td>정책설명</td>
						<td>시뮬레이션<br/>정책</td>
						<td>정책<br/>생성자</td>
						<td>비고</td>
					</tr>
				</tbody>
			</table>
			<div class="list">
				<table>
					<colgroup>
						<col style="width:15%"/>
						<col style="width:15%"/>
						<col style="width:25%"/>
						<col style="width:15%"/>
						<col style="width:10%"/>
						<col style="width:20%"/>
					</colgroup>
					<tbody>
						<!-- <tr>
							<td>2012-10-25 12:12:12</td>
							<td>2012-10-25 OS 패치</td>
							<td>oooOOOoOoooooOOOOoooO</td>
							<td></td>
							<td>리처드</td>
							<td><a href="#" class="btn set25"><span>정책내용 보기</span></a></td>
						</tr> -->
					</tbody>
				</table>
			</div>
		</div>
	</div><!-- policy_select_view -->