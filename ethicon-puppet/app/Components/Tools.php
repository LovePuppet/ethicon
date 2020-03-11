<?php
namespace App\Components;
use Cache;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cookie;
use Log;
/**
 * 工具类
 *
 * @author 郭钊林
 */
class Tools {
  private static $allow_url = [
    '/admin',
    '/admin/update/password'
  ];
    
  /**
   * 生成验证码6位随机数
   */
  public static function getVerCode() {
    return rand(100000, 999999);
  }
    
  /**
   * 将对象或者数组里包含的对象全部转成数组
   * @param $array  array or obj
   * @return array
   */
  public static function objectToArray($array) {
    if(is_object($array)) {
      $array = (array)$array;
    }
    if(is_array($array)) {
      foreach($array as $key => $value) {
        $array[$key] = self::objectToArray($value);
      }
    }
    return $array;
  }
    
  /**
   * 验证手机号码的格式是否正确
   */
  public static function verifyMobile($mobile){
    return preg_match("/^1[34578]\d{9}$/",$mobile);
  }
    
  /**
   * 验证邮箱的格式是否正确
   */
  public static function verifyEmail($email){
    return preg_match("/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/",$email);
  }

  /**
   * 后台管理员登录密码加密
   * $password  密码
   * $v_password 需要验证的密码
   */
  public static function passwordEncryption($password,$v_password = ''){
    $result = true;
    if(empty($v_password)){
      $result = md5(env('ADMIN_PASSWORD','puppet').md5($password));
    }else{
      (self::passwordEncryption($v_password) != $password) && $result = false;
    }
    return $result;
  }
    
  /**
   * 所有权限数据
   */
  public static function adminLimits($refresh = false){
    $result = Cache::get('adminLimits');
    if(!empty($result)){
      if($refresh){
        Cache::forget('adminLimits');
        self::adminLimits();
      }
      $result = unserialize($result);
    }else{
      $oAdminLimit = new \App\Models\AdminModels\AdminLimit;
      $result = $oAdminLimit->getAllData();
      $expiresAt = Carbon::now()->addDays(7);//缓存7天
      Cache::put('adminLimitsV2', serialize($result),$expiresAt);
    }
    return $result;
  }
    
  /**
   * 所有角色数据
   */
  public static function adminRoles($refresh = false){
    $result = Cache::get('adminRoles');
    if(!empty($result)){
      if($refresh){
        Cache::forget('adminRoles');
        self::adminRoles();
      }
      $result = unserialize($result);
    }else{
      $oAdminRole = new \App\Models\AdminModels\AdminRole;
      $result = $oAdminRole->getAllData();
      $expiresAt = Carbon::now()->addDays(7);//缓存7天
      Cache::put('adminRolesV2', serialize($result),$expiresAt);
    }
    return $result;
  }
    
  /**
   * 根据权限limit_ids
   * 获取权限名称数组，或者权限url数组
   */
  public static function getAdminLimitsNameOrUrl($limit_ids,$val = 'limit_name'){
    $adminLimits = self::adminLimits();
    $result = [];
    foreach ($adminLimits as $limit){
      if(in_array($limit['admin_limit_id'], $limit_ids)){
        $result[] = $limit[$val];
      }
    }
    return $result;
  }
    
  /**
   * 验证一个url是否有权限访问
   */
  public static function urlLimit($url,$request){
    $result = false;
    if(!empty($url)){
      $url = preg_replace('/\?(\S+)/', '', $url);//正则替换掉url参数 ?id=...&name=...
      $url = preg_replace('/\/\d{0,}$/','',$url);//正则替换掉/1
      $userLimits = [];
      if($request->session()->has('userLimits')){
        $session_limits = $request->session()->get('userLimits');
        $userLimits = !empty($session_limits) ? $session_limits[0] : [];
      }
      if(in_array($url, self::$allow_url) || in_array($url,$userLimits)){
        $result = true;
      }
    }
    return $result;
  }
    
  /**
   * 获取随机字符串
   * @param type $length 字符串长度
   * @return string 字符串
   */
  public static function getRandChar($length){
    $str = null;
    $strPol = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $max = strlen($strPol)-1;
    for($i=0;$i<$length;$i++){
      $str.=$strPol[rand(0,$max)];//rand($min,$max)生成介于min和max两个数之间的一个随机整数
    }
    return $str;
  }
    
  public static function token($user_id){
    return md5(time().$user_id. rand(10000, 99999));
  }

  /**
   * 生成token加密串
   */
  public static function crcToken($token){
    $result = sprintf("%u",crc32($token));
    $show = '';
    while($result  >0){
      $s = $result % 62;
      if($s > 35){
        $s=chr($s+61);
      }elseif($s>9 && $s<=35){
        $s=chr($s+55);
      }
      $show .= $s;
      $result = floor($result / 62);
    }
    return $show;
  }
    
  
  /**
   * 中英文切换
   * 默认英文
   */
  public static function sLang($en_content,$cn_content){
    $result = $en_content;
    $lang = Cookie::get('puppet_lang');
    if($lang == 2){
      $result = $cn_content;
    }
    return $result;
  }
  
  /**
   * 
   * @param type $question_id
   * @param type $key   a,b,c,d,e,f
   * @param type $answers
   */
  public static function questionAnswer($question_id,$key,$answers){
    $result = [0,""];
    if(!empty($answers)){
      foreach ($answers as $answer){
        if($answer['question_id'] == $question_id && $key == $answer['answer']){
          $result[0] = 1;
          $result[1] = $answer['value'];
        }
      }
    }
    return $result;
  }
}