<%@ page import="org.BruceGallery.QueStack.Controller.Question" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Question.keywordSearch("", "", "", "", "", "", "", "", 1, 50);
%>


<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Bootstrap, from Twitter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
        }

        #page_container{
            align:center;
            width:100%;
        }

        #qstn_lst_container,
        .qstn_rec_container,
        #qstn_ans_container,
        #qstn_dtl_container,
        #ans_lst_container,
        .ans_rec_container{
            display: table;
            margin: 0 auto;
        }

        .qstn_rec_title{
            width:700px;
        }

        .qstn_rec_ctlg_name{
            display: inline-block;
            width:380px;
        }

        .qstn_rec_user_id{
            display: inline-block;
            text-align: right;
            width:150px;
        }

        .qstn_rec_ent_time{
            display: inline-block;
            text-align: right;
            width:120px;
        }

        #qstn_dtl_title,
        #qstn_dtl_content{
            width:700px;
        }

        #qstn_dtl_user_id{
            text-align: right;
        }

        #qstn_dtl_ctlg_name{
            display: inline-block;
            width:620px;
        }

        #qstn_dtl_ent_time{
            text-align: right;
        }

        .ans_rec_vote{
            display: inline-block;
            width:50px;
            float: left;
        }

        .ans_rec_content{
            display: inline-block;
            width:650px;
        }

        .ans_rec_user_id{
            display: inline-block;
            text-align: right;
            width:450px;
        }

        .ans_rec_ent_time{
            display: inline-block;
            text-align: right;
            width:200px;
        }

        .meta-item{
            color: #999;
        }

    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="ico/favicon.png">
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">QueStack</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="/">主页</a></li>
                    <li><a href="#about">提出问题</a></li>
                    <li><a href="#contact">高级搜索</a></li>
                </ul>
                <form class="navbar-form pull-right" id="simple_search_form">
                    <input class="span3" type="text" id="simple_search_kwd" placeholder="Keyword">
                    <button type="submit" class="btn">搜索</button>
                </form>
                <form class="navbar-form pull-right" id="login_form">
                    <input class="span2" type="text" placeholder="Email">
                    <input class="span2" type="password" placeholder="Password">
                    <button type="submit" class="btn">登录</button>
                </form>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container">

    <div id="page_container">
        <div id="qstn_lst_container">
            <div class="qstn_rec_container">
                <div class="qstn_rec_title">
                    <h4>
                        How Can Add Remains/vestigial UITabBarItems On UITableView when Click on more button of UITabBar?
                    </h4>
                </div>
                <div id="qstn_rec_container_footer_">
                    <div class="qstn_rec_ctlg_name meta-item">&nbsp&nbsp&nbsp&nbspJava&nbsp-&nbspJDBC</div>
                    <div class="qstn_rec_user_id meta-item">Bruce</div>
                    <div class="qstn_rec_ent_time meta-item">2013-06-21</div>
                </div>
            </div>
        </div>

        <hr>

        <div id="qstn_ans_container">
            <div id="qstn_dtl_container">

                <div id="qstn_dtl_title">
                    <h3>
                        How Can Add Remains/vestigial UITabBarItems On UITableView when Click on more button of UITabBar?
                    </h3>
                </div>
                <div id="qstn_dtl_ctlg_name" class="meta-item">
                    <p>&nbsp&nbsp&nbsp&nbspJava&nbsp-&nbspJDBC</p>
                </div>


                <div id="qstn_dtl_content">
                    XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX
                </div>

                <div id="qstn_dtl_ent_time" class="meta-item">2013-06-21 19:13</div>
                <div id="qstn_dtl_user_id" class="meta-item">Bruce</div>

            </div>


            <hr>

            <div id="ans_lst_container">

                <div class="ans_rec_container">
                    <div class="ans_rec_vote">
                        VOTE

                    </div>

                    <div class="ans_rec_content">XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX XXX
                    </div>

                    <div>
                        <div class="ans_rec_user_id meta-item">Bruce</div>
                        <div class="ans_rec_ent_time meta-item">2013-06-21 19:13</div>
                    </div>
                </div>
                <hr>
            </div>
        </div>
    </div>
    <hr>
    <footer>
        <p>&copy; BruceGallery 2013</p>
    </footer>

</div> <!-- /container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.1.js"></script>
<script src="js/bootstrap.js"></script>


<script type="text/javascript">
    var page_num=1;
    var begin_pos=1;
    var rec_per_page=30;

    function turnPage(){
        page_num++;
        begin_pos=begin_pos+rec_per_page;
    }
</script>


</body>
</html>
