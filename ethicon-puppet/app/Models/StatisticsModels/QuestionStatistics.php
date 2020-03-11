<?php
namespace App\Models\StatisticsModels;
use App\Models\ParentModel;
use DB;
/**
 * model
 * @author puppet
 */
class QuestionStatistics extends ParentModel{
  /**
   * 与模型关联的数据表。
   *
   * @var string
   */
  protected $table = 'question_statistics';

  /**
   * DB::直接操作的数据库表名
   * @var string
   */
  protected $db_table = 'pt_question_statistics';

  /**
   * 主键 默认id。
   *
   * @var string
   */
  protected $primaryKey = 'id';

  /**
   * 指定是否模型应该被戳记时间。
   *
   * @var bool
   */
  public $timestamps = false;
}