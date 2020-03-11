<?php
namespace App\Http\Controllers\Statistics;
use App\Http\Controllers\ApiBaseController;
use Illuminate\Http\Request;
use App\Models\StatisticsModels\Form;
use Excel;
class FormAjaxController extends ApiBaseController{
  public function __construct(Request $request) {
    parent::__construct($request);
  }
  /**
    * 列表
    * ajax数据
    */
  public function dataList(){
    $oForm = new Form();
    $result = $oForm->getPageData($this->params);
    echo json_encode($result);
  }
  
  public function exportExcel(){
    $oForm = new Form();
    $data = $oForm->getAllData();
    $cellData[] = ['序号','时间','姓名','医院','职称','专科','手机','手术例数（1年）','腔镜率'];
    if(!empty($data)){
      foreach ($data as $val){
        $cellData[] = [$val['form_id'], date('Y-m-d H:i:s',$val['create_time']),$val['name'],$val['hospital'],$val['title'],$val['specialty'],$val['mobile'],$val['operations_num_one_year'],$val['endoscopic_rate'].'%'];
      }
    }
    Excel::create('基础信息',function($excel) use ($cellData){
      $excel->sheet('info', function($sheet) use ($cellData){
        $sheet->rows($cellData);
      });
    })->export('xlsx');
  }
}

