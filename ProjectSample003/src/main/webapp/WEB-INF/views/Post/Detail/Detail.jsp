<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
textarea {
  resize: none;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/include/loginTemplate.jsp"></jsp:include>
	<br>
	<br>
	<h1>hi im view detail</h1>
	<p>post id : ${detail.post_id}</p>
	<h3>${detail.post_title}</h3>
	<h4>${detail.post_content}</h4>
	<p>uploader : ${detail.member_name}</p>
	<p>date : ${detail.cre_date}</p>
	<p>test : ${detail.chg_file_name }</p>
	<img src="view_detail/viewFile/${detail.chg_file_name }"/>
	<!-- http://localhost:8080/ProjectSample003/viewFile -->
	<br>
	<br>
	<!-- 댓글 보여주기 -->
	<c:if test="${replyList ne null}">
	<table>
		<tr>
			<th>유저</th>
			<th>댓글</th>
			<th>작성일</th>
		</tr>
		<c:if test="${replyList eq null}">
			<tr>
				<td colspan="3">no comment</td>
			</tr>
		</c:if>
		<c:if test="${replyList ne null}">
			<c:forEach var="RepListrow" items="${replyList}">
				<%-- <c:if test="${RepListrow.is_active_rep}"> --%>
					<tr id="${RepListrow.reply_id }before">
						<td>${RepListrow.member_name }</td>
						<td>${RepListrow.reply_content }</td>
						<td>${RepListrow.cre_date }</td>
						<c:if test="${RepListrow.uqid eq login_uqid}">
						<td><button id="edit_rep_${RepListrow.reply_id }" onclick="edit_comment(${RepListrow.reply_id }, '${RepListrow.member_name }', '${RepListrow.reply_content }', '${RepListrow.cre_date }');">edit</button></td>
						<td><button id="delete_rep_${RepListrow.reply_id }" onclick="delete_comment(${RepListrow.reply_id });">delete</button></td>
						</c:if>
					</tr>
				<%-- </c:if> --%>
			</c:forEach>
		</c:if>
		
	</table>
	</c:if>
	<br>
	<br>
	<!-- 댓글 쓰기 -->
	<c:if test="${login_name ne null}">
		<textarea id="reply_content" cols="40" rows="3" placeholder="comment"></textarea>
		<button id="add_comment" onclick="add_comment();">add comment</button>
	</c:if>
	<br>
	<br>
	<!-- 글 수정/삭제 -->
	<c:if test="${detail.member_name eq login_name or login_member_rank eq 9}">
		<button id="edit">edit</button>
		<button id="delete">delete</button>
	</c:if>



	<script>
	if(${detail.member_name eq login_name or login_member_rank eq 9}){
		document.getElementById('edit').addEventListener('click', function(){
			document.location.href = '/ProjectSample003/edit?num='+${detail.post_id};
		});
		document.getElementById('delete').addEventListener('click', function(){
			var result = confirm("Do you want to delete the post '${detail.post_title}'?");
			if(result){
				var url = 'http://localhost:8080/ProjectSample003/post/delete';
				$.ajax({
					async : true,
					method : 'post',
					url : url,
					data : JSON.stringify({
						post_id : ${detail.post_id},
						board_id : ${detail.board_id},
						post_title : '${detail.post_title}'
					}),
					dataType : 'text',
					contentType : 'application/json',
					beforeSend : function(){
						console.log('sending delete request...');
					},
					success : function(data) {
						alert('post deleted');
						document.location.href = '/ProjectSample003/view';
					},
					error : function(data) {
						alert('error');
						document.location.href = '/ProjectSample003/view';
					}
				})
			
			}else{
				return;
			}
			
		});
	}else{
		
	}
	/* 댓글추가 */
	function add_comment(){
		if(${login_name ne null}){
			var url = 'http://localhost:8080/ProjectSample003/reply/add';
			$.ajax({
				async : true,
				method : 'post',
				url : url,
				data : JSON.stringify({
					post_id : ${detail.post_id},
					uqid : ${login_uqid},
					reply_content : $('#reply_content').val()
				}),
				dataType : 'text',
				contentType : 'application/json',
				beforeSend : function(){
					console.log('sending reply add request...');
				},
				success : function(data) {
					//alert('post deleted');
					location.reload();
				},
				error : function(data) {
					alert('error');
					location.reload();
				}
			})
		}
	}
	/* 댓글 수정 (보류. 실시간으로 수정화면 (text area) 받은 뒤에 수정확인 객체 dto를 보내줘야함) */
	function edit_comment(reply_id, member_name, content, cre_date){
		a = reply_id;
		b = member_name;
		c = content;
		d = cre_date;
		var temp = `a, b, c, d`;
		var htmls = '';
		htmls += '<tr id="'+reply_id+'after">';
		htmls += '<td colspan="3"><textarea id="reply_edit_content" cols="30" rows="2" placeholder="comment">'+content+'</textarea></td>';
		htmls += '<td><button id="confirm_edit" onclick="confirm_edit('+reply_id+');">confirm</button></td>';
		htmls += '<td><button id="cancel_edit" onclick="cancel('+temp+');">cancel</button></td>';
		htmls += '</tr>';
		$('#'+reply_id+'before').replaceWith(htmls);
		$('#reply_edit_content').focus();
	}
	function confirm_edit(reply_id){
		var url = 'http://localhost:8080/ProjectSample003/reply/edit_confirm';
		$.ajax({
			async : true,
			method : 'post',
			url : url,
			data : JSON.stringify({
				reply_id : reply_id, 
				reply_content : $('#reply_edit_content').val()
			}),
			dataType : 'text',
			contentType : 'application/json',
			beforeSend : function(){
				console.log('sending reply edit request...');
			},
			success : function(data) {
				location.reload();
			},
			error : function(data) {
				alert('error');
				location.reload();
			}
		})
	}
	function cancel(reply_id, member_name, content, cre_date){
		a = reply_id;
		b = member_name;
		c = content;
		d = cre_date;
		var temp = `a, b, c, d`;
		var htmls = '';
		htmls += '<tr id="'+reply_id+'before">';
		htmls += '<td>'+member_name+'</td>';
		htmls += '<td>'+content+'</td>';
		htmls += '<td>'+cre_date+'</td>';
		htmls += '<td><button id="edit_rep_'+reply_id+'" onclick="edit_comment('+temp+');">edit</button></td>';
		htmls += '<td><button id="delete_rep_'+reply_id+'" onclick="delete_comment('+reply_id+');">delete</button></td>';
		htmls += '</tr>';
		$('#'+reply_id+'after').replaceWith(htmls);
		$('#'+reply_id+'before').focus();
	}
	/* 댓글삭제 */
	function delete_comment(reply_id){
		if(${login_name ne null}){
			var result = confirm("Do you want to delete this comment?");
			if(result){
				var url = 'http://localhost:8080/ProjectSample003/reply/delete';
				$.ajax({
					async : true,
					method : 'post',
					url : url,
					data : JSON.stringify({
						reply_id : reply_id
					}),
					dataType : 'text',
					contentType : 'application/json',
					beforeSend : function(){
						console.log('sending reply edit request...');
					},
					success : function(data) {
						location.reload();
					},
					error : function(data) {
						alert('error');
						location.reload();
					}
				})
			}
			
			
		}
	}
	
	/* $(document).ready(function(){
		var url = 'http://localhost:8080/ProjectSample003/viewFile';
		$.ajax({
			async : true,
			method : 'post',
			url : url,
			data : JSON.stringify({
				file_name : ${detail.chg_file_name }
			}),
			dataType : 'text',
			contentType : 'application/json',
			beforeSend : function(){
				console.log('sending request...');
			},
			success : function(data) {
			},
			error : function(data) {
				alert('error');
			}
		})
	}); */
	</script>
</body>
</html>