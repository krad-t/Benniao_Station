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
    <link rel="stylesheet" type="text/css" href="../../lib/bootstrapvalidator-master/src/css/bootstrapValidator.css"
          rel="external nofollow"/>
    <script src="../../lib/bootstrapvalidator-master/src/js/bootstrapValidator.js"></script>

</head>

<html>
<!-- 列表 -->
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">我管理的快递</h3>
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
                        <a role="menuitem" class="a-select" data-type="按出库日期" tabindex="-1" href="javascript:void(0)">按出库日期</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="按快递公司" tabindex="-1" href="javascript:void(0)">按快递公司</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="按用户电话" tabindex="-1" href="javascript:void(0)">按用户电话</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="按状态" tabindex="-1" href="javascript:void(0)">按状态</a>
                    </li>
                    <li role="presentation" class="divider"></li>
                    <li role="presentation">
                        <a role="menuitem" class="a-select" data-type="" tabindex="-1"
                           href="javascript:void(0)">清空搜索条件</a>
                    </li>
                </ul>
            </li>
            <li>
                <div class="input-group">
                    <form method="post" action="search">
                        <input type="text" id="searchInput" class="form-control" name="content" value="" placeholder="">
                        <input type="hidden" id="searchInputHidden" class="form-control" name="type" value="">
                        <span class="input-group-btn">
                                <input class=" btn btn-primary" type="submit" value="搜索"><i
                                class="glyphicon glyphicon-search"></i></input>
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
                <th>出库日期</th>
                <th>快递公司</th>
                <th>用户电话</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${parcelList}" var="parcel">
                <tr style="${parcel.status==0?"background-color: rgba(29, 158, 53, 0.6);":"background-color: rgba(29, 158, 53, 0.3);color: rgba(128, 128, 128, 0.5)"}">
                    <td>${parcel.code}</td>
                    <td>${parcel.int_time}</td>
                    <td>${parcel.out_time}</td>
                    <td>${parcel.company}</td>
                    <td>${parcel.user_phone}</td>
                    <td>${parcel.status==0?"未取件":"已取件"}</td>
                    <td>
                        <button class="btn btn-warning" data-toggle="modal" data-target="#parcelModal"
                                data-eid="${parcel.eid}"
                                data-username="${parcel.username}"
                                data-code="${parcel.code}"
                                data-int_time="${parcel.int_time}"
                                data-out_time="${parcel.out_time}"
                                data-company="${parcel.company}"
                                data-user_phone="${parcel.user_phone}"
                                data-status="${parcel.status}"
                        >修改包裹信息
                        </button>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#parcelModal1"
                                data-eid="${parcel.eid}"
                                data-username="${parcel.username}"
                                data-code="${parcel.code}"
                                data-int_time="${parcel.int_time}"
                                data-out_time="${parcel.out_time}"
                                data-company="${parcel.company}"
                                data-user_phone="${parcel.user_phone}"
                                data-status="${parcel.status}"
                        >包裹二维码
                        </button>
                    </td>
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
                <h4 class="modal-title" id="myModalLabel">修改包裹信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" name="parcelInfoForm" action="updateParcelInfo">
                    <div class="form-group">
                        <label for="eid" class="col-sm-2 control-label">快递编号</label>
                        <input type="text" disabled id="eid" class="form-control" name="eid" >
                        <input type="hidden" id="eid_hid" class="form-control" name="eid" >
                    </div>
                    <div class="form-group">
                        <%--换成单选框--%>
                        <label class="col-sm-2 control-label">状态</label>
                        <label class="col-sm-2 control-label"><input type="radio" class="status" name="statusCode" value="0">未取件</label>
                        <label class="col-sm-2 control-label"><input type="radio" class="status" name="statusCode" value="1">已取件</label>
                    </div>
                    <div class="form-group">
                        <label for="code" class="col-sm-2 control-label">取件码</label>
                        <input type="text" id="code" class="form-control" name="code">
                    </div>
                    <div class="form-group">
                        <label for="int_time" class="col-sm-2 control-label">入库时间</label>
                        <input type="text" id="int_time" class="form-control" name="int_time">
                    </div>
                    <div class="form-group">
                        <label for="out_time" class="col-sm-2 control-label">出库时间</label>
                        <input type="text" id="out_time" class="form-control" name="out_time">
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">快递公司</label>
                        <input type="text" id="company" class="form-control" name="company">
                    </div>
                    <div class="form-group">
                        <label for="company" class="col-sm-2 control-label">用户电话</label>
                        <input type="text" id="user_phone" class="form-control" name="user_phone">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="submitbtn" class="btn btn-success">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="parcelModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">包裹二维码</h4>
            </div>
            <div class="modal-body">
                <a class="QRcode" href="${pageContext.request.contextPath}/showParcelQRCode?parcel=">
                    <img id="img" class="QRcode" src = "${pageContext.request.contextPath}/showParcelQRCode?parcel=">
                </a>

            </div>
            <div class="modal-footer">
                <button type="button" id="submitbtn1" class="btn btn-success">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
    /*模态框1回填信息*/
    $('#parcelModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var modal = $(this)
        var code = button.data("code")
        var int_time = button.data("int_time")
        var out_time = button.data("out_time")
        var company = button.data("company")
        var user_phone = button.data("user_phone")
        var status = button.data("status")
        var eid = button.data("eid")
        var username = button.data("username")

        modal.find('#eid').val(eid)
        modal.find('#eid_hid').val(eid)
        modal.find('#code').val(code)
        modal.find('#int_time').val(int_time)
        modal.find('#out_time').val(out_time)
        modal.find('#company').val(company)
        modal.find('#user_phone').val(user_phone)

        var status_radio = modal.find('.status')
        for (var i = 0; i < status_radio.length; i++) {
            if (status == $(status_radio.get(i)).val()) {
                $(status_radio.get(i)).prop('checked', true)
            }
        }

        modal.find('#eid').val(eid)
        modal.find('#username').val(username)

    });
    /*选择搜索条件*/
    $('.a-select').click(function (event) {
        event.defaultPrevented
        var str = $(this).data("type")
        $('#searchInput').attr('placeholder', str)
        $('#searchInputHidden').attr('value', str)
    });
    /*表单提交*/
    $('#submitbtn').click(function(){
        $("form[name='parcelInfoForm']").submit();
    });
    /*模态框2刷新二维码信息*/
    $('#parcelModal1').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var modal = $(this)
        var eid = button.data("eid")
        alert(eid)
        modal.find('.QRcode').attr("src","${pageContext.request.contextPath}/showParcelQRCode?parcel="+eid)
    });
</script>
</html>

