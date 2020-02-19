<@override name="title">板块列表</@override>
<@override name="content">
<!--快速生成
生成3行2列的表格
使用乘法规则定义行列的数目，输入如下：
table>tr*3>td*2【此时按下Tab（制表键），输入内容中间和后面都不能留有空格和换行等内容】
-->
    <table boder="1" class="list grid">
        <thead><!--表头--->
            <tr><!--行--->
                <th>ID</th><!--表头中的列-->
                <th>名称</th>
            </tr>
        </thead>
        <tbody><!--表尾，因为个数不确定，所以利用《#list》显示-->
            <#list categories as category>

            <!-- alt+回车 选择第二项用注释的方式说明categories的类型，在最上面
            这样的话，category.就会自动出现参数，这个不是必须的-->
        <tr>
        <tr><!--表尾中的列-->
            <td>${category.id}</td>
            <td>${category.name}</td>
            <!-- category.getPlateName() 上述{}中也可以写成这样-->
            <!-- a href="/category/modify?id=x"-->
            <td><a href="${base}/category/modify/${category.id}">Modify</a>|
                <a href="${base}/category/delete/${category.id}">Delete</a></td>
        </tr>
            </#list>
        </tbody>
    </table>
<div>
    <a href="${base}/category/add">Add Category</a>
</div>
</@override>
<@extends name="../layout.ftl"></@extends>