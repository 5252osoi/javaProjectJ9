<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine","\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Instagram clone</title>
	<jsp:include page="/include/bs4.jsp"/>
	<!--아이콘,css-->
	<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
	<jsp:include page="/include/style.jsp"/>
	<!---->
	<script>
		'use strict';
		
		//현재 스크롤 위치 저장
		let lastScroll = 0;
		let curPage = 1;
		//무한스크롤 
		$(document).scroll(function(e){
		   
		    var currentScroll = $(this).scrollTop();					//현재 높이 저장
		    var documentHeight = $(document).height();					//전체 문서의 높이
		    var nowHeight = $(this).scrollTop() + $(window).height();	//(현재 화면상단 + 현재 화면 높이)
		    
		    //스크롤이 아래로 내려갔을때만 해당 이벤트 진행.
		    if(currentScroll > lastScroll){
		        //nowHeight을 통해 현재 화면의 끝이 어디까지 내려왔는지 파악가능 
		        //즉 전체 문서의 높이에 일정량 근접했을때 글 더 불러오기)
		        if(documentHeight < (nowHeight + (documentHeight*0.1))){
		            console.log("다음 페이지 가져오기");
		            curPage++;
		            getList(curPage);
		        }
		    }
		    //현재위치 최신화
		    lastScroll = currentScroll;
		});
		// 스크롤 했을때 다음 리스트 불러오기
		function getList(curPage) {
			$.ajax({
				type: "post",
				url : "scrollPage.po",
				data :{	"curPage" 		: curPage,
						"order" 		: "scrollPage"},
				success:function(res){
		        	//서버에서 전송된 데이터를 nextPost 에 추가하기
					$("#nextPost").append(res);
				},
				error : function(){
	                alert("불러오기 실패");
	            }
			});
		}
		
	    function fCheck() {
	    	let fName = document.getElementById("file").value;
	    	let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
	    	let maxSize = 1024 * 1024 * 30;   // 1KByte=1024Byte=10^3Byte=2^10Byte, 1MByte=2^20Byte=10^6Byte, 1GByte=2^30Byte=10^9Byte, 1TByte=2^40Byte=10^12Byte)
	    	
	    	if(fName.trim() == "") {
	    		alert("업로드할 파일을 선택하세요!");
	    		return false;
	    	}
	    	
	    	let fileSize = document.getElementById("file").files[0].size;
	    	
	    	$('#fileSize').val(fileSize);
	    	
	    	if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'zip' && ext != 'hwp' && ext != 'ppt' && ext != 'pptx' && ext != 'xlsx') {
	    		alert("업로드 가능한 파일은 'jgp/gif/png/zip/hwp/ppt/pptx/xlsx' 만 가능합니다.");
	    	}
	    	else if(fileSize > maxSize) {
	    		alert("업로드할 파일의 최대용량은 30MByte입니다.");
	    	}
	    	else {
	    		myform.submit();
	    	}
	    	
	    }

	    

		//모달 내부에서 파일넣기 버튼을 누르면 hidden속에있는 파일 버튼넣어짐
		function clickFilebtn(){
			document.getElementById('file').click();
		}
		
		//모달창이 닫힐때 안에 있는 내용 초기화하기(새로고침)
		$(document).ready(function(){
			$('.modal').on('hidden.bs.modal', function () {
				location.reload();
			});
		});
		
		//파일을 넣으면 모달창에 이미지 띄우기
	    $(function(){
	    	$("#file").on("change", function(e){
	    		// 그림파일 체크
	    		let files = e.target.files;
	    		let filesArr = Array.prototype.slice.call(files);
	    		
	    		//console.log('filesArr',filesArr);
	    		
	    		filesArr.forEach(function(f){
	    			if(!f.type.match("image.*")) {
	    				alert("업로드할 파일은 이미지파일만 가능합니다.");
	    			}
	    		});
	    		
	    		// 멀티파일 이미지 미리보기
	    		let i = e.target.files.length;
	    		//들어온 파일의 갯수가 null이 아니면 #modalDemo안의 내용을 지우고 다시 출력
	    		if(i!=null){
					let strDemo='';
	    			strDemo+='<div class="w3-content w3-display-container d-inline-flex align-items-center" style="overflow:auto; height:655px;"> ';
	    			strDemo+='<div class="w-100 h-100" id="mdlDemo" >';
	    			strDemo+='</div>';
	    			strDemo+='</div>';
	    			
	    			$('#modalDemo').html(strDemo);
	    			
		    		for(let image of files) {
						let img = document.createElement("img");
		    			let reader = new FileReader();
		    			reader.onload = function(e) {
		    				img.setAttribute("src", e.target.result);
		    				img.setAttribute("width", 200);
		    			}
		    			reader.readAsDataURL(e.target.files[--i]);
		    			document.querySelector("#mdlDemo").append(img);
		    		}
	    		}
	    	});
	    });
	    function editPost(idx,content) {
	    	$("#edit-modal #idx").val(idx);
	    	$("#edit-modal #content").val(content);
	    	console.log(idx);
	    } 
	    
	    
	    function editSubmit(){
			document.getElementById("editForm").submit();
	    }
	    
	    
	    //포스트 삭제
	    function deletePost(idx){
	    	let ans = confirm("이 게시물을 삭제하시겠어요?");
	    	if(!ans) return false;
	    	$.ajax({
	    		url  : "postDelete.po",
	    		type : "post",
	    		data : {idx : idx},
	    		success:function(res) {
	    			if(res == "1") {
	    				alert("포스트를 삭제했습니다.");
	    				location.reload();
	    			}
	    			else alert("포스트삭제실패ㅋㅋ");
	    		},
	    		error : function() {
	    			alert("전송 오류!!");
	    		}
	    	});
	    }
	    
	    //댓글달기
	    function replyCheck() {
	    	let content = $(".comment-box").val();
	    	if(content.trim() == "") {
	    		alert("댓글을 입력하세요!");
	    		$("#content").focus();
	    		return false;
	    	}
	    	let query = {
	    			boardIdx  : ${vo.idx},
	    			mid				: '${sMid}',
	    			nickName	: '${sNickName}',
	    			hostIp		: '${pageContext.request.remoteAddr}',
	    			content		: content
	    	}
	    	
	    	$.ajax({
	    		url  : "boardReplyInput.bo",
	    		type : "post",
	    		data : query,
	    		success:function(res) {
	    			if(res == "1") {
	    				alert("댓글이 입력되었습니다.");
	    				location.reload();
	    			}
	    			else {
	    				alert("댓글 입력 실패~~");
	    			}
	    		},
	    		error : function() {
	    			alert("전송오류!!");
	    		}
	    	});
	    }
	    
	</script>
	<style>
	/*스토리 뜨는곳 625px(고정), 포스트 올라가는 곳 470px(고정), 우측푸터는 300px(1160px미만일때 없어짐,좌측 마진으로 고정됨) */
		@media ( max-width : 1160px) {
			.right-col{
				display:none;
			}
			#s1160 {
				min-width:500px;
				display: flex;
				grid-template-columns: 100% 0%;
			}
			
			.main {
				/* text-align:center; */
				min-width:500px;
			}
			
		}
	</style>
