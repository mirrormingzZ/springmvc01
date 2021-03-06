<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>后台管理</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/bootstrap-responsive.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/uniform.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/select2.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/matrix-style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/matrix-media.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/colorpicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/datepicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/bootstrap-wysihtml5.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/fonts-googleapis.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/fullcalendar.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/css/fullcalendar.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/admin/font-awesome/css/font-awesome.css" />
</head>
<body>

<script type="text/javascript">
	function goPage(pageIndex){
		
		document.getElementById('pageIndex').value = pageIndex ;
		document.getElementById('formProduct').submit() ;
	}
</script>
	<!--sidebar-menu-->
	<%@ include file="/WEB-INF/jsp/admin/sidebar.jsp" %>
	<!--sidebar-menu-->
	<div id="content">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"> <i class="icon-th"></i>
						</span>
						<h5>产品表</h5>
					</div>
					<form id="formProduct" class="form-horizontal" method="get" action="ProductServlet.do?method=list">
						
						
						<input
						type="hidden" name="pageIndex" id="pageIndex"
						value="${pageView.pageIndex}" />
						<div style="float:right;">
							<span>记录数：</span><select name="pageSize">
								<option <c:if test="${'5' == pageView.pageSize}">selected</c:if>>5</option>
								<option <c:if test="${'10' == pageView.pageSize}">selected</c:if>>10</option>
								<option <c:if test="${'20' == pageView.pageSize}">selected</c:if>>20</option>
							</select>
						</div>
						
						
						<div class="controls">
							<span>产品名称：</span> <input type="text" name="productName"
								value="${pcv.productName}" /> <span>品牌：</span> <select
								style="width: 120px" name="brandId">
								<option value="0">-</option>
								<c:forEach items="${listBrand }" var="brand">
									<option
										<c:if test="${pcv.brandId == brand.brandId}">selected="selected"</c:if>
										value="${brand.brandId}">${brand.name}</option>
								</c:forEach>
							</select> <span>类别：</span> <select style="width: 120px" name="typeDtlId">
								<option value="0">-</option>
								<c:forEach items="${listTypeDetail }" var="typeDetail">
									<option
										<c:if test="${pcv.typeDtlId == typeDetail.typeDtlId}">selected="selected"</c:if>
										value="${typeDetail.typeDtlId}">${typeDetail.typeDtlName}</option>
								</c:forEach>
							</select> <span>上架状态：</span> <select style="width: 100px" name="shelfStat">
								<option value="0">-</option>
								<c:forEach items="${listDictionarySku }" var="dictionarySku">
									<option
										<c:if test="${pcv.shelfStat == dictionarySku.dictionaryDetailCode}">selected="selected"</c:if>
										value="${dictionarySku.dictionaryDetailCode}">${dictionarySku.dictionaryDetaiLabel}</option>
								</c:forEach>
							</select> <span>上市时间：</span> <input type="date" name="timePrevious"
								value="${timePrevious}" style="width: 150px" /> -<input
								type="date" name="timeLater" value="${timeLater}"
								style="width: 150px" value="${timeLater}" /> <input type="submit" value="查询" class="btn btn-success">
						</div>
						<hr>
					</form>
					<a href="ProductServlet.do?method=edit"><button
							class="btn btn-success btn-mini">新增</button></a>
					<hr>
					<div class="widget-content"
						style="position: relative; height: 700px; overflow-y: auto;">
						<table class="table table-bordered table-striped with-check">
							<thead>
								<tr>
									<th>\</th>
									<th>产品名称</th>
									<th>品牌</th>
									<th>分类名称</th>
									<th>上市时间</th>
									<th>上架状态</th>
									<th>好评数</th>
									<th>中评数</th>
									<th>差评数</th>
									<th>销售数量</th>
									<th>默认SKU编号</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<%
									int i = 0;
								%>
								<c:forEach items="${pageView.list }" var="product">
									<tr>
										<td><%=++i%></td>
										<td>${product.name }</td>
										<td>${product.brandName }</td>
										<td>${product.typeDtlName }</td>
										<td>${product.timeToMarket }</td>
										<td>${product.dictionaryDetailLabel }</td>
										<td>${product.evalGoodQty }</td>
										<td>${product.evalGeneralQty }</td>
										<td>${product.evalBadQty }</td>
										<td>${product.saleQty }</td>
										<td>${product.majorSkuCode }</td>
										<td><a
											href="ProductServlet.do?method=edit&productId=${product.productId }">编辑</a>
											<a
											href="ProductServlet.do?method=delete&productId=${product.productId }">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
										<div class="pagination">
											<ul class="">
												<c:forEach begin="0" end="${pageView.pageCount-1 }"
													varStatus="status">
													<li class=""><a href="javascript:goPage(${status.index })">${status.index + 1}</a></li>
												</c:forEach>
												
												<li><a><span>总记录数:${pageView.recordCount }</span></a></li>
												<li><a><span>总页数:${pageView.pageCount }</span></a></li>
											</ul>
										</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end-Footer-part-->
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/jquery.ui.custom.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/bootstrap-colorpicker.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/bootstrap-datepicker.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/jquery.toggle.buttons.html"></script>
	<script src="<%=request.getContextPath()%>/resource/admin/js/masked.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/jquery.uniform.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/select2.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/admin/js/matrix.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/matrix.form_common.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/wysihtml5-0.3.0.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/jquery.peity.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resource/admin/js/bootstrap-wysihtml5.js"></script>
	<script>
		$('.textarea_editor').wysihtml5();
	</script>
</body>

</html>