<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../template/title.jsp"%>

<%@ include file="../template/header.jsp"%>

<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${paging.content}" var="location">

				<!-- 관광지 정보 -->
				<div class="col mb-5">
					<div class="card h-100">
						<!-- 관광지 이미지 -->
						<img class="card-img-top" src="${location.firstimage }" onerror="this.onerror=null; this.src='/image/noImage.png'" width="100%" height="200px" alt="..." />
						<!-- 관광지 상세 -->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- 관광지명 -->
								<h5 class="fw-bolder">${location.title }</h5>
								<!-- 관광지 간단한 설명-->
								${location.addr1 }
							</div>
						</div>
						<!-- 상세 페이지로 이동 -->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="/test2?contentId=${location.contentid}">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>



			<!-- 			
			<div class="col mb-5">
				<div class="card h-100">
					
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">인기</div>
					
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
					
					<div class="card-body p-4">
						<div class="text-center">
							
							<h5 class="fw-bolder">관광지명2</h5>
							
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
								<div class="bi-star-fill"></div>
							</div>
							
							간단한 설명2
						</div>
					</div>
					
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">상세보기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					
					<div class="badge bg-dark text-white position-absolute"
						style="top: 0.5rem; right: 0.5rem">Sale</div>
					
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
					
					<div class="card-body p-4">
						<div class="text-center">
							
							<h5 class="fw-bolder">Sale Item</h5>
							
							<span class="text-muted text-decoration-line-through">$50.00</span>
							$25.00
						</div>
					</div>
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
						</div>
					</div>
				</div>
			</div>
			
			 -->
		</div>
		<div class="d-flex justify-content-center">
			<jsp:include page="part_paging.jsp" />
		</div>
	</div>

</section>

<%@ include file="../template/footer.jsp"%>
