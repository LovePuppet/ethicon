<?php

namespace App\Http\Controllers\Home;
use App\Http\Controllers\Controller;
use App\Models\RobotModels\Robot;
use App\Models\WechatModels\Record;
use Mail;
use Log;
use DB;
use App\Components\Tools;
use Illuminate\Support\Facades\Cookie;
class TestController extends Controller{
    public function __construct() {
        //Log::info('[file:'.__FILE__.']'.'[func:'.__FUNCTION__.']'.'[line:'.__LINE__.']:in.',['get='=>$_GET,'post='=>$_POST]);
    }
    /**
     * 测试
     */
    public function index(){
      exit;
        echo \App\Components\WxTools::getCustomList();
        exit;
//        $data = ['fid'=>1,'lang'=>1];
        $data = ['is_end'=>1];
        $result = Tools::wxMsgRecord('123456789',$data);
        dd($result);exit;
//        $sPost = '{"ToUserName":"gh_ad38c745411c","FromUserName":"oWEgF1s362hSuxWtPJ1ZQ_BUuxGY","CreateTime":"1532443133","MsgType":"event","Event":"subscribe","EventKey":{}}';
//        $oPost = json_decode($sPost);
//        $content = '[{"msgtype":"text","content":"lZUyP1"},{"msgtype":"text","content":""},{"msgtype":"text","content":""}]';
//        $result = \App\Components\WxSend::multipleMsgSend($oPost,$content);
//        dd($result);exit;
        $news = '{"item":[{"media_id":"jCDZhRx-dnrMUjZGR8ApoCq9iDUITmKtxNGb-Z0GJfA","content":{"news_item":[{"title":"测试一下","author":"puppet","digest":"测试一下","content":"<p>测试一下<\\/p>","content_source_url":"http:\\/\\/xzb_admin.xiaozhangbang.org","thumb_media_id":"jCDZhRx-dnrMUjZGR8ApoALHef4kUDYnDBNh7eSkGc0","show_cover_pic":0,"url":"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzU5MDY3MDQyNA==&mid=100000030&idx=1&sn=f55de8cb5c2b19cfa343a7b43bc068fc&chksm=7e3bfe29494c773f4379667a1e526b9f56035ee909104bd2307a2549b7f111c74122026fd191#rd","thumb_url":"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/kUrzda0dMdlKAEQict4ickXmicZIXl4rOFc6vK8UqViafIcajVqgfz4icuXymVTlPbibkicEEFBTmfbGYRHLm19whTu5g\\/0?wx_fmt=jpeg","need_open_comment":0,"only_fans_can_comment":0},{"title":"嘉宾-会员票","author":"","digest":"嘉宾-会员票","content":"<p>嘉宾-会员票<\\/p>","content_source_url":"","thumb_media_id":"jCDZhRx-dnrMUjZGR8ApoCKIKaIk5Tp1t1GgLcazwvE","show_cover_pic":0,"url":"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzU5MDY3MDQyNA==&mid=100000030&idx=2&sn=bdf35b4f476b87173163c397f2aaf622&chksm=7e3bfe29494c773f1c9b1916604489c18bce582c7bbfcf717fcb8551d77862b169710c840aa2#rd","thumb_url":"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/kUrzda0dMdlKAEQict4ickXmicZIXl4rOFc386jQA46n45TY5L4KWlRX1uAzNaqoOHL9tOurggNtEBqr9eFsaKHIA\\/0?wx_fmt=jpeg","need_open_comment":0,"only_fans_can_comment":0}],"create_time":1531823408,"update_time":1531823408},"update_time":1531823408},{"media_id":"jCDZhRx-dnrMUjZGR8ApoN5_zWogZ7QaAqTcYqjfvBo","content":{"news_item":[{"title":"谱软科技","author":"puppet","digest":"上海谱软信息科技有限公司于2014年11月28日在闵行区市场监督管理局登记成立。法定代表人李芙蓉，公司经营范","content":"<p><span style=\\"color: rgb(51, 51, 51);font-family: arial, 宋体, sans-serif;font-size: 14px;text-indent: 28px;background-color: rgb(255, 255, 255);\\">上海谱软信息科技有限公司于2014年11月28日在闵行区市场监督管理局登记成立。法定代表人李芙蓉，公司经营范围包括从事信息科技、计算机科技领域内的技术开发等。<\\/span><\\/p><p><img class=\\"\\" data-copyright=\\"0\\" data-ratio=\\"0.5042016806722689\\" data-src=\\"https:\\/\\/mmbiz.qpic.cn\\/mmbiz_png\\/kUrzda0dMdlYdRbRibpFcJnkjd9JIU8n84nXcBLxiapuhEsn1at217LOclMKkty4fmlb66tIx11icVwaU1WFLibqng\\/640?wx_fmt=gif\\" data-type=\\"gif\\" data-w=\\"595\\" style=\\"\\"  \\/><\\/p>","content_source_url":"https:\\/\\/www.baidu.com","thumb_media_id":"jCDZhRx-dnrMUjZGR8ApoJgo7uA8e8P_1qh-4ouPsZc","show_cover_pic":0,"url":"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzU5MDY3MDQyNA==&mid=100000027&idx=1&sn=2977803d1b8d204f98bfa0df42ac2455&chksm=7e3bfe2c494c773a8941e117e437f8d5cfb3a99f2f20a286e8ac9bd6b0a853be4e356ec85942#rd","thumb_url":"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/kUrzda0dMdmpU0aGCvIK3DMSbSxbZUK9j8ibn1rdricgibHcLOontHkGFuxhbdvtLXSm1Cxnckc5yMvViaL6gLuNHw\\/0?wx_fmt=jpeg","need_open_comment":0,"only_fans_can_comment":0},{"title":"分享图片","author":"","digest":"","content":"","content_source_url":"","thumb_media_id":"0HsnDrdKWh9mBGT-xNd3pVvK5PeDDnGAVsmn1D_H1oY","show_cover_pic":0,"url":"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzU5MDY3MDQyNA==&mid=100000027&idx=2&sn=ac28ff33529fc178bca295c4d98fc518&chksm=7e3bfe2c494c773ae8292d8e72253666be2f6d422f28c004a4b8d3fcfedcaa766dbf1669ba7a#rd","thumb_url":"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/kUrzda0dMdmpU0aGCvIK3DMSbSxbZUK99f1Gx3MiapLyFnfqSePOnibMnsJXkXhLXicsRAb6c5ZrxXkptaY9GNvOw\\/0","need_open_comment":0,"only_fans_can_comment":0},{"title":"2018发发发","author":"puppet","digest":"2018发发发","content":"<p>2018发发发<\\/p>","content_source_url":"","thumb_media_id":"jCDZhRx-dnrMUjZGR8ApoCuR9jj6o7U6IDHGvrOv3FM","show_cover_pic":0,"url":"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzU5MDY3MDQyNA==&mid=100000027&idx=3&sn=d33a023bb6fda3b0079eb1442450dc36&chksm=7e3bfe2c494c773a63af6e2357b659f687b2735e1fc30443a059acd4d90bb48921df8ee45760#rd","thumb_url":"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/kUrzda0dMdmpU0aGCvIK3DMSbSxbZUK9F5FB6WwK8DH69ScbJpEIPsVL4TaSpUzlFHD66JBS4k5XZmQHibfcrnA\\/0?wx_fmt=jpeg","need_open_comment":0,"only_fans_can_comment":0}],"create_time":1531735573,"update_time":1531735612},"update_time":1531735612},{"media_id":"jCDZhRx-dnrMUjZGR8ApoLCYxyZbDF-rJ3x890mB1Q8","content":{"news_item":[{"title":"这是测试","author":"Lasei","digest":"测试文章","content":"<p>测试文章<\\/p>","content_source_url":"","thumb_media_id":"jCDZhRx-dnrMUjZGR8ApoNvBJ50nslAYl3QpC_uGPXg","show_cover_pic":0,"url":"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MzU5MDY3MDQyNA==&mid=100000004&idx=1&sn=64ab4037c729b4ed7fce5ad84cfc96a1&chksm=7e3bfe33494c772507e4578d1cdf4381ea843a0ae852a3059ca8f539dbc5baa9cf18de32c438#rd","thumb_url":"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/kUrzda0dMdlYdRbRibpFcJnkjd9JIU8n80Y0YkeKn8tkibHia5G7iaibrdy2hK5naz7OxLG4wJJmrdacBV8OBeIXvdA\\/0?wx_fmt=jpeg","need_open_comment":0,"only_fans_can_comment":0}],"create_time":1531643518,"update_time":1531643518},"update_time":1531643518}],"total_count":3,"item_count":3}';
        $news_arr = json_decode($news,true);
        dd($news_arr);exit;
        $json = '{"button":[{"name":"test","sub_button":[{"name":"test1","type":"click","key":"1FBLH4"},{"name":"test2","type":"click","key":"15kzc4"},{"name":"test3","type":"media_id","media_id":"jCDZhRx-dnrMUjZGR8ApoNNnIAjIM-RK7O9WRdhZD4Q"},{"name":"test4","type":"media_id","media_id":"jCDZhRx-dnrMUjZGR8ApoCq9iDUITmKtxNGb-Z0GJfA"},{"name":"test5","type":"view","url":"https:\\/\\/www.baidu.com"}]},{"name":"\\u5b98\\u7f51","sub_button":[{"name":"\\u5b98\\u7f511","type":"view","url":"https:\\/\\/www.baidu.com"},{"name":"\\u5b98\\u7f512","type":"view","url":"https:\\/\\/www.baidu.com"},{"name":"\\u5b98\\u7f513","type":"view","url":"https:\\/\\/www.baidu.com"},{"name":"\\u5b98\\u7f514","type":"view","url":"https:\\/\\/www.baidu.com"},{"name":"\\u5b98\\u7f515","type":"media_id","media_id":"jCDZhRx-dnrMUjZGR8ApoC-gnGKWavQUdQRWBoXXHbU"}]},{"name":"\\u54c1\\u724c\\u7279\\u6548","type":"media_id","media_id":"jCDZhRx-dnrMUjZGR8ApoN5_zWogZ7QaAqTcYqjfvBo"}]}';
//        $arr = json_decode($json,true);
        dd($json);
        exit;
        echo \App\Components\Tools::passwordEncryption('123456');
        exit;
    }
}
