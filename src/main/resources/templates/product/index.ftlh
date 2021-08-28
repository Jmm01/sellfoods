<html>
<#include "../common/header.ftlh">
<body>
<div id="wrapper" class="toggled">
    <#--        边栏-->
    <#include "../common/nav.ftlh">
    <#--        主要内容-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="post" action="http://localhost:8080/sell/seller/product/save">
                        <div class="form-group">
                            <label >名称</label>
                            <input name="productName" type="text" class="form-control" value="${(productInfo.productName) !''}" />
                        </div>
                        <div class="form-group">
                            <label >价格</label>
                            <input name="productPrice" type="text" class="form-control" value="${(productInfo.productPrice)!''}" />
                        </div>
                        <div class="form-group">
                            <label >库存</label>
                            <input name="productStock" type="number" class="form-control" value="${(productInfo.productStock) !''}" />
                        </div>
                        <div class="form-group">
                            <label >描述</label>
                            <input name="productDescription" type="text" class="form-control" value="${(productInfo.productDescription) !''}" />
                        </div>
                        <div class="form-group">
                            <label >图片</label>
                            <img height="100" width="100" src="${(productInfo.productIcon)!''}" alt="">
                            <input name="productIcon" type="text" class="form-control" value="${(productInfo.productIcon) !''}" />
                        </div>
                        <div class="form-group">
                            <label >类目</label>
                            <select name="categoryType" class="form-control">
                                <#list categoryList as category>
                                    <option value="${category.categoryType}"
                                        <#-- ？？是判断如果productInfo.categoryType存在，selected是选中的状态,这里只是为了判断要不要加selected关键字-->
                                        <#if (productInfo.categoryType)?? && productInfo.categoryType == category.categoryType>
                                            selected
                                        </#if>

                                        >${category.categoryName}
                                    </option>
                                </#list>

                            </select>
                        </div>
                        <input hidden type="text" name="productId" value="${(productInfo.productId)!''}">
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>