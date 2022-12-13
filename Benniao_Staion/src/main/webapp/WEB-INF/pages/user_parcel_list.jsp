<%--
  Created by IntelliJ IDEA.
  User: krad
  Date: 2022/12/8
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../../lib/jquery-3.6.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../lib/bootstrapvalidator-master/src/css/bootstrapValidator.css" rel="external nofollow" />
    <script src="../../libbootstrapvalidator-master/src/js/bootstrapValidator.js"></script>

</head>

<html>
<!-- 列表 -->
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">我的快递</h3>
    </div>
    <div class="panel-body">
        <ul class="nav nav-pills ">
            <li class="dropdown">
                <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
                    搜索条件
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" id="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="按取件码" tabindex="-1" href="javascript:void(0)">按取件码</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="按入库日期" tabindex="-1" href="javascript:void(0)">按入库日期</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="按快递公司" tabindex="-1" href="javascript:void(0)">按快递公司</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="按管理员电话" tabindex="-1" href="javascript:void(0)">按管理员电话</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="按状态" tabindex="-1" href="javascript:void(0)">按状态</a>
                    </li>
                    <li role="presentation" class="divider"></li>
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="" tabindex="-1" href="javascript:void(0)">清空搜索条件</a>
                    </li>
                </ul>
            </li>
            <button id="parcelButton" type="button" class="btn btn-success pull-right"
                    data-toggle="modal"
                    data-target="#parcelModal"
            >展示身份码</button>
            <li>
                <div class="input-group">
                    <form method="post" action="search">
                        <input type="text" id="searchInput" class="form-control" name="content" value="" placeholder="">
                        <input type="hidden" id="searchInputHidden" class="form-control" name="type" value="">
                        <span class="input-group-btn">
                                <input class=" btn btn-primary" type="submit" value="搜索"><i class="glyphicon glyphicon-search"></i></input>
                        </span>
                    </form>

                </div>

            </li>

        </ul>
        <table class="table table-hover">
            <caption>快递包裹一览</caption>
            <thead>
            <tr>
                <th>取件码</th>
                <th>入库日期</th>
                <th>管理员电话</th>
                <th>快递公司</th>
                <th>状态</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items = "${parcelList}" var = "parcel" >
                <tr style="${parcel.status==0?"background-color: rgba(29, 158, 53, 0.60);":"background-color: rgba(29, 158, 53, 0.2);color: rgba(128, 128, 128, 0.3)"}">
                    <td>${parcel.code}</td>
                    <td>${parcel.int_time}</td>
                    <td>${parcel.admin_phone}</td>
                    <td>${parcel.company}</td>
                    <td>${parcel.status==0?"未取件":"已取件"}</td>

                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
<!-- 模态框 -->
<div class="modal fade" id="parcelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">身份二维码信息</h4>
            </div>
            <div class="modal-body">
                <a href="${pageContext.request.contextPath}/showAccountQRCode">
                    <img id="img"  src = "${pageContext.request.contextPath}/showAccountQRCode">
                </a>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 翻页 -->
<ul class="pagination">
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>
<script type="text/javascript">
   // $('dropdown-menu').on("shown.bs.dropdown",function (event) {
   //     var a = $(event.relatedTarget)
   //     a.find("")
   // })
   // $(document).ready(function(){
   /*模态框回填信息*/
       $('.a-select').click(function (event){
           event.defaultPrevented
           var str = $(this).data("type")
           $('#searchInput').attr('placeholder',str)
           $('#searchInputHidden').attr('value',str)
       });
   // });
</script>
</html>

