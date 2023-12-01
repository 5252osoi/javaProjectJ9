<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

					<c:forEach var="vo" items="${vos}" varStatus="st">
		            	<div class="post">
				            <div class="info">
				                <div class="user">
				                    <div class="profile-pic">
				                        <img src="${ctp}/images/noprofile.png" alt="photo">
				                    </div>
				                    <p class="username">${vo.mid}</p>
				                </div>
				                <!-- 작성자아이디 = 세션아이디/admin 일때 수정,삭제기능 -->
				                <c:if test="${sMid==vo.mid || sMid=='admin'}">
					                <div class="dropdown">
					                    <button class="btn btn-main btn-light btn-sm dropdown-toggle" data-toggle="dropdown">
					                        <i class="ri-more-fill m-0 p-0"></i>
					                    </button>
					                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					                      <li><a data-bs-toggle="modal" data-bs-target="#edit-modal" class="dropdown-item post_edit" href="#">수정</a></li>
					                      <li><a class="dropdown-item post_delete" href="#">삭제</a></li>
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
				                <input type="text" class="comment-box" placeholder="댓글 달기...">
				                <button class="comment-btn"><b>게시</b></button>
				            </div>
			        		<hr/>
			        	</div>
                	</c:forEach>