</head>
<body>
	<jsp:include page="/include/header.jsp"/>
	
	    <!-- Story Section Start -->
    <section class="main">
        <div class="wrapper" id="s1160">
            <div class="left-col">
                <div class="status-wrapper">
                    <div class="status-card">
                        <div class="profile-pic"><img src="${ctp}/images/noprofile.png" alt=""></div>
                        <p class="username">user1</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="${ctp}/images/noprofile.png" alt=""></div>
                        <p class="username">user2</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="${ctp}/images/noprofile.png" alt=""></div>
                        <p class="username">user3</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="${ctp}/images/noprofile.png" alt=""></div>
                        <p class="username">user4</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="${ctp}/images/noprofile.png" alt=""></div>
                        <p class="username">user5</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="${ctp}/images/noprofile.png" alt=""></div>
                        <p class="username">user6</p>
                    </div>
                    
                </div>
                
                <!-- First Post -->
                <div id="nextPost">
                	<c:forEach var="vo" items="${vos}" varStatus="st">
		            	<div class="post">
				            <div class="info">
				                <div class="user">
				                    <div class="profile-pic">
				                        <img src="${ctp}/images/noprofile.png" alt="photo">
				                    </div>
				                    <p class="username">${vo.mid}</p>
				                </div>
				                <!-- 작성자아이디 = 세션아이디 일때 수정,삭제기능 -->
				                <c:if test="${sMid==vo.mid || sMid=='admin'}">
					                <div class="dropdown dropright">
					                    <button class="btn btn-main btn-light btn-sm dropdown-toggle" data-toggle="dropdown">
					                        <i class="ri-more-fill m-0 p-0"></i>
					                    </button>
					                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink"  style="width:50px;">
					                    	<c:if test="${sMid==vo.mid}">
							                    <li><button data-toggle="modal" data-target="#edit-modal" onclick="editPost('${vo.idx}','${vo.content}')" class="dropdown-item post_edit">수정</button></li>
					                    	</c:if>
						                    <li><a class="dropdown-item post_delete" href="javascript:deletePost(${vo.idx})">삭제</a></li>
					                    </ul>
					                </div>
				                </c:if>
				                <!--  -->
				            </div>
				            <img src="${ctp}/images/severPostImg/${vo.fSName}" style="object-fit:contain"class="post-image" alt="${vo.fName}">
				            <div class="post-content">
				                <div class="reaction-wrapper d-flex">
				     				<button class="btn btn-sm btn-light btn-main"><i class="ri-heart-line m-1"></i></button>
				                    <button class="btn btn-sm btn-light btn-main"><i class="ri-chat-3-line m-1"></i></button>
				                    <button class="btn btn-sm btn-light btn-main"><i class="ri-send-plane-2-line m-1"></i></button>
					                <button class="btn btn-sm btn-light btn-main ml-auto"><i class="ri-bookmark-line m-1"></i></button>
				                </div>
				                <p class="likes text-start"><c:if test="${vo.likes!=0}">좋아요 ${vo.likes}개</c:if></p>
				                <p class="description">${fn:replace(vo.content,newLine,'<br/>')}</p>
				                <p class="post-time"></p>
				            </div>
				            <div class="comment-wrapper">
				                <img src="#" class="icon" alt="">
				                <form name="comment-form">
					                <input type="text" class="comment-box" placeholder="댓글 달기...">
					                <button class="comment-btn" onclick="replyCheck(${vo.idx})"><b>게시</b></button>
				                </form>
				            </div>
			        		<hr/>
			        	</div>
                	</c:forEach>
		        </div>
		        <!-- 새로운 글 추가 -->
            </div>
            
    <!-- Story Section End -->

    <!-- right Sidebar Section Start --> 
        <div class="right-col">
            <div class="profile-card">
                <div class="profile-pic">
                	<a>
	                    <img src="${ctp}/images/noprofile.png" alt="내 프로필사진">
                	</a>
                </div>
                <div>
                    <p class="username">${sMid}</p>
                    <p class="sub-text">${sName}</p>
                </div>
            </div>
            <p class="suggestion-text">회원님을 위한 추천</p>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="${ctp}/images/noprofile.png" alt="">
                </div>
                <div>
                    <p class="username">추천인아이디</p>
                    <p class="sub-text">팔로워 이름</p>
                </div>
                <button class="action-btn">팔로우</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="${ctp}/images/noprofile.png" alt="">
                </div>
                <div>
                    <p class="username">추천인아이디</p>
                    <p class="sub-text">팔로워 이름</p>
                </div>
                <button class="action-btn">팔로우</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="${ctp}/images/noprofile.png" alt="">
                </div>
                <div>
                    <p class="username">추천인아이디</p>
                    <p class="sub-text">팔로워 이름</p>
                </div>
                <button class="action-btn">팔로우</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="${ctp}/images/noprofile.png"  alt="">
                </div>
                <div>
                    <p class="username">추천인아이디</p>
                    <p class="sub-text">팔로워 이름</p>
                </div>
                <button class="action-btn">팔로우</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="${ctp}/images/noprofile.png" alt="">
                </div>
                <div>
                    <p class="username">추천인아이디</p>
                    <p class="sub-text">팔로워 이름</p>
                </div>
                <button class="action-btn">팔로우</button>
            </div>
        </div>
    </div>
    </section>
    <!-- right Sidebar Section End -->
    
    <!-- 게시글을 등록하기위한 첫 모달창(이미지 입력) --> 
    <div class="modal fade " id="post-add-modal">
        <span>
	        <button type="button" class="close m-4 modal_close" data-dismiss="modal"><font size="15pt" color="#fff">&times;</font></button>
        </span>
        <div class="modal-dialog modal-xl modal-dialog-centered rounded-3">
            <div class="modal-content">
            	<div class="modal-header">
            		<font size="3pt" class="modal-title col-12 text-center"><b>새 게시물 만들기</b></font>
            	</div>
            	<!-- 모달내부에서 폼 입력하기 -->
                <div class="modal-body">
                    <form id="myform" method="post" action="postUpload.po" enctype="multipart/form-data">
                    	<table class="table table-borderless modaltable w-100 h-100">
                    		<tr class="h-100">
                    			<td class="col-8 h-100">
                    				<div class="text-center d-flex flex-column" id="modalDemo">
			                    		<div style="margin-top:120px;">
			                    			<i class="ri-image-add-line" style="font-size:80pt"></i>
			                    		</div>
										<p><font size="5pt">사진 파일을 여기에 업로드하세요</font></p>
			                    		<input type="button" style="width:135px;" class="btn btn-primary btn-sm mx-auto" onclick="clickFilebtn()" value="컴퓨터에서 선택" />
									</div>
									<input style="display:none;" type="file" value="컴퓨터에서 선택" name="fName" id="file" multiple/>
                    			</td>
                    			<td class="col-4">
                    				<div class="profile-card">
						                <div class="profile-pic">
						                    <img src="${ctp}/images/noprofile.png" alt="내 프로필사진">
						                </div>
						                <div>
						                    <p class="username">${sMid}</p>
						                    <p class="sub-text">${sName}</p>
						                    <input type="hidden" id="mid" value="${sMid}"/>
						                    <input type="hidden" id="name" value="${sName}"/>
						                    <input type="hidden" id="fileSize" name="fileSize"/>
						                    <input type="hidden" id="hostIp" name="hostIp" value="${pageContext.request.remoteAddr}"/>
						                </div>
						            </div>
		                    		<textarea rows="10" name="content" id="content" placeholder="내용을 입력하세요..." class="form-control" style="resize:none; border:none;"></textarea>
		                            <div class="hr-sect"><b>준비되셨나요?</b></div>
		                            <button type="button" onclick="fCheck()" class="btn btn-light float-right d-inline-flex align-items-center"><i class="ri-upload-2-fill" title="게시하기"></i><span class="btntext ml-2">게시하기</span></button>
                    			</td>
                    		</tr>
                    	</table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- create Post Modal End  -->


    <!-- Edit Modal Start -->
    <!-- Edit Modal -->

   	<div class="modal fade" id="edit-modal">
   		<span>
	        <button type="button" class="close m-4 modal_close" data-dismiss="modal"><font size="15pt" color="#fff">&times;</font></button>
        </span>
	    <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content"  style="height:500px">
	            <div class="modal-header">
	                <font size="3pt" class="modal-title col-12 text-center"><b>내용 수정</b></font>
	            </div>
	            <div class="modal-body">
                    <form id="editForm" method="post" action="postEdit.po">
                  		<div class="profile-card">
			                <div class="profile-pic">
			                    <img src="${ctp}/images/noprofile.png" alt="내 프로필사진">
			                </div>
			                <div>
			                    <p class="username">${sMid}</p>
			                    <p class="sub-text">${sName}</p>
			                </div>
			            </div>
						<textarea rows="10" name="content" id="content" placeholder="내용을 입력하세요..." class="form-control" style="resize:none; border:none;"></textarea>
						<input type="hidden" name="idx" id="idx" />
                       	<div class="hr-sect"><b>준비되셨나요?</b></div>
                       	<button onclick="editSubmit()" class="btn btn-light float-right d-inline-flex align-items-center"><i class="ri-upload-2-fill" title="수정하기"></i><span class="btntext ml-2">수정하기</span></button>
                    </form>
                </div>
	        </div>
	    </div>
  	</div>
	<!-- Edit Modal End -->	
	

</body>
</html>