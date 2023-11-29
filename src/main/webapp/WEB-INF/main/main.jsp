<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		let cnt=1;
		function fCheck() {
	    	let fName1 = document.getElementById("fName1").value;
	    	let title = $("#title").val();
	    	let pwd = $("#pwd").val();
	    	let maxSize = 1024 * 1024 * 30;   // 전체 30MByte 제한
	    	
	    	if(fName1.trim() == "") {
	    		alert("업로드할 파일을 선택하세요!");
	    		return false;
	    	}
	    	else if(title.trim() == "") {
	    		alert("업로드할 파일의 제목을 입력하세요");
	    		return false;
	    	}
	    	else if(pwd.trim() == "") {
	    		alert("비밀번호를 입력하세요");
	    		return false;
	    	}
	    	
	    	// 파일 사이즈 처리
	    	let fileSize = 0;
	    	
	    	for(let i=1; i<=cnt; i++) {
	    		let imsiName = 'fName' + i;
	    		if(isNaN(document.getElementById(imsiName))) {
	    			let fName = document.getElementById(imsiName).value;
		    		if(fName != "") {
		    			fileSize += document.getElementById(imsiName).files[0].size;
		    			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
				    	if(ext != 'jpg' && ext != 'gif' && ext != 'png') {
				    		alert("업로드 가능한 파일은 'jpg/gif/png' 만 가능합니다.");
				    		return false;
				    	}
		    		}
	    		}
	    	}
	    	if(fileSize > maxSize) {
	    		alert("업로드할 파일의 최대용량은 30MByte입니다.");
	    		return false;
	    	} else {
	    		myform.fileSize.value = fileSize;
	    		alert("파일 사이즈 : " + fileSize);
	    		myform.submit();
	    	}
	    	
	    }
		function clickFilebtn(){
			document.getElementById('formFileMultiple').click();
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
                        <div class="profile-pic"><img src="#" alt=""></div>
                        <p class="username">user1</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="#" alt=""></div>
                        <p class="username">user2</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="#" alt=""></div>
                        <p class="username">user3</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="#" alt=""></div>
                        <p class="username">user4</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="#" alt=""></div>
                        <p class="username">user5</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="#" alt=""></div>
                        <p class="username">user6</p>
                    </div>
                    <div class="status-card">
                        <div class="profile-pic"><img src="#" alt=""></div>
                        <p class="username">user7</p>
                    </div>
                </div>
                
                <!-- First Post -->
                <div class="post">
		            <div class="info">
		                <div class="user">
		                    <div class="profile-pic">
		                        <img src="#" alt="photo">
		                    </div>
		                    <p class="username">user</p>
		                </div>
		                <!-- Edit Delete -->
		                <div class="dropdown">
		                    <a class="dropdown-toggle" href="#" data-bs-toggle="dropdown">
		                        <i class="fas fa-ellipsis-h"></i>
		                    </a>
		                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		                      <li><a data-bs-toggle="modal" data-bs-target="#edit-modal" class="dropdown-item post_edit" href="#">Edit</a></li>
		                      <li><a class="dropdown-item post_delete" href="#">Delete</a></li>
		                    </ul>
		                  </div>
		            </div>
		            <img src="" class="post-image" alt="">
		            <div class="post-content">
		                <div class="reaction-wrapper">
		                    <i class="ri-heart-line mr-2"></i>
		                   	<i class="ri-chat-3-line mr-2"></i>
		                    <i class="ri-send-plane-2-line mr-2"></i>
		                    <i class="ri-bookmark-line"></i>
		                </div>
		                <p class="likes text-start">좋아요</p>
		                <p class="description"><span></span></p>
		                <p class="post-time"></p>
		            </div>
		            <div class="comment-wrapper">
		                <img src="#" class="icon" alt="">
		                <input type="text" class="comment-box" placeholder="댓글 달기...">
		                <button class="comment-btn"><b>게시</b></button>
		            </div>
		        </div>
            </div>
    <!-- Story Section End -->

    <!-- right Sidebar Section Start --> 
        <div class="right-col">
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="${ctp}/images/noprofile.png" alt="내 프로필사진">
                </div>
                <div>
                    <p class="username">${sMid}</p>
                    <p class="sub-text">${sName}</p>
                </div>
            </div>
            <p class="suggestion-text">회원님을 위한 추천</p>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="#" alt="">
                </div>
                <div>
                    <p class="username">추천인아이디</p>
                    <p class="sub-text">팔로워 이름</p>
                </div>
                <button class="action-btn">팔로우</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="#" alt="">
                </div>
                <div>
                    <p class="username">추천인아이디</p>
                    <p class="sub-text">팔로워 이름</p>
                </div>
                <button class="action-btn">팔로우</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="#" alt="">
                </div>
                <div>
                    <p class="username">추천인아이디</p>
                    <p class="sub-text">팔로워 이름</p>
                </div>
                <button class="action-btn">팔로우</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="#"  alt="">
                </div>
                <div>
                    <p class="username">추천인아이디</p>
                    <p class="sub-text">팔로워 이름</p>
                </div>
                <button class="action-btn">팔로우</button>
            </div>
            <div class="profile-card">
                <div class="profile-pic">
                    <img src="#" alt="">
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
    
    <!-- create Post Modal Start --> 
    <div class="modal fade " id="post-add-modal">
        <span>
	        <button type="button" class="close m-4" data-dismiss="modal"><font size="15pt" color="#fff">&times;</font></button>
        </span>
        <div class="modal-dialog modal-xl modal-dialog-centered rounded-3">
            <div class="modal-content">
            	<div class="modal-header">
            		<font size="3pt" class="modal-title col-12 text-center"><b>새 게시물 만들기</b></font>
            	</div>
            	<!-- 모달내부에서 폼 입력하기 -->
                <div class="modal-body">
                    <form id="myform">
                    	<table class="table table-borderless modaltable w-100 h-100">
                    		<tr class="h-100">
                    			<td class="col-8 h-100">
                    				<div class="text-center d-flex flex-column" id="modalDemo">
			                    		<div style="margin-top:120px;">
			                    			<i class="ri-image-add-line" style="font-size:80pt"></i>
			                    		</div>
										<p><font size="5pt">사진 파일을 여기에 업로드하세요</font></p>
			                    		<input type="button" style="width:135px;" class="btn btn-primary btn-sm mx-auto" onclick="clickFilebtn()" value="컴퓨터에서 선택" />
										<input style="display:none;" type="file" value="컴퓨터에서 선택" id="formFileMultiple" multiple>
									</div>
                    			</td>
                    			<td class="col-4">
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
		                            <div class="hr-sect"><b>준비되셨나요?</b></div>
		                            <button type="button" class="btn btn-light float-right d-inline-flex align-items-center" ><i class="ri-upload-2-fill" title="게시하기"></i><span class="btntext ml-2">게시하기</span></button>
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
	    <div class="modal-dialog modal-dialog-centered">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h2>Edit Your Post</h2>
	                <button class="btn-close" data-bs-dismiss="modal"></button>
	            </div>
	            <div class="modal-body">
	                <div class="msg"></div>
	                <form action="" id="edit_post">
	                    
	                </form>
	            </div>
	        </div>
	    </div>
  	</div>
	<!-- Edit Modal End -->	
	

</body>
</html>