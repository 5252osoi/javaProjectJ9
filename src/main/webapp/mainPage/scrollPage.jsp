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
				                    <p class="username"><a href="#">${vo.mid}</a></p>
				                </div>
				                <!-- 작성자아이디 = 세션아이디 일때 수정,삭제기능 -->
				                <c:if test="${sMid==vo.mid || sMid=='admin'}">
					                <div class="dropdown">
					                    <a class="dropdown-toggle" data-toggle="dropdown">
					                        <i class="ri-more-fill m-0 p-0"></i>
					                    </a>
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
					            <span class="description">
					            	<a href="#"><b>${vo.mid}</b></a>
					            	${fn:replace(vo.content,newLine,'<br/>')}
					            </span>
				                <p class="post-time">${fn:substring(vo.wDate,0,11)}</p>
				            </div>
				            <!-- 댓글은 해당 글의 idx와 댓글VO의 postIdx가 같으면 출력되게끔 작성 -->
			            	<c:forEach var="rVo" items="${rVos}">
			            		<c:if test="${rVo.postIdx==vo.idx}">
			            		<!-- 댓글 -->
				            		<div class="description col-12">
			            				<a href="#"><b>${rVo.mid}</b></a>
			            				${fn:replace(rVo.content,newLine,'<br/>')}
				            		</div>
			            		</c:if>
			            	</c:forEach>
				            	<!-- 댓글입력 -->
				            <div class="comment-wrapper">
					            <input type="text" class="comment-box" id="comment${vo.idx}" placeholder="댓글 달기...">
					            <button class="comment-btn" onclick="replyCheck(${vo.idx})"><b>게시</b></button>
				            </div>
			        		<hr class="mt-0"/>
			        	</div>
                	</c:forEach>